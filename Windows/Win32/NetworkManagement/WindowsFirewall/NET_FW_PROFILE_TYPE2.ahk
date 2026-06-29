#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies the type of profile. (NET_FW_PROFILE_TYPE2)
 * @see https://learn.microsoft.com/windows/win32/api/icftypes/ne-icftypes-net_fw_profile_type2
 * @namespace Windows.Win32.NetworkManagement.WindowsFirewall
 */
export default struct NET_FW_PROFILE_TYPE2 {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
     * @type {Integer (Int32)}
     */
    static NET_FW_PROFILE2_ALL => 2147483647
}
