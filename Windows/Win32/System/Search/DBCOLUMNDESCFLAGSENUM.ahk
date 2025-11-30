#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class DBCOLUMNDESCFLAGSENUM extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static DBCOLUMNDESCFLAGS_TYPENAME => 1

    /**
     * @type {Integer (Int32)}
     */
    static DBCOLUMNDESCFLAGS_ITYPEINFO => 2

    /**
     * @type {Integer (Int32)}
     */
    static DBCOLUMNDESCFLAGS_PROPERTIES => 4

    /**
     * @type {Integer (Int32)}
     */
    static DBCOLUMNDESCFLAGS_CLSID => 8

    /**
     * @type {Integer (Int32)}
     */
    static DBCOLUMNDESCFLAGS_COLSIZE => 16

    /**
     * @type {Integer (Int32)}
     */
    static DBCOLUMNDESCFLAGS_DBCID => 32

    /**
     * @type {Integer (Int32)}
     */
    static DBCOLUMNDESCFLAGS_WTYPE => 64

    /**
     * @type {Integer (Int32)}
     */
    static DBCOLUMNDESCFLAGS_PRECISION => 128

    /**
     * @type {Integer (Int32)}
     */
    static DBCOLUMNDESCFLAGS_SCALE => 256
}
