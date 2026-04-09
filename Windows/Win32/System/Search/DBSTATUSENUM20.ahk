#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Search
 */
class DBSTATUSENUM20 extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static MDSTATUS_S_CELLEMPTY => 14

    /**
     * @type {Integer (Int32)}
     */
    static DBSTATUS_S_IGNORE => 15
}
