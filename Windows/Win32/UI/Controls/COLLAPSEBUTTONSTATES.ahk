#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Controls
 * @version v4.0.30319
 */
class COLLAPSEBUTTONSTATES extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static LVCB_NORMAL => 1

    /**
     * @type {Integer (Int32)}
     */
    static LVCB_HOVER => 2

    /**
     * @type {Integer (Int32)}
     */
    static LVCB_PUSHED => 3
}
