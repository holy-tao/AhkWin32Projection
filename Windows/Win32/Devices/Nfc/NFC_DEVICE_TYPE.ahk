#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Devices.Nfc
 * @version v4.0.30319
 */
class NFC_DEVICE_TYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static NfcType1Tag => 0

    /**
     * @type {Integer (Int32)}
     */
    static NfcType2Tag => 1

    /**
     * @type {Integer (Int32)}
     */
    static NfcType3Tag => 2

    /**
     * @type {Integer (Int32)}
     */
    static NfcType4Tag => 3

    /**
     * @type {Integer (Int32)}
     */
    static NfcIP1Target => 4

    /**
     * @type {Integer (Int32)}
     */
    static NfcIP1Initiator => 5

    /**
     * @type {Integer (Int32)}
     */
    static NfcReader => 6
}
