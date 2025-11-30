#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Controls
 * @version v4.0.30319
 */
class CHEVRONSTATES extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static CHEVS_NORMAL => 1

    /**
     * @type {Integer (Int32)}
     */
    static CHEVS_HOT => 2

    /**
     * @type {Integer (Int32)}
     */
    static CHEVS_PRESSED => 3
}
