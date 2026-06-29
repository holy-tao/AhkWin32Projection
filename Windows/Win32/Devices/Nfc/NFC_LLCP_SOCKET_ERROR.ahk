#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.Nfc
 */
export default struct NFC_LLCP_SOCKET_ERROR {
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
    static NfcLlcpErrorDisconnected => 0

    /**
     * @type {Integer (Int32)}
     */
    static NfcLlcpErrorFrameRejected => 1

    /**
     * @type {Integer (Int32)}
     */
    static NfcLlcpErrorBusyCondition => 2

    /**
     * @type {Integer (Int32)}
     */
    static NfcLlcpErrorNotBusyCondition => 3
}
