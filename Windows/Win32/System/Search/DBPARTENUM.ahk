#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class DBPARTENUM extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static DBPART_INVALID => 0

    /**
     * @type {Integer (Int32)}
     */
    static DBPART_VALUE => 1

    /**
     * @type {Integer (Int32)}
     */
    static DBPART_LENGTH => 2

    /**
     * @type {Integer (Int32)}
     */
    static DBPART_STATUS => 4
}
