#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Storage.FileSystem
 */
class NtmsBarCodeState extends Win32Enum {

    /**
     * Native name: NTMS_BARCODESTATE_OK
     * @type {Integer (Int32)}
     */
    static BARCODESTATE_OK => 1

    /**
     * Native name: NTMS_BARCODESTATE_UNREADABLE
     * @type {Integer (Int32)}
     */
    static BARCODESTATE_UNREADABLE => 2
}
