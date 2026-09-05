#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Devices.Nfc
 */
class NFC_LLCP_SOCKET_ERROR extends Win32Enum {

    /**
     * Native name: NfcLlcpErrorDisconnected
     * @type {Integer (Int32)}
     */
    static Disconnected => 0

    /**
     * Native name: NfcLlcpErrorFrameRejected
     * @type {Integer (Int32)}
     */
    static FrameRejected => 1

    /**
     * Native name: NfcLlcpErrorBusyCondition
     * @type {Integer (Int32)}
     */
    static BusyCondition => 2

    /**
     * Native name: NfcLlcpErrorNotBusyCondition
     * @type {Integer (Int32)}
     */
    static NotBusyCondition => 3
}
