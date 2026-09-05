#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Devices.Nfc
 */
class NFC_LLCP_SOCKET_CONNECT_TYPE extends Win32Enum {

    /**
     * Native name: NfcConnectBySap
     * @type {Integer (Int32)}
     */
    static BySap => 0

    /**
     * Native name: NfcConnectByUri
     * @type {Integer (Int32)}
     */
    static ByUri => 1
}
