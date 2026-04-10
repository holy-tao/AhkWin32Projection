#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Controls
 */
class OPENBOXSTATES extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static SPOB_NORMAL => 1

    /**
     * @type {Integer (Int32)}
     */
    static SPOB_HOT => 2

    /**
     * @type {Integer (Int32)}
     */
    static SPOB_SELECTED => 3

    /**
     * @type {Integer (Int32)}
     */
    static SPOB_DISABLED => 4

    /**
     * @type {Integer (Int32)}
     */
    static SPOB_FOCUSED => 5
}
