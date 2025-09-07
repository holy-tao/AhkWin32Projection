#Requires AutoHotkey v2.0.0 64-bit

/**
 * Indicates the direction of how lines of text are placed relative to one another.
 * @see https://learn.microsoft.com/windows/win32/api/dwrite/ne-dwrite-dwrite_flow_direction
 * @namespace Windows.Win32.Graphics.DirectWrite
 * @version v4.0.30319
 */
class DWRITE_FLOW_DIRECTION{

    /**
     * Specifies that text lines are placed from top to bottom.
     * @type {Integer (Int32)}
     */
    static DWRITE_FLOW_DIRECTION_TOP_TO_BOTTOM => 0

    /**
     * Specifies that text lines are placed from bottom to top.
     * @type {Integer (Int32)}
     */
    static DWRITE_FLOW_DIRECTION_BOTTOM_TO_TOP => 1

    /**
     * Specifies that text lines are placed from left to right.
     * @type {Integer (Int32)}
     */
    static DWRITE_FLOW_DIRECTION_LEFT_TO_RIGHT => 2

    /**
     * Specifies that text lines are placed from right to left.
     * @type {Integer (Int32)}
     */
    static DWRITE_FLOW_DIRECTION_RIGHT_TO_LEFT => 3
}
