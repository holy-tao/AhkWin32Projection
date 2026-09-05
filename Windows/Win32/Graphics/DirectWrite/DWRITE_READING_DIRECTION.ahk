#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the direction in which reading progresses.
 * @see https://learn.microsoft.com/windows/win32/api/dwrite/ne-dwrite-dwrite_reading_direction
 * @namespace Windows.Win32.Graphics.DirectWrite
 */
class DWRITE_READING_DIRECTION extends Win32Enum {

    /**
     * Indicates that reading progresses from left to right.
     * Native name: DWRITE_READING_DIRECTION_LEFT_TO_RIGHT
     * @type {Integer (Int32)}
     */
    static LEFT_TO_RIGHT => 0

    /**
     * Indicates that reading progresses from right to left.
     * Native name: DWRITE_READING_DIRECTION_RIGHT_TO_LEFT
     * @type {Integer (Int32)}
     */
    static RIGHT_TO_LEFT => 1

    /**
     * <div class="alert"><b>Note</b>  Windows 8.1 and later only.</div>
     * <div> </div>
     * Indicates that reading progresses from top to bottom.
     * Native name: DWRITE_READING_DIRECTION_TOP_TO_BOTTOM
     * @type {Integer (Int32)}
     */
    static TOP_TO_BOTTOM => 2

    /**
     * <div class="alert"><b>Note</b>  Windows 8.1 and later only.</div>
     * <div> </div>
     *  Indicates that reading progresses from bottom to top.
     * Native name: DWRITE_READING_DIRECTION_BOTTOM_TO_TOP
     * @type {Integer (Int32)}
     */
    static BOTTOM_TO_TOP => 3
}
