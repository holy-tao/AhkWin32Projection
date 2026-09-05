#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Devices.Nfc
 */
class NFC_DEVICE_TYPE extends Win32Enum {

    /**
     * Native name: NfcType1Tag
     * @type {Integer (Int32)}
     */
    static Type1Tag => 0

    /**
     * Native name: NfcType2Tag
     * @type {Integer (Int32)}
     */
    static Type2Tag => 1

    /**
     * Native name: NfcType3Tag
     * @type {Integer (Int32)}
     */
    static Type3Tag => 2

    /**
     * Native name: NfcType4Tag
     * @type {Integer (Int32)}
     */
    static Type4Tag => 3

    /**
     * @type {Integer (Int32)}
     */
    static NfcIP1Target => 4

    /**
     * @type {Integer (Int32)}
     */
    static NfcIP1Initiator => 5

    /**
     * Native name: NfcReader
     * @type {Integer (Int32)}
     */
    static Reader => 6
}
