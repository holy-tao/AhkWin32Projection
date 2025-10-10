#Requires AutoHotkey v2.0.0 64-bit

/**
 * Defines the size of the bitmap to use to represent the WinSAT score.
 * @see https://docs.microsoft.com/windows/win32/api//winsatcominterfacei/ne-winsatcominterfacei-winsat_bitmap_size
 * @namespace Windows.Win32.System.AssessmentTool
 * @version v4.0.30319
 */
class WINSAT_BITMAP_SIZE{

    /**
     * Use a 32 x 24 bitmap (size is in pixels).
     * @type {Integer (Int32)}
     */
    static WINSAT_BITMAP_SIZE_SMALL => 0

    /**
     * Use an 80 x 80 bitmap (size is in pixels).
     * @type {Integer (Int32)}
     */
    static WINSAT_BITMAP_SIZE_NORMAL => 1
}
