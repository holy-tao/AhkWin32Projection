#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.Rras
 */
export default struct PPP_LCP_INFO_AUTH_DATA {
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
    static PPP_LCP_CHAP_MD5 => 5

    /**
     * @type {Integer (UInt32)}
     */
    static PPP_LCP_CHAP_MS => 128

    /**
     * @type {Integer (UInt32)}
     */
    static PPP_LCP_CHAP_MSV2 => 129
}
