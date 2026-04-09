#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Search
 */
class DBSOURCETYPEENUM20 extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static DBSOURCETYPE_DATASOURCE_TDP => 1

    /**
     * @type {Integer (Int32)}
     */
    static DBSOURCETYPE_DATASOURCE_MDP => 3
}
