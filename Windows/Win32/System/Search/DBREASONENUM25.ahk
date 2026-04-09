#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Search
 */
class DBREASONENUM25 extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static DBREASON_ROWSET_ROWSADDED => 19

    /**
     * @type {Integer (Int32)}
     */
    static DBREASON_ROWSET_POPULATIONCOMPLETE => 20

    /**
     * @type {Integer (Int32)}
     */
    static DBREASON_ROWSET_POPULATIONSTOPPED => 21
}
