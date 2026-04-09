#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Search
 */
class DBMATCHTYPEENUM extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static DBMATCHTYPE_FULL => 0

    /**
     * @type {Integer (Int32)}
     */
    static DBMATCHTYPE_NONE => 1

    /**
     * @type {Integer (Int32)}
     */
    static DBMATCHTYPE_PARTIAL => 2
}
