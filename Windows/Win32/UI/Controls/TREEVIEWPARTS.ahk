#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Controls
 * @version v4.0.30319
 */
class TREEVIEWPARTS extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static TVP_TREEITEM => 1

    /**
     * @type {Integer (Int32)}
     */
    static TVP_GLYPH => 2

    /**
     * @type {Integer (Int32)}
     */
    static TVP_BRANCH => 3

    /**
     * @type {Integer (Int32)}
     */
    static TVP_HOTGLYPH => 4
}
