#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Controls
 */
class HEADERITEMLEFTSTATES extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static HILS_NORMAL => 1

    /**
     * @type {Integer (Int32)}
     */
    static HILS_HOT => 2

    /**
     * @type {Integer (Int32)}
     */
    static HILS_PRESSED => 3
}
