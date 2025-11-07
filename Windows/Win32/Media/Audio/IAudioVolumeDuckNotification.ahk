#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IAudioVolumeDuckNotification interface is used to by the system to send notifications about stream attenuation changes.Stream Attenuation, or ducking, is a feature introduced in Windows 7, where the system adjusts the volume of a non-communication stream when a new communication stream is opened. For more information about this feature, see Default Ducking Experience.
 * @remarks
 * 
 *     If an application needs to opt out of the system attenuation experience provided by the system, it must call <a href="https://docs.microsoft.com/windows/desktop/api/audiopolicy/nf-audiopolicy-iaudiosessioncontrol2-setduckingpreference">IAudioSessionControl2::SetDuckingPreference</a> and specify that preference. 
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
 * 
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//audiopolicy/nn-audiopolicy-iaudiovolumeducknotification
 * @namespace Windows.Win32.Media.Audio
 * @version v4.0.30319
 */
class IAudioVolumeDuckNotification extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAudioVolumeDuckNotification
     * @type {Guid}
     */
    static IID => Guid("{c3b284d4-6d39-4359-b3cf-b56ddb3bb39c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OnVolumeDuckNotification", "OnVolumeUnduckNotification"]

    /**
     * 
     * @param {PWSTR} sessionID 
     * @param {Integer} countCommunicationSessions 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/audiopolicy/nf-audiopolicy-iaudiovolumeducknotification-onvolumeducknotification
     */
    OnVolumeDuckNotification(sessionID, countCommunicationSessions) {
        sessionID := sessionID is String ? StrPtr(sessionID) : sessionID

        result := ComCall(3, this, "ptr", sessionID, "uint", countCommunicationSessions, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} sessionID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/audiopolicy/nf-audiopolicy-iaudiovolumeducknotification-onvolumeunducknotification
     */
    OnVolumeUnduckNotification(sessionID) {
        sessionID := sessionID is String ? StrPtr(sessionID) : sessionID

        result := ComCall(4, this, "ptr", sessionID, "HRESULT")
        return result
    }
}
