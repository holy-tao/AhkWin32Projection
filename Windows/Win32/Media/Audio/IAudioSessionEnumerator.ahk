#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IAudioSessionEnumerator interface enumerates audio sessions on an audio device.
 * @remarks
 * 
  * If an application wants to be  notified when new sessions are created, it must register its implementation of  <a href="https://docs.microsoft.com/windows/desktop/api/audiopolicy/nn-audiopolicy-iaudiosessionnotification">IAudioSessionNotification</a> with the session manager.  Upon successful registration, the session manager sends create-session notifications to the application in the form of callbacks. These notifications contain a reference to the <a href="https://docs.microsoft.com/windows/desktop/api/audiopolicy/nn-audiopolicy-iaudiosessioncontrol">IAudioSessionControl</a> pointer of the newly created session. 
  * 
  * The session enumerator maintains a list of current sessions by holding references to each session's <a href="https://docs.microsoft.com/windows/desktop/api/audiopolicy/nn-audiopolicy-iaudiosessioncontrol">IAudioSessionControl</a> pointer. However, the session enumerator might not be aware of the new sessions that are reported through <a href="https://docs.microsoft.com/windows/desktop/api/audiopolicy/nn-audiopolicy-iaudiosessionnotification">IAudioSessionNotification</a>. In that case, the application would have access to only a partial list of sessions. This might occur if the <b>IAudioSessionControl</b> pointer (in the callback) is released before the session enumerator is initialized. Therefore,    if an application wants a complete set of sessions for the audio endpoint, the application should maintain its own list. 
  * 
  * The application must perform the following steps to receive session notifications and manage a list of current sessions.
  * 
  * <ol>
  * <li>Initialize COM with the Multithreaded Apartment (MTA) model by calling <c>CoInitializeEx(NULL, COINIT_MULTITHREADED)</c> in a non-UI thread. If MTA is not initialized, the application does not receive session notifications from the session manager.  <div class="alert"><b>Note</b>  Threads that run the user interface of an application should be initialized with the apartment threading model.</div>
  * <div> </div>
  * </li>
  * <li>Activate an <a href="https://docs.microsoft.com/windows/desktop/api/audiopolicy/nn-audiopolicy-iaudiosessionmanager2">IAudioSessionManager2</a> interface from the audio endpoint device. Call <a href="https://docs.microsoft.com/windows/desktop/api/mmdeviceapi/nf-mmdeviceapi-immdevice-activate">IMMDevice::Activate</a> with parameter <i>iid</i> set to <b>IID_IAudioSessionManager2</b>. This call receives a reference to the session manager's <b>IAudioSessionManager2</b> interface in the <i>ppInterface</i> parameter.  </li>
  * <li>Implement the <a href="https://docs.microsoft.com/windows/desktop/api/audiopolicy/nn-audiopolicy-iaudiosessionnotification">IAudioSessionNotification</a> interface to provide the callback behavior.</li>
  * <li>Call <a href="https://docs.microsoft.com/windows/desktop/api/audiopolicy/nf-audiopolicy-iaudiosessionmanager2-registersessionnotification">IAudioSessionManager2::RegisterSessionNotification</a> to register the application's implementation of  <a href="https://docs.microsoft.com/windows/desktop/api/audiopolicy/nn-audiopolicy-iaudiosessionnotification">IAudioSessionNotification</a>.</li>
  * <li>Create and initialize the session enumerator object by calling <a href="https://docs.microsoft.com/windows/desktop/api/audiopolicy/nf-audiopolicy-iaudiosessionmanager2-getsessionenumerator">IAudioSessionManager2::GetSessionEnumerator</a>. This method generates a list of current sessions available for the endpoint and adds the <a href="https://docs.microsoft.com/windows/desktop/api/audiopolicy/nn-audiopolicy-iaudiosessioncontrol">IAudioSessionControl</a> pointers for  each session in the list, if they are not already present.</li>
  * <li>Use the <b>IAudioSessionEnumerator</b> interface returned in the previous step to retrieve and enumerate the list of sessions. The session control for each session can be retrieved by calling <a href="https://docs.microsoft.com/windows/desktop/api/audiopolicy/nf-audiopolicy-iaudiosessionenumerator-getsession">IAudioSessionEnumerator::GetSession</a>. Make sure you call <b>AddRef</b> for each session control to maintain the reference count.</li>
  * <li>When the application gets a create-session notification, add  the <a href="https://docs.microsoft.com/windows/desktop/api/audiopolicy/nn-audiopolicy-iaudiosessioncontrol">IAudioSessionControl</a> pointer of the new session (received in <a href="https://docs.microsoft.com/windows/desktop/api/audiopolicy/nf-audiopolicy-iaudiosessionnotification-onsessioncreated">IAudioSessionNotification::OnSessionCreated</a>)  to the list of existing sessions. </li>
  * </ol>
  * Because the application maintains this list of sessions and manages the lifetime of the session based on the application's requirements, there is no expiration mechanism enforced by the audio system on the session control objects.
  * 
  * A session control is valid as long as the application has a reference to the session control in the list.  
  * 
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//audiopolicy/nn-audiopolicy-iaudiosessionenumerator
 * @namespace Windows.Win32.Media.Audio
 * @version v4.0.30319
 */
class IAudioSessionEnumerator extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAudioSessionEnumerator
     * @type {Guid}
     */
    static IID => Guid("{e2f5bb11-0570-40ca-acdd-3aa01277dee8}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetCount", "GetSession"]

    /**
     * 
     * @param {Pointer<Integer>} SessionCount 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/audiopolicy/nf-audiopolicy-iaudiosessionenumerator-getcount
     */
    GetCount(SessionCount) {
        result := ComCall(3, this, "int*", SessionCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} SessionCount 
     * @param {Pointer<IAudioSessionControl>} Session 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/audiopolicy/nf-audiopolicy-iaudiosessionenumerator-getsession
     */
    GetSession(SessionCount, Session) {
        result := ComCall(4, this, "int", SessionCount, "ptr*", Session, "HRESULT")
        return result
    }
}
