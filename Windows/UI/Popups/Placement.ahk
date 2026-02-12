#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies where the context menu should be positioned relative to the selection rectangle.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.popups.placement
 * @namespace Windows.UI.Popups
 * @version WindowsRuntime 1.4
 */
class Placement extends Win32Enum{

    /**
     * Place the context menu above the selection rectangle.
     * @type {Integer (Int32)}
     */
    static Default => 0

    /**
     * Place the context menu above the selection rectangle.
     * @type {Integer (Int32)}
     */
    static Above => 1

    /**
     * Place the context menu below the selection rectangle.
     * @type {Integer (Int32)}
     */
    static Below => 2

    /**
     * Place the context menu to the left of the selection rectangle.
     * @type {Integer (Int32)}
     */
    static Left => 3

    /**
     * Place the context menu to the right of the selection rectangle.
     * @type {Integer (Int32)}
     */
    static Right => 4
}
