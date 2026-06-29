#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Defines the coordinates of the upper left and lower right corners of a rectangle.
 * @remarks
 * This structure is used by console functions to specify rectangular areas of console screen buffers, where the coordinates specify the rows and columns of screen-buffer character cells.
 * @see https://learn.microsoft.com/windows/console/small-rect-str
 * @namespace Windows.Win32.System.Console
 */
export default struct SMALL_RECT {
    #StructPack 2

    /**
     * The x-coordinate of the upper left corner of the rectangle.
     */
    Left : Int16

    /**
     * The y-coordinate of the upper left corner of the rectangle.
     */
    Top : Int16

    /**
     * The x-coordinate of the lower right corner of the rectangle.
     */
    Right : Int16

    /**
     * The y-coordinate of the lower right corner of the rectangle.
     */
    Bottom : Int16

}
