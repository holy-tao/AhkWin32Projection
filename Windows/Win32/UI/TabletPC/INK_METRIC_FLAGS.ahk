#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.TabletPC
 * @version v4.0.30319
 */
class INK_METRIC_FLAGS extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static IMF_FONT_SELECTED_IN_HDC => 1

    /**
     * @type {Integer (Int32)}
     */
    static IMF_ITALIC => 2

    /**
     * @type {Integer (Int32)}
     */
    static IMF_BOLD => 4
}
