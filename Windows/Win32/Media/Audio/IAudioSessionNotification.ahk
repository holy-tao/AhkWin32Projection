#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IAudioSessionNotification interface provides notification when an audio session is created.
 * @remarks
 * Unlike the other WASAPI interfaces, which are implemented by the WASAPI system component, the <b>IAudioSessionNotification</b> interface is implemented by the application. To receive event notifications, the application passes to the <a href="https://docs.microsoft.com/windows/desktop/api/audiopolicy/nf-audiopolicy-iaudiosessionmanager2-registersessionnotification">IAudioSessionManager2::RegisterSessionNotification</a> method a pointer to its <b>IAudioSessionNotification</b> implementation .
 * 
 * 
 * After registering its <b>IAudioSessionNotification</b> interface, the application receives event notifications in the form of callbacks through the methods in the interface.
 * 
 * When the application no longer needs to receive notifications, it calls the <a href="https://docs.microsoft.com/windows/desktop/api/audiopolicy/nf-audiopolicy-iaudiosessionmanager2-unregistersessionnotification">IAudioSessionManager2::UnregisterSessionNotification</a> method. This method removes the registration of an <b>IAudioSessionNotification</b> interface that the application previously registered.
 * 
 * The application must not register or unregister notification callbacks during an event callback. 
 * 
 * 
 * The session enumerator might not be aware of the new sessions that are reported through <b>IAudioSessionNotification</b>. So if an application exclusively relies on the session enumerator for getting all the sessions for an audio endpoint, the results might not be accurate. To work around this, the application should manually maintain a list. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/audiopolicy/nn-audiopolicy-iaudiosessionenumerator">IAudioSessionEnumerator</a>.
 * 
 * <div class="alert"><b>Note</b>  Make sure that the application initializes COM with Multithreaded Apartment (MTA) model by calling <c>CoInitializeEx(NULL, COINIT_MULTITHREADED)</c> in a non-UI thread. If MTA is not initialized, the application does not receive session notifications from the session manager. 
 * Threads that run the user interface of an application should be initialized apartment threading model.
 * 
 * </div>
 * <div> </div>
 * @see https://learn.microsoft.com/windows/win32/api//content/audiopolicy/nn-audiopolicy-iaudiosessionnotification
 * @namespace Windows.Win32.Media.Audio
 * @version v4.0.30319
 */
class IAudioSessionNotification extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAudioSessionNotification
     * @type {Guid}
     */
    static IID => Guid("{641dd20b-4d41-49cc-aba3-174b9477bb08}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OnSessionCreated"]

    /**
     * The OnSessionCreated method notifies the registered processes that the audio session has been created.
     * @remarks
     * After registering its <a href="https://docs.microsoft.com/windows/desktop/api/audiopolicy/nn-audiopolicy-iaudiosessionnotification">IAudioSessionNotification</a> interface, the application receives event notifications in the form of callbacks through the methods of the interface.
     * 
     * The audio engine calls <b>OnSessionCreated</b> when a new session is activated on the device endpoint.
     * This method is called from the session manager thread.  This method must take a reference to the session in the <i>NewSession</i> parameter if it wants to keep the reference after this call completes.
     * @param {IAudioSessionControl} NewSession Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/audiopolicy/nn-audiopolicy-iaudiosessioncontrol">IAudioSessionControl</a> interface of the audio session that was created.
     * @returns {HRESULT} If the method succeeds, it returns S_OK.
     * @see https://learn.microsoft.com/windows/win32/api//content/audiopolicy/nf-audiopolicy-iaudiosessionnotification-onsessioncreated
     */
    OnSessionCreated(NewSession) {
        result := ComCall(3, this, "ptr", NewSession, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
