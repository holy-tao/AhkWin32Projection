#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D2D1_PRINT_FONT_SUBSET_MODE.ahk" { D2D1_PRINT_FONT_SUBSET_MODE }
#Import ".\D2D1_COLOR_SPACE.ahk" { D2D1_COLOR_SPACE }

/**
 * The creation properties for a ID2D1PrintControl object.
 * @see https://learn.microsoft.com/windows/win32/api/d2d1_1/ns-d2d1_1-d2d1_print_control_properties
 * @namespace Windows.Win32.Graphics.Direct2D
 */
export default struct D2D1_PRINT_CONTROL_PROPERTIES {
    #StructPack 4

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1_1/ne-d2d1_1-d2d1_print_font_subset_mode">D2D1_PRINT_FONT_SUBSET_MODE</a></b>
     * 
     * The mode to use for subsetting fonts for printing, defaults to <a href="https://docs.microsoft.com/windows/desktop/api/d2d1_1/ne-d2d1_1-d2d1_print_font_subset_mode">D2D1_PRINT_FONT_SUBSET_MODE_DEFAULT</a>.
     */
    fontSubset : D2D1_PRINT_FONT_SUBSET_MODE

    /**
     * Type: <b>FLOAT</b>
     * 
     * DPI for rasterization of all unsupported Direct2D commands or options, defaults to 150.0.
     */
    rasterDPI : Float32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1_1/ne-d2d1_1-d2d1_color_space">D2D1_COLOR_SPACE</a></b>
     * 
     * Color space for vector graphics, defaults to <a href="https://docs.microsoft.com/windows/desktop/api/d2d1_1/ne-d2d1_1-d2d1_color_space">D2D1_COLOR_SPACE_SRGB</a>.
     */
    colorSpace : D2D1_COLOR_SPACE

}
