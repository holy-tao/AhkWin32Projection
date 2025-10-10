#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies the type of profile.
 * @see https://docs.microsoft.com/windows/win32/api//icftypes/ne-icftypes-net_fw_profile_type2
 * @namespace Windows.Win32.NetworkManagement.WindowsFirewall
 * @version v4.0.30319
 */
class NET_FW_PROFILE_TYPE2{

    /**
     * Profile type is domain.
     * @type {Integer (Int32)}
     */
    static NET_FW_PROFILE2_DOMAIN => 1

    /**
     * Profile type is private. This profile type is used for home and other private network types.
     * @type {Integer (Int32)}
     */
    static NET_FW_PROFILE2_PRIVATE => 2

    /**
     * Profile type is public. This profile type is used for public Internet access points.
     * @type {Integer (Int32)}
     */
    static NET_FW_PROFILE2_PUBLIC => 4

    /**
     * 
     * @type {Integer (Int32)}
     */
    static NET_FW_PROFILE2_ALL => 2147483647
}
