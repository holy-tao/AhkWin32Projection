#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID2D1Brush.ahk

/**
 * Paints an area with a radial gradient.
 * @remarks
 * 
  * The <b>ID2D1RadialGradientBrush</b> is similar to the <a href="https://docs.microsoft.com/windows/win32/api/d2d1/nn-d2d1-id2d1lineargradientbrush">ID2D1LinearGradientBrush</a> in that they both map a collection of gradient stops to a gradient. However, the linear gradient has a start and an end point to define the gradient vector, while the radial gradient uses an ellipse and a gradient origin to define its gradient behavior. To define the position and size of the ellipse, use the <a href="https://docs.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1radialgradientbrush-setcenter">SetCenter</a>, <a href="https://docs.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1radialgradientbrush-setradiusx">SetRadiusX</a>, and <a href="https://docs.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1radialgradientbrush-setradiusy">SetRadiusY</a> methods to specify the center, x-radius, and y-radius of the ellipse. The gradient origin is the center of the ellipse, unless a gradient offset is specified by using the <a href="https://docs.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1radialgradientbrush-setgradientoriginoffset">SetGradientOriginOffset</a> method.
  * 
  * The brush maps the gradient stop position 0.0f of the gradient origin, and the position 1.0f is mapped to the ellipse boundary. When the gradient origin is within the ellipse, the contents of the ellipse enclose the entire [0, 1] range of the brush gradient stops. If the gradient origin is outside the bounds of the ellipse, the brush still works, but its gradient is not well-defined.
  * 
  * The start point and end point are described in the brush space and are mappped to the render target when the brush is used. Note the starting and ending coordinates are absolute, not relative to the render target size. A value of (0, 0) maps to the upper-left corner of the render target, while a value of (1, 1) maps just one pixel diagonally away from (0, 0). If there is a nonidentity brush transform or render target transform, the brush ellipse and gradient origin are also transformed.
  * 
  * It is possible to specify an ellipse that does not completely fill area being painted. When this occurs,       the            <a href="https://docs.microsoft.com/windows/win32/api/d2d1/ne-d2d1-d2d1_extend_mode">D2D1_EXTEND_MODE</a> and  setting (specified by the  brush     <a href="https://docs.microsoft.com/windows/win32/api/d2d1/nn-d2d1-id2d1gradientstopcollection">ID2D1GradientStopCollection</a>) determines how the remaining area is painted. 
  * 
  * 
  * <h3><a id="Creating_ID2D1RadialGradientBrush_Objects"></a><a id="creating_id2d1radialgradientbrush_objects"></a><a id="CREATING_ID2D1RADIALGRADIENTBRUSH_OBJECTS"></a>Creating ID2D1RadialGradientBrush Objects</h3>
  * To create a radial gradient brush, use the <a href="https://docs.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1rendertarget-createradialgradientbrush(constd2d1_radial_gradient_brush_properties__constd2d1_brush_properties__id2d1gradientstopcollection_id2d1radialgradientbrush)">ID2D1RenderTarget::CreateRadialGradientBrush</a> method of the render target on which the brush will be used. The brush may be used only with the render target that created it or with the compatible targets for that render target.
  * 
  * A radial gradient brush is a device-dependent resource: your application should create radial gradient brushes after it initializes the render target with which the brushes will be used, and recreate the brushes whenever the render target needs recreated. (For more information about resources, see <a href="https://docs.microsoft.com/windows/win32/Direct2D/resources-and-resource-domains">Resources Overview</a>.)
  * 
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//d2d1/nn-d2d1-id2d1radialgradientbrush
 * @namespace Windows.Win32.Graphics.Direct2D
 * @version v4.0.30319
 */
class ID2D1RadialGradientBrush extends ID2D1Brush{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID2D1RadialGradientBrush
     * @type {Guid}
     */
    static IID => Guid("{2cd906ac-12e2-11dc-9fed-001143a055f9}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 8

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetCenter", "SetGradientOriginOffset", "SetRadiusX", "SetRadiusY", "GetCenter", "GetGradientOriginOffset", "GetRadiusX", "GetRadiusY", "GetGradientStopCollection"]

    /**
     * 
     * @param {D2D_POINT_2F} center 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1radialgradientbrush-setcenter
     */
    SetCenter(center) {
        ComCall(8, this, "ptr", center)
    }

    /**
     * 
     * @param {D2D_POINT_2F} gradientOriginOffset 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1radialgradientbrush-setgradientoriginoffset
     */
    SetGradientOriginOffset(gradientOriginOffset) {
        ComCall(9, this, "ptr", gradientOriginOffset)
    }

    /**
     * 
     * @param {Float} radiusX 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1radialgradientbrush-setradiusx
     */
    SetRadiusX(radiusX) {
        ComCall(10, this, "float", radiusX)
    }

    /**
     * 
     * @param {Float} radiusY 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1radialgradientbrush-setradiusy
     */
    SetRadiusY(radiusY) {
        ComCall(11, this, "float", radiusY)
    }

    /**
     * 
     * @returns {D2D_POINT_2F} 
     * @see https://learn.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1radialgradientbrush-getcenter
     */
    GetCenter() {
        result := ComCall(12, this, "ptr")
        return result
    }

    /**
     * 
     * @returns {D2D_POINT_2F} 
     * @see https://learn.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1radialgradientbrush-getgradientoriginoffset
     */
    GetGradientOriginOffset() {
        result := ComCall(13, this, "ptr")
        return result
    }

    /**
     * 
     * @returns {Float} 
     * @see https://learn.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1radialgradientbrush-getradiusx
     */
    GetRadiusX() {
        result := ComCall(14, this, "float")
        return result
    }

    /**
     * 
     * @returns {Float} 
     * @see https://learn.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1radialgradientbrush-getradiusy
     */
    GetRadiusY() {
        result := ComCall(15, this, "float")
        return result
    }

    /**
     * 
     * @param {Pointer<ID2D1GradientStopCollection>} gradientStopCollection 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1radialgradientbrush-getgradientstopcollection
     */
    GetGradientStopCollection(gradientStopCollection) {
        ComCall(16, this, "ptr*", gradientStopCollection)
    }
}
