#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ID2D1GradientStopCollection.ahk" { ID2D1GradientStopCollection }
#Import "Common\D2D_POINT_2F.ahk" { D2D_POINT_2F }
#Import ".\ID2D1Brush.ahk" { ID2D1Brush }

/**
 * Paints an area with a radial gradient.
 * @remarks
 * The <b>ID2D1RadialGradientBrush</b> is similar to the <a href="https://docs.microsoft.com/windows/win32/api/d2d1/nn-d2d1-id2d1lineargradientbrush">ID2D1LinearGradientBrush</a> in that they both map a collection of gradient stops to a gradient. However, the linear gradient has a start and an end point to define the gradient vector, while the radial gradient uses an ellipse and a gradient origin to define its gradient behavior. To define the position and size of the ellipse, use the <a href="https://docs.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1radialgradientbrush-setcenter">SetCenter</a>, <a href="https://docs.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1radialgradientbrush-setradiusx">SetRadiusX</a>, and <a href="https://docs.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1radialgradientbrush-setradiusy">SetRadiusY</a> methods to specify the center, x-radius, and y-radius of the ellipse. The gradient origin is the center of the ellipse, unless a gradient offset is specified by using the <a href="https://docs.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1radialgradientbrush-setgradientoriginoffset">SetGradientOriginOffset</a> method.
 * 
 * The brush maps the gradient stop position 0.0f of the gradient origin, and the position 1.0f is mapped to the ellipse boundary. When the gradient origin is within the ellipse, the contents of the ellipse enclose the entire [0, 1] range of the brush gradient stops. If the gradient origin is outside the bounds of the ellipse, the brush still works, but its gradient is not well-defined.
 * 
 * The start point and end point are described in the brush space and are mapped to the render target when the brush is used. Note the starting and ending coordinates are absolute, not relative to the render target size. A value of (0, 0) maps to the upper-left corner of the render target, while a value of (1, 1) maps just one pixel diagonally away from (0, 0). If there is a nonidentity brush transform or render target transform, the brush ellipse and gradient origin are also transformed.
 * 
 * It is possible to specify an ellipse that does not completely fill area being painted. When this occurs,       the            <a href="https://docs.microsoft.com/windows/win32/api/d2d1/ne-d2d1-d2d1_extend_mode">D2D1_EXTEND_MODE</a> and  setting (specified by the  brush     <a href="https://docs.microsoft.com/windows/win32/api/d2d1/nn-d2d1-id2d1gradientstopcollection">ID2D1GradientStopCollection</a>) determines how the remaining area is painted. 
 * 
 * 
 * <h3><a id="Creating_ID2D1RadialGradientBrush_Objects"></a><a id="creating_id2d1radialgradientbrush_objects"></a><a id="CREATING_ID2D1RADIALGRADIENTBRUSH_OBJECTS"></a>Creating ID2D1RadialGradientBrush Objects</h3>
 * To create a radial gradient brush, use the <a href="https://docs.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1rendertarget-createradialgradientbrush(constd2d1_radial_gradient_brush_properties__constd2d1_brush_properties__id2d1gradientstopcollection_id2d1radialgradientbrush)">ID2D1RenderTarget::CreateRadialGradientBrush</a> method of the render target on which the brush will be used. The brush may be used only with the render target that created it or with the compatible targets for that render target.
 * 
 * A radial gradient brush is a device-dependent resource: your application should create radial gradient brushes after it initializes the render target with which the brushes will be used, and recreate the brushes whenever the render target needs recreated. (For more information about resources, see <a href="https://docs.microsoft.com/windows/win32/Direct2D/resources-and-resource-domains">Resources Overview</a>.)
 * @see https://learn.microsoft.com/windows/win32/api/d2d1/nn-d2d1-id2d1radialgradientbrush
 * @namespace Windows.Win32.Graphics.Direct2D
 */
