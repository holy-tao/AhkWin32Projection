#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Controls
 * @version v4.0.30319
 */
class EXPANDBUTTONSTATES extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static LVEB_NORMAL => 1

    /**
     * @type {Integer (Int32)}
     */
    static LVEB_HOVER => 2

    /**
     * @type {Integer (Int32)}
     */
    static LVEB_PUSHED => 3
}
