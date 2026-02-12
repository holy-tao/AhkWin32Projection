#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IAudioSessionControl.ahk

/**
 * The IAudioSessionControl2 interface can be used by a client to get information about the audio session.
 * @remarks
 * This interface supports  custom implementations for <i>stream attenuation</i> or <i>ducking</i>, a new feature in Windows 7. An application playing a media stream can make it behave differently when a new communication stream is opened on the default communication device. For example, the original media stream can be paused while the new communication stream is open. For more information about this feature, see <a href="https://docs.microsoft.com/windows/desktop/CoreAudio/stream-attenuation">Default Ducking Experience</a>. 
 * 
 * An application can use this interface to perform the following tasks:
 * 
 * <ul>
 * <li>Specify that it wants to opt out of the default stream attenuation experience provided by the system.</li>
 * <li>Get the audio session identifier that is associated with the stream. The identifier is required during the notification registration. The application can register itself to receive ducking notifications from the system.</li>
 * <li>Check whether the stream associated with the audio session  is a system sound.</li>
 * </ul>
 * @see https://learn.microsoft.com/windows/win32/api//content/audiopolicy/nn-audiopolicy-iaudiosessioncontrol2
 * @namespace Windows.Win32.Media.Audio
 * @version v4.0.30319
 */
class IAudioSessionControl2 extends IAudioSessionControl{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAudioSessionControl2
     * @type {Guid}
     */
    static IID => Guid("{bfb7ff88-7239-4fc9-8fa2-07c950be9c6d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 12

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetSessionIdentifier", "GetSessionInstanceIdentifier", "GetProcessId", "IsSystemSoundsSession", "SetDuckingPreference"]

    /**
     * The GetSessionIdentifier method retrieves the audio session identifier.
     * @remarks
     * Each audio session is identified by an identifier string.  This session identifier string is not unique across all instances. If there are two
     *     instances of the application playing, both instances will have the same session identifier. The identifier retrieved by <b>GetSessionIdentifier</b> is different from the session instance identifier, which is unique across all sessions. To get the session instance identifier, call <a href="https://docs.microsoft.com/windows/desktop/api/audiopolicy/nf-audiopolicy-iaudiosessioncontrol2-getsessioninstanceidentifier">IAudioSessionControl2::GetSessionInstanceIdentifier</a>.
     * 
     * 
     * <b>GetSessionIdentifier</b> checks whether the session has been disconnected on the default device. It retrieves the identifier string that is cached by the audio client for the device. If the session identifier is not found, this method retrieves it from the audio engine.
     * @returns {PWSTR} Pointer to the address of a null-terminated, wide-character string that  receives the audio session identifier. The string is allocated by this method and must be released by the caller by calling <b>CoTaskMemFree</b>. For information about <b>CoTaskMemFree</b>, see the Windows SDK documentation.
     * @see https://learn.microsoft.com/windows/win32/api//content/audiopolicy/nf-audiopolicy-iaudiosessioncontrol2-getsessionidentifier
     */
    GetSessionIdentifier() {
        result := ComCall(12, this, "ptr*", &pRetVal := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pRetVal
    }

    /**
     * The GetSessionInstanceIdentifier method retrieves the identifier of the audio session instance.
     * @remarks
     * Each audio session instance is identified by a unique string.  This  string represents a particular instance of the audio session and, unlike the session identifier, is unique across all instances. If there are two
     *     instances of the application playing, they will have different session instance identifiers. The identifier retrieved by <b>GetSessionInstanceIdentifier</b> is different from the session  identifier, which is shared by all session instances. To get the session  identifier, call <a href="https://docs.microsoft.com/windows/desktop/api/audiopolicy/nf-audiopolicy-iaudiosessioncontrol2-getsessionidentifier">IAudioSessionControl2::GetSessionIdentifier</a>.
     * 
     * 
     * <b>GetSessionInstanceIdentifier</b> checks whether the session has been disconnected on the default device. It retrieves the identifier string that is cached by the audio client for the device. If the session instance identifier is not found, this method retrieves it from the audio engine. For example code about getting a session instance identifier, see <a href="https://docs.microsoft.com/windows/desktop/CoreAudio/getting-ducking-events-from-a-communication-device">Getting Ducking Events from a Communication Device</a>.
     * @returns {PWSTR} Pointer to the address of a null-terminated, wide-character string that receives the identifier of a particular instance of the audio session. The string is allocated by this method and must be released by the caller by calling <b>CoTaskMemFree</b>. For information about <b>CoTaskMemFree</b>, see the Windows SDK documentation.
     * @see https://learn.microsoft.com/windows/win32/api//content/audiopolicy/nf-audiopolicy-iaudiosessioncontrol2-getsessioninstanceidentifier
     */
    GetSessionInstanceIdentifier() {
        result := ComCall(13, this, "ptr*", &pRetVal := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pRetVal
    }

    /**
     * The GetProcessId method retrieves the process identifier of the audio session.
     * @remarks
     * This method overwrites the value that was passed by the application in <i>pRetVal</i>. 
     * 
     * <b>GetProcessId</b> checks whether the audio session has been disconnected on the default device or if the session has switched to another stream. In the case of stream
     *  switching, this method transfers state information for the new stream to the session. State information includes volume controls, metadata information (display name, icon path), and the session's property store.
     * @returns {Integer} Pointer to a <b>DWORD</b> variable that receives the process identifier of the audio session.
     * @see https://learn.microsoft.com/windows/win32/api//content/audiopolicy/nf-audiopolicy-iaudiosessioncontrol2-getprocessid
     */
    GetProcessId() {
        result := ComCall(14, this, "uint*", &pRetVal := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pRetVal
    }

    /**
     * The IsSystemSoundsSession method indicates whether the session is a system sounds session.
     * @returns {HRESULT} The possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The session is a system sounds session.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The session is not a system sounds session.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/audiopolicy/nf-audiopolicy-iaudiosessioncontrol2-issystemsoundssession
     */
    IsSystemSoundsSession() {
        result := ComCall(15, this, "int")
        return result
    }

    /**
     * The SetDuckingPreference method enables or disables the default stream attenuation experience (auto-ducking) provided by the system.
     * @remarks
     * By default, the system adjusts the volume for all currently playing sounds when the system starts a communication session and receives a new communication stream on the default communication device. For more information about this feature, see <a href="https://docs.microsoft.com/windows/desktop/CoreAudio/using-the-communication-device">Using a Communication Device</a>.
     * 
     * If the application passes <b>TRUE</b> in <i>optOut</i>, the system disables the <a href="https://docs.microsoft.com/windows/desktop/CoreAudio/stream-attenuation">Default Ducking Experience</a>. For more information, see <a href="https://docs.microsoft.com/windows/desktop/CoreAudio/disabling-the-ducking-experience">Disabling the Default Ducking Experience</a>.
     * 
     * To provide a custom implementation, the application needs to get notifications from the system when it opens or closes the communication stream. To receive the notifications, the application must call this method before registering itself by calling <b>IAudioSessionManager2::RegisterForDuckNotification</b>. For more information and example code, see <a href="https://docs.microsoft.com/windows/desktop/CoreAudio/getting-ducking-events-from-a-communication-device">Getting Ducking Events</a>.
     * 
     * If the application passes <b>FALSE</b> in <i>optOut</i>, the application provides the default stream attenuation experience provided by the system.
     * 
     * We recommend that the application call <b>SetDuckingPreference</b> during stream creation.  However, this method can be called dynamically during the session to change the initial preference.
     * @param {BOOL} optOut A <b>BOOL</b> variable that enables or disables system auto-ducking.
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
     * <dt>AUDCLNT_E_DEVICE_INVALIDATED</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The audio session is disconnected on the default audio device.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/audiopolicy/nf-audiopolicy-iaudiosessioncontrol2-setduckingpreference
     */
    SetDuckingPreference(optOut) {
        result := ComCall(16, this, "int", optOut, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
