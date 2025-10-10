#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Describes the extend modes and the interpolation mode of an ID2D1BitmapBrush.
 * @see https://docs.microsoft.com/windows/win32/api//d2d1/ns-d2d1-d2d1_bitmap_brush_properties
 * @namespace Windows.Win32.Graphics.Direct2D
 * @version v4.0.30319
 */
class D2D1_BITMAP_BRUSH_PROPERTIES extends Win32Struct
{
    static sizeof => 12

    static packingSize => 4

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/win32/api/d2d1/ne-d2d1-d2d1_extend_mode">D2D1_EXTEND_MODE</a></b>
     * 
     * A value that describes how the brush horizontally tiles those areas that extend past its bitmap.
     * @type {Integer}
     */
    extendModeX {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/win32/api/d2d1/ne-d2d1-d2d1_extend_mode">D2D1_EXTEND_MODE</a></b>
     * 
     * A value that describes how the brush vertically tiles those areas that extend past its bitmap.
     * @type {Integer}
     */
    extendModeY {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/win32/api/d2d1/ne-d2d1-d2d1_bitmap_interpolation_mode">D2D1_BITMAP_INTERPOLATION_MODE</a></b>
     * 
     * A value that specifies how the bitmap is interpolated when it is scaled or rotated.
     * @type {Integer}
     */
    interpolationMode {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }
}
