#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Properties of a transformed image source.
 * @see https://docs.microsoft.com/windows/win32/api//d2d1_3/ns-d2d1_3-d2d1_transformed_image_source_properties
 * @namespace Windows.Win32.Graphics.Direct2D
 * @version v4.0.30319
 */
class D2D1_TRANSFORMED_IMAGE_SOURCE_PROPERTIES extends Win32Struct
{
    static sizeof => 20

    static packingSize => 4

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1_3/ne-d2d1_3-d2d1_orientation">D2D1_ORIENTATION</a></b>
     * 
     * The orientation at which the image source is drawn.
     * @type {Integer}
     */
    orientation {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * Type: <b>FLOAT</b>
     * 
     * The horizontal scale factor at which the image source is drawn.
     * @type {Float}
     */
    scaleX {
        get => NumGet(this, 4, "float")
        set => NumPut("float", value, this, 4)
    }

    /**
     * Type: <b>FLOAT</b>
     * 
     * The vertical scale factor at which the image source is drawn.
     * @type {Float}
     */
    scaleY {
        get => NumGet(this, 8, "float")
        set => NumPut("float", value, this, 8)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1_1/ne-d2d1_1-d2d1_interpolation_mode">D2D1_INTERPOLATION_MODE</a></b>
     * 
     * The interpolation mode used when the image source is drawn.  This is ignored if the image source is drawn using the DrawImage method, or using an image brush.
     * @type {Integer}
     */
    interpolationMode {
        get => NumGet(this, 12, "int")
        set => NumPut("int", value, this, 12)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1_3/ne-d2d1_3-d2d1_transformed_image_source_options">D2D1_TRANSFORMED_IMAGE_SOURCE_OPTIONS</a></b>
     * 
     * Image sourc option flags.
     * @type {Integer}
     */
    options {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }
}
