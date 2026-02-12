#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Alignment options for tab positions.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.text.tabalignment
 * @namespace Windows.UI.Text
 * @version WindowsRuntime 1.4
 */
class TabAlignment extends Win32Enum{

    /**
     * Text is left justified from the tab position. This is the default.
     * @type {Integer (Int32)}
     */
    static Left => 0

    /**
     * Text is centered on the tab position.
     * @type {Integer (Int32)}
     */
    static Center => 1

    /**
     * Text is right justified from the tab position.
     * @type {Integer (Int32)}
     */
    static Right => 2

    /**
     * The decimal point is set at the tab position. This is useful for aligning a column of decimal numbers.
     * @type {Integer (Int32)}
     */
    static Decimal => 3

    /**
     * A vertical bar is positioned at the tab position. Text is not affected. Alignment bars on nearby lines at the same position form a continuous vertical line.
     * @type {Integer (Int32)}
     */
    static Bar => 4
}
