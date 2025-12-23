#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.TabletPC
 * @version v4.0.30319
 */
class VisualState extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static InPlace => 0

    /**
     * @type {Integer (Int32)}
     */
    static Floating => 1

    /**
     * @type {Integer (Int32)}
     */
    static DockedTop => 2

    /**
     * @type {Integer (Int32)}
     */
    static DockedBottom => 3

    /**
     * @type {Integer (Int32)}
     */
    static Closed => 4
}
