#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The LinearGradientMode enumeration specifies the direction in which the change of color occurs for a linear gradient brush.
 * @see https://docs.microsoft.com/windows/win32/api//gdiplusenums/ne-gdiplusenums-lineargradientmode
 * @namespace Windows.Win32.Graphics.GdiPlus
 * @version v4.0.30319
 */
class LinearGradientMode extends Win32Enum{

    /**
     * Specifies the color to change in a horizontal direction from the left of the display to the right of the display.
     * @type {Integer (Int32)}
     */
    static LinearGradientModeHorizontal => 0

    /**
     * Specifies the color to change in a vertical direction from the top of the display to the bottom of the display.
     * @type {Integer (Int32)}
     */
    static LinearGradientModeVertical => 1

    /**
     * Specifies the color to change in a forward diagonal direction from the upper-left corner to the lower-right corner of the display.
     * @type {Integer (Int32)}
     */
    static LinearGradientModeForwardDiagonal => 2

    /**
     * Specifies the color to change in a backward diagonal direction from the upper-right corner to the lower-left corner of the display.
     * @type {Integer (Int32)}
     */
    static LinearGradientModeBackwardDiagonal => 3
}
