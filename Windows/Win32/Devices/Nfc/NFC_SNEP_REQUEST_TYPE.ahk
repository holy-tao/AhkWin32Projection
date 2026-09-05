#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Devices.Nfc
 */
class NFC_SNEP_REQUEST_TYPE extends Win32Enum {

    /**
     * Native name: SnepRequestGet
     * @type {Integer (Int32)}
     */
    static Get => 0

    /**
     * Native name: SnepRequestPut
     * @type {Integer (Int32)}
     */
    static Put => 1
}
