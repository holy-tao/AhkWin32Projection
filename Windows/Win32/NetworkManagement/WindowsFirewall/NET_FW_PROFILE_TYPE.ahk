#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the type of profile. (NET_FW_PROFILE_TYPE)
 * @see https://learn.microsoft.com/windows/win32/api/icftypes/ne-icftypes-net_fw_profile_type
 * @namespace Windows.Win32.NetworkManagement.WindowsFirewall
 */
class NET_FW_PROFILE_TYPE extends Win32Enum {

    /**
     * Profile type is domain.
     * Native name: NET_FW_PROFILE_DOMAIN
     * @type {Integer (Int32)}
     */
    static DOMAIN => 0

    /**
     * Profile type is standard.
     * Native name: NET_FW_PROFILE_STANDARD
     * @type {Integer (Int32)}
     */
    static STANDARD => 1

    /**
     * Profile type is current.
     * Native name: NET_FW_PROFILE_CURRENT
     * @type {Integer (Int32)}
     */
    static CURRENT => 2

    /**
     * Used for boundary checking only. Not valid for application programming.
     * Native name: NET_FW_PROFILE_TYPE_MAX
     * @type {Integer (Int32)}
     */
    static MAX => 3
}
