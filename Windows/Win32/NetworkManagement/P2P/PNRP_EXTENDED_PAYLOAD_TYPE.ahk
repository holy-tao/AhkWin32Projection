#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.P2P
 */
export default struct PNRP_EXTENDED_PAYLOAD_TYPE {
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
    static PNRP_EXTENDED_PAYLOAD_TYPE_NONE => 0

    /**
     * @type {Integer (Int32)}
     */
    static PNRP_EXTENDED_PAYLOAD_TYPE_BINARY => 1

    /**
     * @type {Integer (Int32)}
     */
    static PNRP_EXTENDED_PAYLOAD_TYPE_STRING => 2
}
