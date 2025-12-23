#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class DBPROPENUM26 extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static DBPROP_OUTPUTSTREAM => 286

    /**
     * @type {Integer (Int32)}
     */
    static DBPROP_OUTPUTENCODING => 287

    /**
     * @type {Integer (Int32)}
     */
    static DBPROP_TABLESTATISTICS => 288

    /**
     * @type {Integer (Int32)}
     */
    static DBPROP_SKIPROWCOUNTRESULTS => 291

    /**
     * @type {Integer (Int32)}
     */
    static DBPROP_IRowsetBookmark => 292

    /**
     * @type {Integer (Int32)}
     */
    static MDPROP_VISUALMODE => 293
}
