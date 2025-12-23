#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class DBSOURCETYPEENUM extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static DBSOURCETYPE_DATASOURCE => 1

    /**
     * @type {Integer (Int32)}
     */
    static DBSOURCETYPE_ENUMERATOR => 2
}
