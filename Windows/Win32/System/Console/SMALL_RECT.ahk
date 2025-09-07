#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Defines the coordinates of the upper left and lower right corners of a rectangle.
 * @remarks
 * This structure is used by console functions to specify rectangular areas of console screen buffers, where the coordinates specify the rows and columns of screen-buffer character cells.
 * @see https://learn.microsoft.com/windows/console/small-rect-str
 * @namespace Windows.Win32.System.Console
 * @version v4.0.30319
 */
class SMALL_RECT extends Win32Struct
{
    static sizeof => 8

    static packingSize => 2

    /**
     * The x-coordinate of the upper left corner of the rectangle.
     * @type {Integer}
     */
    Left {
        get => NumGet(this, 0, "short")
        set => NumPut("short", value, this, 0)
    }

    /**
     * The y-coordinate of the upper left corner of the rectangle.
     * @type {Integer}
     */
    Top {
        get => NumGet(this, 2, "short")
        set => NumPut("short", value, this, 2)
    }

    /**
     * The x-coordinate of the lower right corner of the rectangle.
     * @type {Integer}
     */
    Right {
        get => NumGet(this, 4, "short")
        set => NumPut("short", value, this, 4)
    }

    /**
     * The y-coordinate of the lower right corner of the rectangle.
     * @type {Integer}
     */
    Bottom {
        get => NumGet(this, 6, "short")
        set => NumPut("short", value, this, 6)
    }
}
