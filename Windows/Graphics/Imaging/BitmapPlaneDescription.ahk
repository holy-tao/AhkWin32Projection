#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Struct.ahk

/**
 * Defines the format of a bitmap plane.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.graphics.imaging.bitmapplanedescription
 * @namespace Windows.Graphics.Imaging
 * @version WindowsRuntime 1.4
 */
class BitmapPlaneDescription extends Win32Struct
{
    static sizeof => 16

    static packingSize => 4

    /**
     * The byte offset to the start of the pixel data within the plane.
     * @type {Integer}
     */
    StartIndex {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * The width of the plane, in pixels.
     * @type {Integer}
     */
    Width {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * The height of the plane, in pixels.
     * @type {Integer}
     */
    Height {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * The stride of the bitmap data, in bytes.
     * @type {Integer}
     */
    Stride {
        get => NumGet(this, 12, "int")
        set => NumPut("int", value, this, 12)
    }
}
