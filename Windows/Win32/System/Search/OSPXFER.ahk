#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Search
 */
class OSPXFER extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static OSPXFER_COMPLETE => 0

    /**
     * @type {Integer (Int32)}
     */
    static OSPXFER_ABORT => 1

    /**
     * @type {Integer (Int32)}
     */
    static OSPXFER_ERROR => 2
}
