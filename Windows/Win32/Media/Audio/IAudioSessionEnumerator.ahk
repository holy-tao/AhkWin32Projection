#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IAudioSessionControl.ahk" { IAudioSessionControl }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The IAudioSessionEnumerator interface enumerates audio sessions on an audio device.
 * @remarks
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
 * @see https://learn.microsoft.com/windows/win32/api/audiopolicy/nn-audiopolicy-iaudiosessionenumerator
 * @namespace Windows.Win32.Media.Audio
 */
export default struct IAudioSessionEnumerator extends IUnknown {
    /**
     * The interface identifier for IAudioSessionEnumerator
     * @type {Guid}
     */
    static IID := Guid("{e2f5bb11-0570-40ca-acdd-3aa01277dee8}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IAudioSessionEnumerator interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetCount   : IntPtr
        GetSession : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IAudioSessionEnumerator.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The GetCount method gets the total number of audio sessions that are open on the audio device.
     * @returns {Integer} Receives the total number of audio sessions.
     * @see https://learn.microsoft.com/windows/win32/api/audiopolicy/nf-audiopolicy-iaudiosessionenumerator-getcount
     */
    GetCount() {
        result := ComCall(3, this, "int*", &SessionCount := 0, "HRESULT")
        return SessionCount
    }

    /**
     * The GetSession method gets the audio session specified by an audio session number.
     * @param {Integer} SessionCount The session number. If there are <i>n</i> sessions, the sessions are numbered from 0 to <i>n</i> – 1. To get the number of sessions, call the <a href="https://docs.microsoft.com/windows/desktop/api/audiopolicy/nf-audiopolicy-iaudiosessionenumerator-getcount">IAudioSessionEnumerator::GetCount</a> method.
     * @returns {IAudioSessionControl} Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/audiopolicy/nn-audiopolicy-iaudiosessioncontrol">IAudioSessionControl</a> interface of the session object in the collection that is maintained by the session enumerator. The caller must release the interface pointer.
     * @see https://learn.microsoft.com/windows/win32/api/audiopolicy/nf-audiopolicy-iaudiosessionenumerator-getsession
     */
    GetSession(SessionCount) {
        result := ComCall(4, this, "int", SessionCount, "ptr*", &Session := 0, "HRESULT")
        return IAudioSessionControl(Session)
    }

    Query(iid) {
        if (IAudioSessionEnumerator.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetCount := CallbackCreate(GetMethod(implObj, "GetCount"), flags, 2)
        this.vtbl.GetSession := CallbackCreate(GetMethod(implObj, "GetSession"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetCount)
        CallbackFree(this.vtbl.GetSession)
    }
}
