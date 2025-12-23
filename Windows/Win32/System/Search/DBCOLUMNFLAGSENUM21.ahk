#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class DBCOLUMNFLAGSENUM21 extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static DBCOLUMNFLAGS_ISROWURL => 65536

    /**
     * @type {Integer (Int32)}
     */
    static DBCOLUMNFLAGS_ISDEFAULTSTREAM => 131072

    /**
     * @type {Integer (Int32)}
     */
    static DBCOLUMNFLAGS_ISCOLLECTION => 262144
}
