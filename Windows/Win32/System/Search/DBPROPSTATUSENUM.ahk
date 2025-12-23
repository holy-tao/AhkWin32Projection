#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class DBPROPSTATUSENUM extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static DBPROPSTATUS_OK => 0

    /**
     * @type {Integer (Int32)}
     */
    static DBPROPSTATUS_NOTSUPPORTED => 1

    /**
     * @type {Integer (Int32)}
     */
    static DBPROPSTATUS_BADVALUE => 2

    /**
     * @type {Integer (Int32)}
     */
    static DBPROPSTATUS_BADOPTION => 3

    /**
     * @type {Integer (Int32)}
     */
    static DBPROPSTATUS_BADCOLUMN => 4

    /**
     * @type {Integer (Int32)}
     */
    static DBPROPSTATUS_NOTALLSETTABLE => 5

    /**
     * @type {Integer (Int32)}
     */
    static DBPROPSTATUS_NOTSETTABLE => 6

    /**
     * @type {Integer (Int32)}
     */
    static DBPROPSTATUS_NOTSET => 7

    /**
     * @type {Integer (Int32)}
     */
    static DBPROPSTATUS_CONFLICTING => 8
}
