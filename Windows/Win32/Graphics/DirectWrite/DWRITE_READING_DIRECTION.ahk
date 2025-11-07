#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies the direction in which reading progresses.
 * @see https://docs.microsoft.com/windows/win32/api//dwrite/ne-dwrite-dwrite_reading_direction
 * @namespace Windows.Win32.Graphics.DirectWrite
 * @version v4.0.30319
 */
class DWRITE_READING_DIRECTION{

    /**
     * Indicates that reading progresses from left to right.
     * @type {Integer (Int32)}
     */
    static DWRITE_READING_DIRECTION_LEFT_TO_RIGHT => 0

    /**
     * Indicates that reading progresses from right to left.
     * @type {Integer (Int32)}
     */
    static DWRITE_READING_DIRECTION_RIGHT_TO_LEFT => 1

    /**
     * <div class="alert"><b>Note</b>  Windows 8.1 and later only.</div>
     * <div> </div>
     * Indicates that reading progresses from top to bottom.
     * @type {Integer (Int32)}
     */
    static DWRITE_READING_DIRECTION_TOP_TO_BOTTOM => 2

    /**
     * <div class="alert"><b>Note</b>  Windows 8.1 and later only.</div>
     * <div> </div>
     *  Indicates that reading progresses from bottom to top.
     * @type {Integer (Int32)}
     */
    static DWRITE_READING_DIRECTION_BOTTOM_TO_TOP => 3
}
