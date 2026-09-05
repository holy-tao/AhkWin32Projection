#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Search
 */
class OSPXFER extends Win32Enum {

    /**
     * Native name: OSPXFER_COMPLETE
     * @type {Integer (Int32)}
     */
    static COMPLETE => 0

    /**
     * Native name: OSPXFER_ABORT
     * @type {Integer (Int32)}
     */
    static ABORT => 1

    /**
     * Native name: OSPXFER_ERROR
     * @type {Integer (Int32)}
     */
    static ERROR => 2
}
