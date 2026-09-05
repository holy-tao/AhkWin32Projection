#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Devices.Nfc
 */
class NFC_P2P_MODE extends Win32Enum {

    /**
     * Native name: NfcDepDefault
     * @type {Integer (Int32)}
     */
    static DepDefault => 0

    /**
     * Native name: NfcDepPoll
     * @type {Integer (Int32)}
     */
    static DepPoll => 1

    /**
     * Native name: NfcDepListen
     * @type {Integer (Int32)}
     */
    static DepListen => 2
}
