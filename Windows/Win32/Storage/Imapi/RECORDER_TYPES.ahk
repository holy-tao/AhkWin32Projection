#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Storage.Imapi
 * @version v4.0.30319
 */
class RECORDER_TYPES extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static RECORDER_CDR => 1

    /**
     * @type {Integer (Int32)}
     */
    static RECORDER_CDRW => 2
}
