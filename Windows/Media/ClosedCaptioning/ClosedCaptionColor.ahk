#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the color of closed caption UI elements.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.closedcaptioning.closedcaptioncolor
 * @namespace Windows.Media.ClosedCaptioning
 * @version WindowsRuntime 1.4
 */
class ClosedCaptionColor extends Win32Enum{

    /**
     * The default color.
     * @type {Integer (Int32)}
     */
    static Default => 0

    /**
     * White
     * @type {Integer (Int32)}
     */
    static White => 1

    /**
     * Black
     * @type {Integer (Int32)}
     */
    static Black => 2

    /**
     * Red
     * @type {Integer (Int32)}
     */
    static Red => 3

    /**
     * Green
     * @type {Integer (Int32)}
     */
    static Green => 4

    /**
     * Blue
     * @type {Integer (Int32)}
     */
    static Blue => 5

    /**
     * Yellow
     * @type {Integer (Int32)}
     */
    static Yellow => 6

    /**
     * Magenta
     * @type {Integer (Int32)}
     */
    static Magenta => 7

    /**
     * Cyan
     * @type {Integer (Int32)}
     */
    static Cyan => 8
}
