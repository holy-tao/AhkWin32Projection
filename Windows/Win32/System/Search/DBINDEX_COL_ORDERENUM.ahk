#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Search
 */
class DBINDEX_COL_ORDERENUM extends Win32Enum {

    /**
     * Native name: DBINDEX_COL_ORDER_ASC
     * @type {Integer (Int32)}
     */
    static ORDER_ASC => 0

    /**
     * Native name: DBINDEX_COL_ORDER_DESC
     * @type {Integer (Int32)}
     */
    static ORDER_DESC => 1
}
