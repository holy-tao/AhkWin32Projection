#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Controls
 */
class DPAMM_MESSAGE extends Win32Enum {

    /**
     * Native name: DPAMM_MERGE
     * @type {Integer (UInt32)}
     */
    static MERGE => 1

    /**
     * Native name: DPAMM_DELETE
     * @type {Integer (UInt32)}
     */
    static DELETE => 2

    /**
     * Native name: DPAMM_INSERT
     * @type {Integer (UInt32)}
     */
    static INSERT => 3
}
