#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IAudioSessionEnumerator.ahk
#Include .\IAudioSessionManager.ahk

/**
 * The IAudioSessionManager2 interface enables an application to manage submixes for the audio device.
 * @remarks
 * 
 * An application can use this interface to perform the following tasks:
 * 
 * <ul>
 * <li>Register to receive ducking notifications.</li>
 * <li>Register to receive a notification  when a  session is created.</li>
 * <li>Enumerate sessions on the audio device that was used to get the interface pointer. </li>
 * </ul>
 * 
 * 
 * This interface supports  custom implementations for <i>stream attenuation</i> or <i>ducking</i>, a new feature in Windows 7. An application playing a media stream can make the it behave differently when a new communication stream is opened on the default communication device. For example, the original media stream can be paused while the new communication stream is open. For more information about this feature, see <a href="https://docs.microsoft.com/windows/desktop/CoreAudio/using-the-communication-device">Using a Communication Device</a>.
 * 
 * An application that manages the media streams and wants to provide a custom ducking implementation, must register to receive notifications when session events occur. For stream attenuation, a session event is raised by the system when a communication stream is opened or closed on the default communication device. For more information, see <a href="https://docs.microsoft.com/windows/desktop/CoreAudio/providing-a-custom-ducking-experience">Providing a Custom Ducking Behavior</a>.
 * 
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//audiopolicy/nn-audiopolicy-iaudiosessionmanager2
 * @namespace Windows.Win32.Media.Audio
 * @version v4.0.30319
 */
class IAudioSessionManager2 extends IAudioSessionManager{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAudioSessionManager2
     * @type {Guid}
     */
    static IID => Guid("{77aa99a0-1bd6-484f-8bc7-2c654c9a9b6f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 5

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetSessionEnumerator", "RegisterSessionNotification", "UnregisterSessionNotification", "RegisterDuckNotification", "UnregisterDuckNotification"]

    /**
     * 
     * @returns {IAudioSessionEnumerator} 
     * @see https://learn.microsoft.com/windows/win32/api/audiopolicy/nf-audiopolicy-iaudiosessionmanager2-getsessionenumerator
     */
    GetSessionEnumerator() {
        result := ComCall(5, this, "ptr*", &SessionEnum := 0, "HRESULT")
        return IAudioSessionEnumerator(SessionEnum)
    }

    /**
     * 
     * @param {IAudioSessionNotification} SessionNotification 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/audiopolicy/nf-audiopolicy-iaudiosessionmanager2-registersessionnotification
     */
    RegisterSessionNotification(SessionNotification) {
        result := ComCall(6, this, "ptr", SessionNotification, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IAudioSessionNotification} SessionNotification 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/audiopolicy/nf-audiopolicy-iaudiosessionmanager2-unregistersessionnotification
     */
    UnregisterSessionNotification(SessionNotification) {
        result := ComCall(7, this, "ptr", SessionNotification, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} sessionID 
     * @param {IAudioVolumeDuckNotification} duckNotification 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/audiopolicy/nf-audiopolicy-iaudiosessionmanager2-registerducknotification
     */
    RegisterDuckNotification(sessionID, duckNotification) {
        sessionID := sessionID is String ? StrPtr(sessionID) : sessionID

        result := ComCall(8, this, "ptr", sessionID, "ptr", duckNotification, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IAudioVolumeDuckNotification} duckNotification 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/audiopolicy/nf-audiopolicy-iaudiosessionmanager2-unregisterducknotification
     */
    UnregisterDuckNotification(duckNotification) {
        result := ComCall(9, this, "ptr", duckNotification, "HRESULT")
        return result
    }
}
