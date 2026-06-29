#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D2D1_EXTEND_MODE.ahk" { D2D1_EXTEND_MODE }
#Import ".\D2D1_BITMAP_INTERPOLATION_MODE.ahk" { D2D1_BITMAP_INTERPOLATION_MODE }

/**
 * Describes the extend modes and the interpolation mode of an ID2D1BitmapBrush. (D2D1_BITMAP_BRUSH_PROPERTIES)
 * @see https://learn.microsoft.com/windows/win32/api/d2d1/ns-d2d1-d2d1_bitmap_brush_properties
 * @namespace Windows.Win32.Graphics.Direct2D
 */
export default struct D2D1_BITMAP_BRUSH_PROPERTIES {
    #StructPack 4

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/win32/api/d2d1/ne-d2d1-d2d1_extend_mode">D2D1_EXTEND_MODE</a></b>
     * 
     * A value that describes how the brush horizontally tiles those areas that extend past its bitmap.
     */
    extendModeX : D2D1_EXTEND_MODE

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/win32/api/d2d1/ne-d2d1-d2d1_extend_mode">D2D1_EXTEND_MODE</a></b>
     * 
     * A value that describes how the brush vertically tiles those areas that extend past its bitmap.
     */
    extendModeY : D2D1_EXTEND_MODE

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/win32/api/d2d1/ne-d2d1-d2d1_bitmap_interpolation_mode">D2D1_BITMAP_INTERPOLATION_MODE</a></b>
     * 
     * A value that specifies how the bitmap is interpolated when it is scaled or rotated.
     */
    interpolationMode : D2D1_BITMAP_INTERPOLATION_MODE

}
