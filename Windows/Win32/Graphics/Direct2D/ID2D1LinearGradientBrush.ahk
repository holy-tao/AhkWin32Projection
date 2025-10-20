#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID2D1Brush.ahk

/**
 * Paints an area with a linear gradient.
 * @remarks
 * 
  * An <b>ID2D1LinearGradientBrush</b> paints an area with a linear gradient along a line between the brush start point and end   point. The gradient, defined by the brush <a href="https://docs.microsoft.com/windows/win32/api/d2d1/nn-d2d1-id2d1gradientstopcollection">ID2D1GradientStopCollection</a>, is extruded perpendicular to this line, and then transformed by a brush transform (if specified).  
  * 
  * The start point and end   point are described in the brush space and are mappped to the render target when the brush is used. Note the starting and ending coordinates are absolute, not relative to the render target size. A value of (0, 0) maps to the upper-left corner of the render target, while a value of (1, 1) maps one pixel diagonally away from (0, 0). If there is a nonidentity brush transform or render target transform, the brush start point and end point are also transformed.  
  * 
  * It is possible to specify a gradient axis that does not completely fill the area that is being painted. When this occurs, the <a href="https://docs.microsoft.com/windows/win32/api/d2d1/ne-d2d1-d2d1_extend_mode">D2D1_EXTEND_MODE</a>, specified by the   <a href="https://docs.microsoft.com/windows/win32/api/d2d1/nn-d2d1-id2d1gradientstopcollection">ID2D1GradientStopCollection</a>, determines how the remaining area is painted. 
  * 
  * 
  * <h3><a id="Creating_ID2D1LinearGradientBrush_Objects"></a><a id="creating_id2d1lineargradientbrush_objects"></a><a id="CREATING_ID2D1LINEARGRADIENTBRUSH_OBJECTS"></a>Creating ID2D1LinearGradientBrush Objects</h3>
  * To create a linear gradient brush, use the <a href="https://docs.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1rendertarget-createlineargradientbrush(constd2d1_linear_gradient_brush_properties__constd2d1_brush_properties__id2d1gradientstopcollection_id2d1lineargradientbrush)">ID2D1RenderTarget::CreateLinearGradientBrush</a> method of the render target on which the brush will be used. The brush can only be used with the render target that created it or with  the compatible targets for that render target.
  * 
  * A linear gradient brush is a device-dependent resource: your application should create linear gradient brushes after it initializes the render target with which the brushes will be used, and recreate the brushes whenever the render target needs recreated. (For more information about resources, see <a href="https://docs.microsoft.com/windows/win32/Direct2D/resources-and-resource-domains">Resources Overview</a>.)
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//d2d1/nn-d2d1-id2d1lineargradientbrush
 * @namespace Windows.Win32.Graphics.Direct2D
 * @version v4.0.30319
 */
class ID2D1LinearGradientBrush extends ID2D1Brush{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID2D1LinearGradientBrush
     * @type {Guid}
     */
    static IID => Guid("{2cd906ab-12e2-11dc-9fed-001143a055f9}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 8

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetStartPoint", "SetEndPoint", "GetStartPoint", "GetEndPoint", "GetGradientStopCollection"]

    /**
     * 
     * @param {D2D_POINT_2F} startPoint 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1lineargradientbrush-setstartpoint
     */
    SetStartPoint(startPoint) {
        ComCall(8, this, "ptr", startPoint)
    }

    /**
     * 
     * @param {D2D_POINT_2F} endPoint 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1lineargradientbrush-setendpoint
     */
    SetEndPoint(endPoint) {
        ComCall(9, this, "ptr", endPoint)
    }

    /**
     * 
     * @returns {D2D_POINT_2F} 
     * @see https://learn.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1lineargradientbrush-getstartpoint
     */
    GetStartPoint() {
        result := ComCall(10, this, "ptr")
        return result
    }

    /**
     * 
     * @returns {D2D_POINT_2F} 
     * @see https://learn.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1lineargradientbrush-getendpoint
     */
    GetEndPoint() {
        result := ComCall(11, this, "ptr")
        return result
    }

    /**
     * 
     * @param {Pointer<ID2D1GradientStopCollection>} gradientStopCollection 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1lineargradientbrush-getgradientstopcollection
     */
    GetGradientStopCollection(gradientStopCollection) {
        ComCall(12, this, "ptr*", gradientStopCollection)
    }
}
