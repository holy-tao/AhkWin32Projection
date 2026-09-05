#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Storage.Imapi
 */
class RECORDER_TYPES extends Win32Enum {

    /**
     * Native name: RECORDER_CDR
     * @type {Integer (Int32)}
     */
    static CDR => 1

    /**
     * Native name: RECORDER_CDRW
     * @type {Integer (Int32)}
     */
    static CDRW => 2
}
