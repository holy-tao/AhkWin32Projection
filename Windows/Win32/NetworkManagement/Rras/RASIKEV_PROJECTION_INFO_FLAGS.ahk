#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.Rras
 */
export default struct RASIKEV_PROJECTION_INFO_FLAGS {
    value : UInt32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * @type {Integer (UInt32)}
     */
    static RASIKEv2_FLAGS_MOBIKESUPPORTED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static RASIKEv2_FLAGS_BEHIND_NAT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static RASIKEv2_FLAGS_SERVERBEHIND_NAT => 4
}
