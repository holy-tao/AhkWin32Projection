#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IAudioSessionControl.ahk" { IAudioSessionControl }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

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
 * @see https://learn.microsoft.com/windows/win32/api/audiopolicy/nn-audiopolicy-iaudiosessionnotification
 * @namespace Windows.Win32.Media.Audio
 */
export default struct IAudioSessionNotification extends IUnknown {
    /**
     * The interface identifier for IAudioSessionNotification
     * @type {Guid}
     */
    static IID := Guid("{641dd20b-4d41-49cc-aba3-174b9477bb08}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IAudioSessionNotification interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        OnSessionCreated : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IAudioSessionNotification.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The OnSessionCreated method notifies the registered processes that the audio session has been created.
     * @remarks
     * After registering its <a href="https://docs.microsoft.com/windows/desktop/api/audiopolicy/nn-audiopolicy-iaudiosessionnotification">IAudioSessionNotification</a> interface, the application receives event notifications in the form of callbacks through the methods of the interface.
     * 
     * The audio engine calls <b>OnSessionCreated</b> when a new session is activated on the device endpoint.
     * This method is called from the session manager thread.  This method must take a reference to the session in the <i>NewSession</i> parameter if it wants to keep the reference after this call completes.
     * @param {IAudioSessionControl} NewSession Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/audiopolicy/nn-audiopolicy-iaudiosessioncontrol">IAudioSessionControl</a> interface of the audio session that was created.
     * @returns {HRESULT} If the method succeeds, it returns S_OK.
     * @see https://learn.microsoft.com/windows/win32/api/audiopolicy/nf-audiopolicy-iaudiosessionnotification-onsessioncreated
     */
    OnSessionCreated(NewSession) {
        result := ComCall(3, this, "ptr", NewSession, "HRESULT")
        return result
    }

    Query(iid) {
        if (IAudioSessionNotification.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.OnSessionCreated := CallbackCreate(GetMethod(implObj, "OnSessionCreated"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.OnSessionCreated)
    }
}
