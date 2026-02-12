#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Struct.ahk

/**
 * Specifies a bounding rectangle.
 * @remarks
 * This structure is used when setting the [Bounds](bitmaptransform_bounds.md) property of a [BitmapTransform](bitmaptransform.md).
 * @see https://learn.microsoft.com/uwp/api/windows.graphics.imaging.bitmapbounds
 * @namespace Windows.Graphics.Imaging
 * @version WindowsRuntime 1.4
 */
class BitmapBounds extends Win32Struct
{
    static sizeof => 16

    static packingSize => 4

    /**
     * The X coordinate, in pixels, of the top left corner of the bounding box.
     * @type {Integer}
     */
    X {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The Y coordinate, in pixels, of the top left corner of the bounding box.
     * @type {Integer}
     */
    Y {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * The Width, in pixels, of the bounding box.
     * @type {Integer}
     */
    Width {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * The Height, in pixels, of the bounding box
     * @type {Integer}
     */
    Height {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }
}
