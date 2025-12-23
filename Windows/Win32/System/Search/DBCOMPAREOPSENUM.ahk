#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class DBCOMPAREOPSENUM extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static DBCOMPAREOPS_LT => 0

    /**
     * @type {Integer (Int32)}
     */
    static DBCOMPAREOPS_LE => 1

    /**
     * @type {Integer (Int32)}
     */
    static DBCOMPAREOPS_EQ => 2

    /**
     * @type {Integer (Int32)}
     */
    static DBCOMPAREOPS_GE => 3

    /**
     * @type {Integer (Int32)}
     */
    static DBCOMPAREOPS_GT => 4

    /**
     * @type {Integer (Int32)}
     */
    static DBCOMPAREOPS_BEGINSWITH => 5

    /**
     * @type {Integer (Int32)}
     */
    static DBCOMPAREOPS_CONTAINS => 6

    /**
     * @type {Integer (Int32)}
     */
    static DBCOMPAREOPS_NE => 7

    /**
     * @type {Integer (Int32)}
     */
    static DBCOMPAREOPS_IGNORE => 8

    /**
     * @type {Integer (Int32)}
     */
    static DBCOMPAREOPS_CASESENSITIVE => 4096

    /**
     * @type {Integer (Int32)}
     */
    static DBCOMPAREOPS_CASEINSENSITIVE => 8192
}
