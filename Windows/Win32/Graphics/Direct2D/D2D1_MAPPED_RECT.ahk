#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Describes mapped memory from the ID2D1Bitmap1::Map API.
 * @remarks
 * 
 * The mapped rectangle is used to map a rectangle into the caller's address space.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//d2d1_1/ns-d2d1_1-d2d1_mapped_rect
 * @namespace Windows.Win32.Graphics.Direct2D
 * @version v4.0.30319
 */
class D2D1_MAPPED_RECT extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * The size in bytes of an individual scanline in the bitmap.
     * @type {Integer}
     */
    pitch {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The data inside the bitmap.
     * @type {Pointer<Integer>}
     */
    bits {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
