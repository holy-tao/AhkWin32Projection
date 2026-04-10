#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Search
 */
class DBRESULTFLAGENUM extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static DBRESULTFLAG_DEFAULT => 0

    /**
     * @type {Integer (Int32)}
     */
    static DBRESULTFLAG_ROWSET => 1

    /**
     * @type {Integer (Int32)}
     */
    static DBRESULTFLAG_ROW => 2
}
