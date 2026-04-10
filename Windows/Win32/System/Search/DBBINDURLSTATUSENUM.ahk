#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Search
 */
class DBBINDURLSTATUSENUM extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static DBBINDURLSTATUS_S_OK => 0

    /**
     * @type {Integer (Int32)}
     */
    static DBBINDURLSTATUS_S_DENYNOTSUPPORTED => 1

    /**
     * @type {Integer (Int32)}
     */
    static DBBINDURLSTATUS_S_DENYTYPENOTSUPPORTED => 4

    /**
     * @type {Integer (Int32)}
     */
    static DBBINDURLSTATUS_S_REDIRECTED => 8
}
