#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.Rras
 */
export default struct PPP_LCP {
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
    static PPP_LCP_PAP => 49187

    /**
     * @type {Integer (UInt32)}
     */
    static PPP_LCP_CHAP => 49699

    /**
     * @type {Integer (UInt32)}
     */
    static PPP_LCP_EAP => 49703

    /**
     * @type {Integer (UInt32)}
     */
    static PPP_LCP_SPAP => 49191
}
