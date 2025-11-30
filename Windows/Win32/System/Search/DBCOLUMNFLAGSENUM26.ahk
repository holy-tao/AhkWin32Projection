#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class DBCOLUMNFLAGSENUM26 extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static DBCOLUMNFLAGS_ISSTREAM => 524288

    /**
     * @type {Integer (Int32)}
     */
    static DBCOLUMNFLAGS_ISROWSET => 1048576

    /**
     * @type {Integer (Int32)}
     */
    static DBCOLUMNFLAGS_ISROW => 2097152

    /**
     * @type {Integer (Int32)}
     */
    static DBCOLUMNFLAGS_ROWSPECIFICCOLUMN => 4194304
}
