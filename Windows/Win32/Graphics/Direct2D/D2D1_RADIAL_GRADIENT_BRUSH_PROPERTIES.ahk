#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include Common\D2D_POINT_2F.ahk

/**
 * Contains the gradient origin offset and the size and position of the gradient ellipse for an ID2D1RadialGradientBrush.
 * @remarks
 * Different values for <i>center</i>,  <i>gradientOriginOffset</i>,  <i>radiusX</i> and/or <i>radiusY</i> produce different gradients.   The following illustration shows several radial gradients that have different gradient origin offsets, creating the appearance of the light illuminating the circles from different angles.
  * 
  * <img alt="Illustration of four circles with radial gradients that have different origin offsets" src="./images/RadialGradient.png"/>
  * 
  * For convenience, Direct2D provides the <a href="https://docs.microsoft.com/windows/win32/api/d2d1helper/nf-d2d1helper-radialgradientbrushproperties">D2D1::RadialGradientBrushProperties</a> function for creating new <b>D2D1_RADIAL_GRADIENT_BRUSH</b> structures.
 * @see https://learn.microsoft.com/windows/win32/api/d2d1/ns-d2d1-d2d1_radial_gradient_brush_properties
 * @namespace Windows.Win32.Graphics.Direct2D
 * @version v4.0.30319
 */
class D2D1_RADIAL_GRADIENT_BRUSH_PROPERTIES extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/win32/Direct2D/d2d1-point-2f">D2D1_POINT_2F</a></b>
     * 
     * In the brush's coordinate space, the center of the gradient ellipse.
     * @type {D2D_POINT_2F}
     */
    center{
        get {
            if(!this.HasProp("__center"))
                this.__center := D2D_POINT_2F(this.ptr + 0)
            return this.__center
        }
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/win32/Direct2D/d2d1-point-2f">D2D1_POINT_2F</a></b>
     * 
     * In the brush's coordinate space, the offset of the gradient origin relative to the gradient ellipse's center.
     * @type {D2D_POINT_2F}
     */
    gradientOriginOffset{
        get {
            if(!this.HasProp("__gradientOriginOffset"))
                this.__gradientOriginOffset := D2D_POINT_2F(this.ptr + 8)
            return this.__gradientOriginOffset
        }
    }

    /**
     * Type: <b>FLOAT</b>
     * 
     * In the brush's coordinate space, the x-radius  of the gradient ellipse.
     * @type {Float}
     */
    radiusX {
        get => NumGet(this, 16, "float")
        set => NumPut("float", value, this, 16)
    }

    /**
     * Type: <b>FLOAT</b>
     * 
     * In the brush's coordinate space, the y-radius  of the gradient ellipse.
     * @type {Float}
     */
    radiusY {
        get => NumGet(this, 20, "float")
        set => NumPut("float", value, this, 20)
    }
}
