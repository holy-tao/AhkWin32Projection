#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.Rras
 */
export default struct RASPPP_PROJECTION_INFO_SERVER_AUTH_PROTOCOL {
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
    static RASLCPAP_PAP => 49187

    /**
     * @type {Integer (UInt32)}
     */
    static RASLCPAP_SPAP => 49191

    /**
     * @type {Integer (UInt32)}
     */
    static RASLCPAP_CHAP => 49699

    /**
     * @type {Integer (UInt32)}
     */
    static RASLCPAP_EAP => 49703
}
