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
     * The GetSessionEnumerator method gets a pointer to the audio session enumerator object.
     * @returns {IAudioSessionEnumerator} Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/audiopolicy/nn-audiopolicy-iaudiosessionenumerator">IAudioSessionEnumerator</a> interface of the session enumerator object that the client can use to enumerate audio sessions on the audio device. Through this method, the caller obtains a counted reference to the interface. The caller is responsible for releasing the interface, when it is no longer needed, by calling the interface's <b>Release</b> method.
     * @see https://docs.microsoft.com/windows/win32/api//audiopolicy/nf-audiopolicy-iaudiosessionmanager2-getsessionenumerator
     */
    GetSessionEnumerator() {
        result := ComCall(5, this, "ptr*", &SessionEnum := 0, "HRESULT")
        return IAudioSessionEnumerator(SessionEnum)
    }

    /**
     * The RegisterSessionNotification method registers the application to receive a notification when a session is created.
     * @param {IAudioSessionNotification} SessionNotification A pointer to the application's implementation of the <a href="https://docs.microsoft.com/windows/desktop/api/audiopolicy/nn-audiopolicy-iaudiosessionnotification">IAudioSessionNotification</a> interface. If the method call succeeds, it calls the <b>AddRef</b> method on the application's <b>IAudioSessionNotification</b> interface.
     * @returns {HRESULT} If the method succeeds, it returns S_OK.
     *           If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>E_POINTER</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i>SessionNotification</i> is <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>E_OUTOFMEMORY</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Internal object could not be created due to insufficient memory.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//audiopolicy/nf-audiopolicy-iaudiosessionmanager2-registersessionnotification
     */
    RegisterSessionNotification(SessionNotification) {
        result := ComCall(6, this, "ptr", SessionNotification, "HRESULT")
        return result
    }

    /**
     * The UnregisterSessionNotification method deletes the registration to receive a notification when a session is created.
     * @param {IAudioSessionNotification} SessionNotification A pointer to the application's implementation of the <a href="https://docs.microsoft.com/windows/desktop/api/audiopolicy/nn-audiopolicy-iaudiosessionnotification">IAudioSessionNotification</a> interface. Pass the same interface pointer that was specified to the session manager in  a previous call to <a href="https://docs.microsoft.com/windows/desktop/api/audiopolicy/nf-audiopolicy-iaudiosessionmanager2-registersessionnotification">IAudioSessionManager2::RegisterSessionNotification</a> to register for notification.  
     * 
     * If the <b>UnregisterSessionNotification</b> method succeeds, it calls the <b>Release</b> method on the application's <a href="https://docs.microsoft.com/windows/desktop/api/audiopolicy/nn-audiopolicy-iaudiosessionnotification">IAudioSessionNotification</a> interface.
     * @returns {HRESULT} If the method succeeds, it returns S_OK.
     *           If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>E_POINTER</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i>SessionNotification</i> is <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//audiopolicy/nf-audiopolicy-iaudiosessionmanager2-unregistersessionnotification
     */
    UnregisterSessionNotification(SessionNotification) {
        result := ComCall(7, this, "ptr", SessionNotification, "HRESULT")
        return result
    }

    /**
     * The RegisterDuckNotification method registers the application with the session manager to receive ducking notifications.
     * @param {PWSTR} sessionID Pointer to a null-terminated string that contains a  session instance identifier. Applications that are playing a media stream and want to provide custom stream attenuation or ducking behavior, pass their own session instance identifier.  For more information, see Remarks.
     * 
     * Other applications
     *     that do not want to alter their streams but want to get all the ducking notifications
     *     must pass <b>NULL</b>.
     * @param {IAudioVolumeDuckNotification} duckNotification Pointer to the application's implementation of the <a href="https://docs.microsoft.com/windows/desktop/api/audiopolicy/nn-audiopolicy-iaudiovolumeducknotification">IAudioVolumeDuckNotification</a> interface. The implementation is called when ducking events are raised by the audio system and  notifications are sent to the registered applications.
     * @returns {HRESULT} If the method succeeds, it returns S_OK.
     *           If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>E_POINTER</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i>duckNotification</i> is <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>E_OUTOFMEMORY</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Internal object could not be created due to insufficient memory.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//audiopolicy/nf-audiopolicy-iaudiosessionmanager2-registerducknotification
     */
    RegisterDuckNotification(sessionID, duckNotification) {
        sessionID := sessionID is String ? StrPtr(sessionID) : sessionID

        result := ComCall(8, this, "ptr", sessionID, "ptr", duckNotification, "HRESULT")
        return result
    }

    /**
     * The UnregisterDuckNotification method deletes a previous registration by the application to receive notifications.
     * @param {IAudioVolumeDuckNotification} duckNotification Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/audiopolicy/nn-audiopolicy-iaudiovolumeducknotification">IAudioVolumeDuckNotification</a> interface that is implemented by the application. Pass the same interface pointer that was specified to the session manager in a previous call to the <a href="https://docs.microsoft.com/windows/desktop/api/audiopolicy/nf-audiopolicy-iaudiosessionmanager2-registerducknotification">IAudioSessionManager2::RegisterDuckNotification</a> method. If the <b>UnregisterDuckNotification</b> method succeeds, it calls the <b>Release</b> method on the application's <b>IAudioVolumeDuckNotification</b> interface.
     * @returns {HRESULT} If the method succeeds, it returns S_OK.
     *           If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>E_POINTER</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i>duckNotification</i> is <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//audiopolicy/nf-audiopolicy-iaudiosessionmanager2-unregisterducknotification
     */
    UnregisterDuckNotification(duckNotification) {
        result := ComCall(9, this, "ptr", duckNotification, "HRESULT")
        return result
    }
}