export default struct ID2D1RadialGradientBrush extends ID2D1Brush {
    /**
     * The interface identifier for ID2D1RadialGradientBrush
     * @type {Guid}
     */
    static IID := Guid("{2cd906ac-12e2-11dc-9fed-001143a055f9}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID2D1RadialGradientBrush interfaces
    */
    struct Vtbl extends ID2D1Brush.Vtbl {
        SetCenter                 : IntPtr
        SetGradientOriginOffset   : IntPtr
        SetRadiusX                : IntPtr
        SetRadiusY                : IntPtr
        GetCenter                 : IntPtr
        GetGradientOriginOffset   : IntPtr
        GetRadiusX                : IntPtr
        GetRadiusY                : IntPtr
        GetGradientStopCollection : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID2D1RadialGradientBrush.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Specifies the center of the gradient ellipse in the brush's coordinate space.
     * @param {D2D_POINT_2F} center Type: <b><a href="https://docs.microsoft.com/windows/win32/Direct2D/d2d1-point-2f">D2D1_POINT_2F</a></b>
     * 
     * The center of the gradient ellipse, in the brush's coordinate space.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1radialgradientbrush-setcenter
     */
    SetCenter(center) {
        ComCall(8, this, D2D_POINT_2F, center)
    }

    /**
     * Specifies the offset of the gradient origin relative to the gradient ellipse's center.
     * @param {D2D_POINT_2F} gradientOriginOffset Type: <b><a href="https://docs.microsoft.com/windows/win32/Direct2D/d2d1-point-2f">D2D1_POINT_2F</a></b>
     * 
     * The offset of the gradient origin from the center of the gradient ellipse.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1radialgradientbrush-setgradientoriginoffset
     */
    SetGradientOriginOffset(gradientOriginOffset) {
        ComCall(9, this, D2D_POINT_2F, gradientOriginOffset)
    }

    /**
     * Specifies the x-radius of the gradient ellipse, in the brush's coordinate space.
     * @param {Float} radiusX Type: <b>FLOAT</b>
     * 
     * The x-radius of the gradient ellipse. This value is in the brush's coordinate space.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1radialgradientbrush-setradiusx
     */
    SetRadiusX(radiusX) {
        ComCall(10, this, "float", radiusX)
    }

    /**
     * Specifies the y-radius of the gradient ellipse, in the brush's coordinate space.
     * @param {Float} radiusY Type: <b>FLOAT</b>
     * 
     * The y-radius of the gradient ellipse. This value is in the brush's coordinate space.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1radialgradientbrush-setradiusy
     */
    SetRadiusY(radiusY) {
        ComCall(11, this, "float", radiusY)
    }

    /**
     * Retrieves the center of the gradient ellipse.
     * @returns {D2D_POINT_2F} Type: <b><a href="https://docs.microsoft.com/windows/win32/Direct2D/d2d1-point-2f">D2D1_POINT_2F</a></b>
     * 
     * The center of the gradient ellipse. This value is expressed in the brush's coordinate space.
     * @see https://learn.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1radialgradientbrush-getcenter
     */
    GetCenter() {
        result := ComCall(12, this, D2D_POINT_2F)
        return result
    }

    /**
     * Retrieves the offset of the gradient origin relative to the gradient ellipse's center.
     * @returns {D2D_POINT_2F} Type: <b><a href="https://docs.microsoft.com/windows/win32/Direct2D/d2d1-point-2f">D2D1_POINT_2F</a></b>
     * 
     * The offset of the gradient origin from the center of the gradient ellipse. This value is expressed in the brush's coordinate space.
     * @see https://learn.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1radialgradientbrush-getgradientoriginoffset
     */
    GetGradientOriginOffset() {
        result := ComCall(13, this, D2D_POINT_2F)
        return result
    }

    /**
     * Retrieves the x-radius of the gradient ellipse.
     * @returns {Float} Type: <b>FLOAT</b>
     * 
     * The x-radius of the gradient ellipse. This value is expressed in the brush's coordinate space.
     * @see https://learn.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1radialgradientbrush-getradiusx
     */
    GetRadiusX() {
        result := ComCall(14, this, Float32)
        return result
    }

    /**
     * Retrieves the y-radius of the gradient ellipse.
     * @returns {Float} Type: <b>FLOAT</b>
     * 
     * The y-radius of the gradient ellipse. This value is expressed in the brush's coordinate space.
     * @see https://learn.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1radialgradientbrush-getradiusy
     */
    GetRadiusY() {
        result := ComCall(15, this, Float32)
        return result
    }

    /**
     * Retrieves the ID2D1GradientStopCollection associated with this radial gradient brush object.
     * @remarks
     * <a href="https://docs.microsoft.com/windows/win32/api/d2d1/nn-d2d1-id2d1gradientstopcollection">ID2D1GradientStopCollection</a> contains an array of <a href="https://docs.microsoft.com/windows/win32/api/d2d1/ns-d2d1-d2d1_gradient_stop">D2D1_GRADIENT_STOP</a> structures and additional information, such as the extend mode and the color interpolation mode.
     * @param {Pointer<ID2D1GradientStopCollection>} gradientStopCollection Type: <b><a href="https://docs.microsoft.com/windows/win32/api/d2d1/nn-d2d1-id2d1gradientstopcollection">ID2D1GradientStopCollection</a>**</b>
     * 
     * The  <a href="https://docs.microsoft.com/windows/win32/api/d2d1/nn-d2d1-id2d1gradientstopcollection">ID2D1GradientStopCollection</a> object associated with this linear gradient brush object. This parameter is passed uninitialized.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1radialgradientbrush-getgradientstopcollection
     */
    GetGradientStopCollection(gradientStopCollection) {
        ComCall(16, this, ID2D1GradientStopCollection.Ptr, gradientStopCollection)
    }

    Query(iid) {
        if (ID2D1RadialGradientBrush.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetCenter := CallbackCreate(GetMethod(implObj, "SetCenter"), flags, 2)
        this.vtbl.SetGradientOriginOffset := CallbackCreate(GetMethod(implObj, "SetGradientOriginOffset"), flags, 2)
        this.vtbl.SetRadiusX := CallbackCreate(GetMethod(implObj, "SetRadiusX"), flags, 2)
        this.vtbl.SetRadiusY := CallbackCreate(GetMethod(implObj, "SetRadiusY"), flags, 2)
        this.vtbl.GetCenter := CallbackCreate(GetMethod(implObj, "GetCenter"), flags, 1)
        this.vtbl.GetGradientOriginOffset := CallbackCreate(GetMethod(implObj, "GetGradientOriginOffset"), flags, 1)
        this.vtbl.GetRadiusX := CallbackCreate(GetMethod(implObj, "GetRadiusX"), flags, 1)
        this.vtbl.GetRadiusY := CallbackCreate(GetMethod(implObj, "GetRadiusY"), flags, 1)
        this.vtbl.GetGradientStopCollection := CallbackCreate(GetMethod(implObj, "GetGradientStopCollection"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetCenter)
        CallbackFree(this.vtbl.SetGradientOriginOffset)
        CallbackFree(this.vtbl.SetRadiusX)
        CallbackFree(this.vtbl.SetRadiusY)
        CallbackFree(this.vtbl.GetCenter)
        CallbackFree(this.vtbl.GetGradientOriginOffset)
        CallbackFree(this.vtbl.GetRadiusX)
        CallbackFree(this.vtbl.GetRadiusY)
        CallbackFree(this.vtbl.GetGradientStopCollection)
    }
}
