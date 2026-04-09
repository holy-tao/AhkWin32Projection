#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Search
 */
class DBREASONENUM15 extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static DBREASON_ROWPOSITION_CHANGED => 15

    /**
     * @type {Integer (Int32)}
     */
    static DBREASON_ROWPOSITION_CHAPTERCHANGED => 16

    /**
     * @type {Integer (Int32)}
     */
    static DBREASON_ROWPOSITION_CLEARED => 17

    /**
     * @type {Integer (Int32)}
     */
    static DBREASON_ROW_ASYNCHINSERT => 18
}
