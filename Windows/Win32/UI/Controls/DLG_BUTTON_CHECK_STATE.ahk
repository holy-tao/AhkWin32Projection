#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Controls
 * @version v4.0.30319
 */
class DLG_BUTTON_CHECK_STATE extends Win32Enum{

    /**
     * @type {Integer (UInt32)}
     */
    static BST_CHECKED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static BST_INDETERMINATE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static BST_UNCHECKED => 0
}
