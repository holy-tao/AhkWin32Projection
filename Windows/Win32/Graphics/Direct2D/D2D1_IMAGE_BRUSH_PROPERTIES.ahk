#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include Common\D2D_RECT_F.ahk

/**
 * Describes image brush features.
 * @see https://learn.microsoft.com/windows/win32/api/d2d1_1/ns-d2d1_1-d2d1_image_brush_properties
 * @namespace Windows.Win32.Graphics.Direct2D
 * @version v4.0.30319
 */
class D2D1_IMAGE_BRUSH_PROPERTIES extends Win32Struct
{
    static sizeof => 28

    static packingSize => 4

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/Direct2D/d2d1-rect-f">D2D1_RECT_F</a></b>
     * 
     * The source rectangle in the image space from which the image will be tiled or interpolated.
     * @type {D2D_RECT_F}
     */
    sourceRectangle{
        get {
            if(!this.HasProp("__sourceRectangle"))
                this.__sourceRectangle := D2D_RECT_F(0, this)
            return this.__sourceRectangle
        }
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1/ne-d2d1-d2d1_extend_mode">D2D1_EXTEND_MODE</a></b>
     * 
     * The extend mode in the image x-axis.
     * @type {Integer}
     */
    extendModeX {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1/ne-d2d1-d2d1_extend_mode">D2D1_EXTEND_MODE</a></b>
     * 
     * The extend mode in the image y-axis.
     * @type {Integer}
     */
    extendModeY {
        get => NumGet(this, 20, "int")
        set => NumPut("int", value, this, 20)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/Direct2D/d2d1-rect-f">D2D1_INTERPOLATION_MODE</a></b>
     * 
     * The interpolation mode to use when scaling the image brush.
     * @type {Integer}
     */
    interpolationMode {
        get => NumGet(this, 24, "int")
        set => NumPut("int", value, this, 24)
    }
}
