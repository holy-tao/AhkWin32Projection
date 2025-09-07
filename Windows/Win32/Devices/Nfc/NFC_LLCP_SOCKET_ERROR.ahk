#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.Devices.Nfc
 * @version v4.0.30319
 */
class NFC_LLCP_SOCKET_ERROR{

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
