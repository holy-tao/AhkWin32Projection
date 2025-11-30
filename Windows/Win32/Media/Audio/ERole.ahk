#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The ERole enumeration defines constants that indicate the role that the system has assigned to an audio endpoint device.
 * @remarks
 * 
 * The <a href="https://docs.microsoft.com/windows/win32/api/mmdeviceapi/ne-mmdeviceapi-erole">IMMDeviceEnumerator::GetDefaultAudioEndpoint</a> and <a href="https://docs.microsoft.com/windows/desktop/api/mmdeviceapi/nf-mmdeviceapi-immnotificationclient-ondefaultdevicechanged">IMMNotificationClient::OnDefaultDeviceChanged</a> methods use the constants defined in the <b>ERole</b> enumeration.
 * 
 * For more information, see <a href="https://docs.microsoft.com/windows/desktop/CoreAudio/device-roles">Device Roles</a>.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//mmdeviceapi/ne-mmdeviceapi-erole
 * @namespace Windows.Win32.Media.Audio
 * @version v4.0.30319
 */
class ERole extends Win32Enum{

    /**
     * Games, system notification sounds, and voice commands.
     * @type {Integer (Int32)}
     */
    static eConsole => 0

    /**
     * Music, movies, narration, and live music recording.
     * @type {Integer (Int32)}
     */
    static eMultimedia => 1

    /**
     * Voice communications (talking to another person).
     * @type {Integer (Int32)}
     */
    static eCommunications => 2

    /**
     * The number of members in the <a href="https://docs.microsoft.com/windows/win32/api/mmdeviceapi/ne-mmdeviceapi-erole">ERole</a> enumeration (not counting the ERole_enum_count member).
     * @type {Integer (Int32)}
     */
    static ERole_enum_count => 3
}
