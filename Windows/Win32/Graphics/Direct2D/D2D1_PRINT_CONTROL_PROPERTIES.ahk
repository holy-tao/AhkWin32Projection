#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The creation properties for a ID2D1PrintControl object.
 * @see https://docs.microsoft.com/windows/win32/api//d2d1_1/ns-d2d1_1-d2d1_print_control_properties
 * @namespace Windows.Win32.Graphics.Direct2D
 * @version v4.0.30319
 */
class D2D1_PRINT_CONTROL_PROPERTIES extends Win32Struct
{
    static sizeof => 12

    static packingSize => 4

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1_1/ne-d2d1_1-d2d1_print_font_subset_mode">D2D1_PRINT_FONT_SUBSET_MODE</a></b>
     * 
     * The mode to use for subsetting fonts for printing, defaults to <a href="https://docs.microsoft.com/windows/desktop/api/d2d1_1/ne-d2d1_1-d2d1_print_font_subset_mode">D2D1_PRINT_FONT_SUBSET_MODE_DEFAULT</a>.
     * @type {Integer}
     */
    fontSubset {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * Type: <b>FLOAT</b>
     * 
     * DPI for rasterization of all unsupported Direct2D commands or options, defaults to 150.0.
     * @type {Float}
     */
    rasterDPI {
        get => NumGet(this, 4, "float")
        set => NumPut("float", value, this, 4)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1_1/ne-d2d1_1-d2d1_color_space">D2D1_COLOR_SPACE</a></b>
     * 
     * Color space for vector graphics, defaults to <a href="https://docs.microsoft.com/windows/desktop/api/d2d1_1/ne-d2d1_1-d2d1_color_space">D2D1_COLOR_SPACE_SRGB</a>.
     * @type {Integer}
     */
    colorSpace {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }
}
