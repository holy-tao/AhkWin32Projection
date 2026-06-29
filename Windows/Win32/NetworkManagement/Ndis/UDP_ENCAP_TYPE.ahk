#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.Ndis
 */
export default struct UDP_ENCAP_TYPE {
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
    static OFFLOAD_IPSEC_UDPESP_ENCAPTYPE_IKE => 0

    /**
     * @type {Integer (Int32)}
     */
    static OFFLOAD_IPSEC_UDPESP_ENCAPTYPE_OTHER => 1
}
