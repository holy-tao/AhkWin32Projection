#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Defines a normalized rectangle, which is used to specify sub-rectangles in a video rectangle.
 * @see https://docs.microsoft.com/windows/win32/api//evr/ns-evr-mfvideonormalizedrect
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class MFVideoNormalizedRect extends Win32Struct
{
    static sizeof => 16

    static packingSize => 4

    /**
     * X-coordinate of the upper-left corner of the rectangle.
     * @type {Float}
     */
    left {
        get => NumGet(this, 0, "float")
        set => NumPut("float", value, this, 0)
    }

    /**
     * Y-coordinate of the upper-left corner of the rectangle.
     * @type {Float}
     */
    top {
        get => NumGet(this, 4, "float")
        set => NumPut("float", value, this, 4)
    }

    /**
     * X-coordinate of the lower-right corner of the rectangle.
     * @type {Float}
     */
    right {
        get => NumGet(this, 8, "float")
        set => NumPut("float", value, this, 8)
    }

    /**
     * Y-coordinate of the lower-right corner of the rectangle.
     * @type {Float}
     */
    bottom {
        get => NumGet(this, 12, "float")
        set => NumPut("float", value, this, 12)
    }
}
