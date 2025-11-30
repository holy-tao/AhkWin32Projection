#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class DBBINDSTATUSENUM extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static DBBINDSTATUS_OK => 0

    /**
     * @type {Integer (Int32)}
     */
    static DBBINDSTATUS_BADORDINAL => 1

    /**
     * @type {Integer (Int32)}
     */
    static DBBINDSTATUS_UNSUPPORTEDCONVERSION => 2

    /**
     * @type {Integer (Int32)}
     */
    static DBBINDSTATUS_BADBINDINFO => 3

    /**
     * @type {Integer (Int32)}
     */
    static DBBINDSTATUS_BADSTORAGEFLAGS => 4

    /**
     * @type {Integer (Int32)}
     */
    static DBBINDSTATUS_NOINTERFACE => 5

    /**
     * @type {Integer (Int32)}
     */
    static DBBINDSTATUS_MULTIPLESTORAGE => 6
}
