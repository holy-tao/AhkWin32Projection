#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class DBDATACONVERTENUM extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static DBDATACONVERT_DEFAULT => 0

    /**
     * @type {Integer (Int32)}
     */
    static DBDATACONVERT_SETDATABEHAVIOR => 1

    /**
     * @type {Integer (Int32)}
     */
    static DBDATACONVERT_LENGTHFROMNTS => 2

    /**
     * @type {Integer (Int32)}
     */
    static DBDATACONVERT_DSTISFIXEDLENGTH => 4

    /**
     * @type {Integer (Int32)}
     */
    static DBDATACONVERT_DECIMALSCALE => 8
}
