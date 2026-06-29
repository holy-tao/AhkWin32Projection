#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "Common\D2D_POINT_2F.ahk" { D2D_POINT_2F }

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
 */
export default struct D2D1_RADIAL_GRADIENT_BRUSH_PROPERTIES {
    #StructPack 4

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/win32/Direct2D/d2d1-point-2f">D2D1_POINT_2F</a></b>
     * 
     * In the brush's coordinate space, the center of the gradient ellipse.
     */
    center : D2D_POINT_2F

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/win32/Direct2D/d2d1-point-2f">D2D1_POINT_2F</a></b>
     * 
     * In the brush's coordinate space, the offset of the gradient origin relative to the gradient ellipse's center.
     */
    gradientOriginOffset : D2D_POINT_2F

    /**
     * Type: <b>FLOAT</b>
     * 
     * In the brush's coordinate space, the x-radius  of the gradient ellipse.
     */
    radiusX : Float32

    /**
     * Type: <b>FLOAT</b>
     * 
     * In the brush's coordinate space, the y-radius  of the gradient ellipse.
     */
    radiusY : Float32

}
