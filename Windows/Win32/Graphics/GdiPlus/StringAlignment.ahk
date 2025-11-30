#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The StringAlignment enumeration specifies how a string is aligned in reference to the bounding rectangle. A bounding rectangle is used to define the area in which the text displays.
 * @see https://docs.microsoft.com/windows/win32/api//gdiplusenums/ne-gdiplusenums-stringalignment
 * @namespace Windows.Win32.Graphics.GdiPlus
 * @version v4.0.30319
 */
class StringAlignment extends Win32Enum{

    /**
     * Specifies that alignment is towards the origin of the bounding rectangle. May be used for alignment of characters along the line or for alignment of lines within the rectangle. For a right to left bounding rectangle (<a href="https://docs.microsoft.com/windows/desktop/api/gdiplusenums/ne-gdiplusenums-stringformatflags">StringFormatFlagsDirectionRightToLeft</a>), the origin is at the upper right.
     * @type {Integer (Int32)}
     */
    static StringAlignmentNear => 0

    /**
     * Specifies that alignment is centered between origin and extent (width) of the formatting rectangle.
     * @type {Integer (Int32)}
     */
    static StringAlignmentCenter => 1

    /**
     * Specifies that alignment is to the far extent (right side) of the formatting rectangle.
     * @type {Integer (Int32)}
     */
    static StringAlignmentFar => 2
}
