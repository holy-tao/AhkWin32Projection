#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies the type of profile.
 * @see https://docs.microsoft.com/windows/win32/api//icftypes/ne-icftypes-net_fw_profile_type
 * @namespace Windows.Win32.NetworkManagement.WindowsFirewall
 * @version v4.0.30319
 */
class NET_FW_PROFILE_TYPE{

    /**
     * Profile type is domain.
     * @type {Integer (Int32)}
     */
    static NET_FW_PROFILE_DOMAIN => 0

    /**
     * Profile type is standard.
     * @type {Integer (Int32)}
     */
    static NET_FW_PROFILE_STANDARD => 1

    /**
     * Profile type is current.
     * @type {Integer (Int32)}
     */
    static NET_FW_PROFILE_CURRENT => 2

    /**
     * Used for boundary checking only. Not valid for application programming.
     * @type {Integer (Int32)}
     */
    static NET_FW_PROFILE_TYPE_MAX => 3
}
