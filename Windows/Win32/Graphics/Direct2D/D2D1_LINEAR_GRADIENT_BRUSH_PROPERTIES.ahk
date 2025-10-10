#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include Common\D2D_POINT_2F.ahk

/**
 * Contains the starting point and endpoint of the gradient axis for an ID2D1LinearGradientBrush.
 * @remarks
 * 
  * Use this method when creating new <a href="https://docs.microsoft.com/windows/win32/api/d2d1/nn-d2d1-id2d1lineargradientbrush">ID2D1LinearGradientBrush</a> objects with the <a href="https://docs.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1rendertarget-createlineargradientbrush(constd2d1_linear_gradient_brush_properties__constd2d1_brush_properties__id2d1gradientstopcollection_id2d1lineargradientbrush)">CreateLinearGradientBrush</a> method. For convenience, Direct2D provides the <a href="https://docs.microsoft.com/windows/win32/api/d2d1helper/nf-d2d1helper-lineargradientbrushproperties">D2D1::LinearGradientBrushProperties</a> helper function for creating new <b>D2D1_LINEAR_GRADIENT_BRUSH_PROPERTIES</b> structures.
  * 
  * The following illustration shows how a linear gradient changes as you change its start and end points.  For the first gradient, the start point is set to (0,0) and the end point to (150, 50); this creates a diagonal gradient that starts at the upper-left corner and extends to the lower-right corner of the area being painted. When you set the start point to (0, 25) and the end point to (150, 25), a horizontal gradient is created. Similarly, setting the start point  to (75, 0) and the end point to (75, 50) creates a vertical gradient. Setting the start point to  (0, 50) and the end point to (150, 0)  creates a diagonal gradient that starts at the lower-left corner and extends to the upper-right corner of the area being painted.
  * 
  * <img alt="Illustration of four gradients with different axes" src="./images/Linear_Gradients.png"/>
  * 
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//d2d1/ns-d2d1-d2d1_linear_gradient_brush_properties
 * @namespace Windows.Win32.Graphics.Direct2D
 * @version v4.0.30319
 */
class D2D1_LINEAR_GRADIENT_BRUSH_PROPERTIES extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/win32/Direct2D/d2d1-point-2f">D2D1_POINT_2F</a></b>
     * 
     * In the brush's coordinate space, the starting point  of the gradient axis.
     * @type {D2D_POINT_2F}
     */
    startPoint{
        get {
            if(!this.HasProp("__startPoint"))
                this.__startPoint := D2D_POINT_2F(this.ptr + 0)
            return this.__startPoint
        }
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/win32/Direct2D/d2d1-point-2f">D2D1_POINT_2F</a></b>
     * 
     * In the brush's coordinate space, the endpoint  of the gradient axis.
     * @type {D2D_POINT_2F}
     */
    endPoint{
        get {
            if(!this.HasProp("__endPoint"))
                this.__endPoint := D2D_POINT_2F(this.ptr + 8)
            return this.__endPoint
        }
    }
}
