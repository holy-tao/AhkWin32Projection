#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.Ndis
 */
export default struct OFFLOAD_CONF_ALGO {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * @type {Integer (Int32)}
     */
    static OFFLOAD_IPSEC_CONF_NONE => 0

    /**
     * @type {Integer (Int32)}
     */
    static OFFLOAD_IPSEC_CONF_DES => 1

    /**
     * @type {Integer (Int32)}
     */
    static OFFLOAD_IPSEC_CONF_RESERVED => 2

    /**
     * @type {Integer (Int32)}
     */
    static OFFLOAD_IPSEC_CONF_3_DES => 3

    /**
     * @type {Integer (Int32)}
     */
    static OFFLOAD_IPSEC_CONF_MAX => 4
}
