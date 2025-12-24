#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IAudioSessionControl.ahk

/**
 * The IAudioSessionControl2 interface can be used by a client to get information about the audio session.
 * @remarks
 * 
 * This interface supports  custom implementations for <i>stream attenuation</i> or <i>ducking</i>, a new feature in Windows 7. An application playing a media stream can make it behave differently when a new communication stream is opened on the default communication device. For example, the original media stream can be paused while the new communication stream is open. For more information about this feature, see <a href="https://docs.microsoft.com/windows/desktop/CoreAudio/stream-attenuation">Default Ducking Experience</a>. 
 * 
 * An application can use this interface to perform the following tasks:
 * 
 * <ul>
 * <li>Specify that it wants to opt out of the default stream attenuation experience provided by the system.</li>
 * <li>Get the audio session identifier that is associated with the stream. The identifier is required during the notification registration. The application can register itself to receive ducking notifications from the system.</li>
 * <li>Check whether the stream associated with the audio session  is a system sound.</li>
 * </ul>
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//audiopolicy/nn-audiopolicy-iaudiosessioncontrol2
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
     * @returns {PWSTR} Pointer to the address of a null-terminated, wide-character string that  receives the audio session identifier. The string is allocated by this method and must be released by the caller by calling <b>CoTaskMemFree</b>. For information about <b>CoTaskMemFree</b>, see the Windows SDK documentation.
     * @see https://docs.microsoft.com/windows/win32/api//audiopolicy/nf-audiopolicy-iaudiosessioncontrol2-getsessionidentifier
     */
    GetSessionIdentifier() {
        result := ComCall(12, this, "ptr*", &pRetVal := 0, "HRESULT")
        return pRetVal
    }

    /**
     * The GetSessionInstanceIdentifier method retrieves the identifier of the audio session instance.
     * @returns {PWSTR} Pointer to the address of a null-terminated, wide-character string that receives the identifier of a particular instance of the audio session. The string is allocated by this method and must be released by the caller by calling <b>CoTaskMemFree</b>. For information about <b>CoTaskMemFree</b>, see the Windows SDK documentation.
     * @see https://docs.microsoft.com/windows/win32/api//audiopolicy/nf-audiopolicy-iaudiosessioncontrol2-getsessioninstanceidentifier
     */
    GetSessionInstanceIdentifier() {
        result := ComCall(13, this, "ptr*", &pRetVal := 0, "HRESULT")
        return pRetVal
    }

    /**
     * The GetProcessId method retrieves the process identifier of the audio session.
     * @returns {Integer} Pointer to a <b>DWORD</b> variable that receives the process identifier of the audio session.
     * @see https://docs.microsoft.com/windows/win32/api//audiopolicy/nf-audiopolicy-iaudiosessioncontrol2-getprocessid
     */
    GetProcessId() {
        result := ComCall(14, this, "uint*", &pRetVal := 0, "HRESULT")
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
     * @see https://docs.microsoft.com/windows/win32/api//audiopolicy/nf-audiopolicy-iaudiosessioncontrol2-issystemsoundssession
     */
    IsSystemSoundsSession() {
        result := ComCall(15, this, "int")
        return result
    }

    /**
     * The SetDuckingPreference method enables or disables the default stream attenuation experience (auto-ducking) provided by the system.
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
     * @see https://docs.microsoft.com/windows/win32/api//audiopolicy/nf-audiopolicy-iaudiosessioncontrol2-setduckingpreference
     */
    SetDuckingPreference(optOut) {
        result := ComCall(16, this, "int", optOut, "HRESULT")
        return result
    }
}
