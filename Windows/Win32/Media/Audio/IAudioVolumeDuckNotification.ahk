#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The IAudioVolumeDuckNotification interface is used to by the system to send notifications about stream attenuation changes.Stream Attenuation, or ducking, is a feature introduced in Windows 7, where the system adjusts the volume of a non-communication stream when a new communication stream is opened. For more information about this feature, see Default Ducking Experience.
 * @remarks
 * If an application needs to opt out of the system attenuation experience provided by the system, it must call <a href="https://docs.microsoft.com/windows/desktop/api/audiopolicy/nf-audiopolicy-iaudiosessioncontrol2-setduckingpreference">IAudioSessionControl2::SetDuckingPreference</a> and specify that preference. 
 * 
 * Unlike the other WASAPI interfaces, which are implemented by the WASAPI system component, the <b>IAudioVolumeDuckNotification</b> interface is implemented by the application to provide custom stream attenuation behavior. To receive event notifications, the application passes to the <a href="https://docs.microsoft.com/windows/desktop/api/audiopolicy/nf-audiopolicy-iaudiosessionmanager2-registerducknotification">IAudioSessionManager2::RegisterDuckNotification</a> method a pointer to the application's implementation of <b>IAudioVolumeDuckNotification</b>.
 * 
 * After the application has registered its <b>IAudioVolumeDuckNotification</b> interface, the session manager calls the <b>IAudioVolumeDuckNotification</b> implementation when it needs to send ducking notifications. The application receives event notifications in the form of callbacks through the methods of the interface.
 * 
 * When the application no longer needs to receive notifications, it calls the <a href="https://docs.microsoft.com/windows/desktop/api/audiopolicy/nf-audiopolicy-iaudiosessionmanager2-unregisterducknotification">IAudioSessionManager2::UnregisterDuckNotification</a> method. The <b>UnregisterDuckNotification</b> method removes the registration of an <b>IAudioVolumeDuckNotification</b> interface that the application previously registered.
 * 
 * The application must not register or unregister notification callbacks during an event callback. 
 * 
 * 
 * 
 * For more information, see <a href="https://docs.microsoft.com/windows/desktop/CoreAudio/handling-audio-ducking-events-from-communication-devices">Implementation Considerations for Ducking Notifications</a>.
 * @see https://learn.microsoft.com/windows/win32/api/audiopolicy/nn-audiopolicy-iaudiovolumeducknotification
 * @namespace Windows.Win32.Media.Audio
 */
export default struct IAudioVolumeDuckNotification extends IUnknown {
    /**
     * The interface identifier for IAudioVolumeDuckNotification
     * @type {Guid}
     */
    static IID := Guid("{c3b284d4-6d39-4359-b3cf-b56ddb3bb39c}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IAudioVolumeDuckNotification interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        OnVolumeDuckNotification   : IntPtr
        OnVolumeUnduckNotification : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IAudioVolumeDuckNotification.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The OnVolumeDuckNotification method sends a notification about a pending system ducking event.
     * @remarks
     * After the application registers its implementation  of the <a href="https://docs.microsoft.com/windows/desktop/api/audiopolicy/nn-audiopolicy-iaudiovolumeducknotification">IAudioVolumeDuckNotification</a> interface by calling <a href="https://docs.microsoft.com/windows/desktop/api/audiopolicy/nf-audiopolicy-iaudiosessionmanager2-registerducknotification">IAudioSessionManager2::RegisterDuckNotification</a>, the session manager calls <b>OnVolumeDuckNotification</b> when it wants to send a notification about when ducking begins. The application receives the event notifications in the form of callbacks.
     * @param {PWSTR} sessionID A string containing the session instance identifier of the communications session that raises the  the auto-ducking event. To get the session instance identifier, call <a href="https://docs.microsoft.com/windows/desktop/api/audiopolicy/nf-audiopolicy-iaudiosessioncontrol2-getsessioninstanceidentifier">IAudioSessionControl2::GetSessionInstanceIdentifier</a>.
     * @param {Integer} countCommunicationSessions The number of active communications sessions. If there are n sessions, the sessions are numbered from 0 to –1.
     * @returns {HRESULT} If the method succeeds, it returns S_OK.
     * @see https://learn.microsoft.com/windows/win32/api/audiopolicy/nf-audiopolicy-iaudiovolumeducknotification-onvolumeducknotification
     */
    OnVolumeDuckNotification(sessionID, countCommunicationSessions) {
        sessionID := sessionID is String ? StrPtr(sessionID) : sessionID

        result := ComCall(3, this, "ptr", sessionID, "uint", countCommunicationSessions, "HRESULT")
        return result
    }

    /**
     * The OnVolumeUnduckNotification method sends a notification about a pending system unducking event.
     * @remarks
     * After the application registers its implementation  of the <a href="https://docs.microsoft.com/windows/desktop/api/audiopolicy/nn-audiopolicy-iaudiovolumeducknotification">IAudioVolumeDuckNotification</a> interface by calling <a href="https://docs.microsoft.com/windows/desktop/api/audiopolicy/nf-audiopolicy-iaudiosessionmanager2-registerducknotification">IAudioSessionManager2::RegisterDuckNotification</a>, the session manager calls <b>OnVolumeUnduckNotification</b> when it wants to send a notification about when ducking ends. The application receives the event notifications in the form of callbacks.
     * @param {PWSTR} sessionID A string containing the session instance identifier of the terminating communications session that initiated the ducking. To get the session instance identifier, call <a href="https://docs.microsoft.com/windows/desktop/api/audiopolicy/nf-audiopolicy-iaudiosessioncontrol2-getsessioninstanceidentifier">IAudioSessionControl2::GetSessionInstanceIdentifier</a>.
     * @returns {HRESULT} If the method succeeds, it returns S_OK.
     * @see https://learn.microsoft.com/windows/win32/api/audiopolicy/nf-audiopolicy-iaudiovolumeducknotification-onvolumeunducknotification
     */
    OnVolumeUnduckNotification(sessionID) {
        sessionID := sessionID is String ? StrPtr(sessionID) : sessionID

        result := ComCall(4, this, "ptr", sessionID, "HRESULT")
        return result
    }

    Query(iid) {
        if (IAudioVolumeDuckNotification.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.OnVolumeDuckNotification := CallbackCreate(GetMethod(implObj, "OnVolumeDuckNotification"), flags, 3)
        this.vtbl.OnVolumeUnduckNotification := CallbackCreate(GetMethod(implObj, "OnVolumeUnduckNotification"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.OnVolumeDuckNotification)
        CallbackFree(this.vtbl.OnVolumeUnduckNotification)
    }
}
