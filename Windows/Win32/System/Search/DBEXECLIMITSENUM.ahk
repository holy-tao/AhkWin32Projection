#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class DBEXECLIMITSENUM extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static DBEXECLIMITS_ABORT => 1

    /**
     * @type {Integer (Int32)}
     */
    static DBEXECLIMITS_STOP => 2

    /**
     * @type {Integer (Int32)}
     */
    static DBEXECLIMITS_SUSPEND => 3
}
