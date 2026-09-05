#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the type of profile. (NET_FW_PROFILE_TYPE2)
 * @see https://learn.microsoft.com/windows/win32/api/icftypes/ne-icftypes-net_fw_profile_type2
 * @namespace Windows.Win32.NetworkManagement.WindowsFirewall
 */
class NET_FW_PROFILE_TYPE2 extends Win32Enum {

    /**
     * Profile type is domain.
     * Native name: NET_FW_PROFILE2_DOMAIN
     * @type {Integer (Int32)}
     */
    static DOMAIN => 1

    /**
     * Profile type is private. This profile type is used for home and other private network types.
     * Native name: NET_FW_PROFILE2_PRIVATE
     * @type {Integer (Int32)}
     */
    static PRIVATE => 2

    /**
     * Profile type is public. This profile type is used for public Internet access points.
     * Native name: NET_FW_PROFILE2_PUBLIC
     * @type {Integer (Int32)}
     */
    static PUBLIC => 4

    /**
     * Native name: NET_FW_PROFILE2_ALL
     * @type {Integer (Int32)}
     */
    static ALL => 2147483647
}
