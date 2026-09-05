#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies whether an arc should be greater than 180 degrees.
 * @see https://learn.microsoft.com/windows/win32/api/d2d1/ne-d2d1-d2d1_arc_size
 * @namespace Windows.Win32.Graphics.Direct2D
 */
class D2D1_ARC_SIZE extends Win32Enum {

    /**
     * An arc's sweep should be 180 degrees or less.
     * Native name: D2D1_ARC_SIZE_SMALL
     * @type {Integer (Int32)}
     */
    static SMALL => 0

    /**
     * An arc's sweep should be 180 degrees or greater.
     * Native name: D2D1_ARC_SIZE_LARGE
     * @type {Integer (Int32)}
     */
    static LARGE => 1
}
