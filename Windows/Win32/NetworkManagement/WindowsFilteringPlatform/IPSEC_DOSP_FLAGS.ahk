#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 */
export default struct IPSEC_DOSP_FLAGS {
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
    static IPSEC_DOSP_FLAG_ENABLE_IKEV1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static IPSEC_DOSP_FLAG_ENABLE_IKEV2 => 2

    /**
     * @type {Integer (UInt32)}
     */
    static IPSEC_DOSP_FLAG_DISABLE_AUTHIP => 4

    /**
     * @type {Integer (UInt32)}
     */
    static IPSEC_DOSP_FLAG_DISABLE_DEFAULT_BLOCK => 8

    /**
     * @type {Integer (UInt32)}
     */
    static IPSEC_DOSP_FLAG_FILTER_BLOCK => 16

    /**
     * @type {Integer (UInt32)}
     */
    static IPSEC_DOSP_FLAG_FILTER_EXEMPT => 32
}
