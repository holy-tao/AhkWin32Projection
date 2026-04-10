#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Search
 */
class DBCOMPAREOPSENUM20 extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static DBCOMPAREOPS_NOTBEGINSWITH => 9

    /**
     * @type {Integer (Int32)}
     */
    static DBCOMPAREOPS_NOTCONTAINS => 10
}
