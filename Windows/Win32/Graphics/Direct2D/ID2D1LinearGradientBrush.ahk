#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ID2D1GradientStopCollection.ahk" { ID2D1GradientStopCollection }
#Import "Common\D2D_POINT_2F.ahk" { D2D_POINT_2F }
#Import ".\ID2D1Brush.ahk" { ID2D1Brush }

/**
 * Paints an area with a linear gradient.
 * @remarks
 * An <b>ID2D1LinearGradientBrush</b> paints an area with a linear gradient along a line between the brush start point and end   point. The gradient, defined by the brush <a href="https://docs.microsoft.com/windows/win32/api/d2d1/nn-d2d1-id2d1gradientstopcollection">ID2D1GradientStopCollection</a>, is extruded perpendicular to this line, and then transformed by a brush transform (if specified).  
 * 
 * The start point and end point are described in the brush space and are mapped to the render target when the brush is used. Note the starting and ending coordinates are absolute, not relative to the render target size. A value of (0, 0) maps to the upper-left corner of the render target, while a value of (1, 1) maps one pixel diagonally away from (0, 0). If there is a nonidentity brush transform or render target transform, the brush start point and end point are also transformed.  
 * 
 * It is possible to specify a gradient axis that does not completely fill the area that is being painted. When this occurs, the <a href="https://docs.microsoft.com/windows/win32/api/d2d1/ne-d2d1-d2d1_extend_mode">D2D1_EXTEND_MODE</a>, specified by the   <a href="https://docs.microsoft.com/windows/win32/api/d2d1/nn-d2d1-id2d1gradientstopcollection">ID2D1GradientStopCollection</a>, determines how the remaining area is painted. 
 * 
 * 
 * <h3><a id="Creating_ID2D1LinearGradientBrush_Objects"></a><a id="creating_id2d1lineargradientbrush_objects"></a><a id="CREATING_ID2D1LINEARGRADIENTBRUSH_OBJECTS"></a>Creating ID2D1LinearGradientBrush Objects</h3>
 * To create a linear gradient brush, use the <a href="https://docs.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1rendertarget-createlineargradientbrush(constd2d1_linear_gradient_brush_properties__constd2d1_brush_properties__id2d1gradientstopcollection_id2d1lineargradientbrush)">ID2D1RenderTarget::CreateLinearGradientBrush</a> method of the render target on which the brush will be used. The brush can only be used with the render target that created it or with  the compatible targets for that render target.
 * 
 * A linear gradient brush is a device-dependent resource: your application should create linear gradient brushes after it initializes the render target with which the brushes will be used, and recreate the brushes whenever the render target needs recreated. (For more information about resources, see <a href="https://docs.microsoft.com/windows/win32/Direct2D/resources-and-resource-domains">Resources Overview</a>.)
 * @see https://learn.microsoft.com/windows/win32/api/d2d1/nn-d2d1-id2d1lineargradientbrush
 * @namespace Windows.Win32.Graphics.Direct2D
 */
export default struct ID2D1LinearGradientBrush extends ID2D1Brush {
    /**
     * The interface identifier for ID2D1LinearGradientBrush
     * @type {Guid}
     */
    static IID := Guid("{2cd906ab-12e2-11dc-9fed-001143a055f9}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID2D1LinearGradientBrush interfaces
    */
    struct Vtbl extends ID2D1Brush.Vtbl {
        SetStartPoint             : IntPtr
        SetEndPoint               : IntPtr
        GetStartPoint             : IntPtr
        GetEndPoint               : IntPtr
        GetGradientStopCollection : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID2D1LinearGradientBrush.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Sets the starting coordinates of the linear gradient in the brush's coordinate space.
     * @remarks
     * The start point and end point are described in the brush's space and are mapped to the render target when the brush is used.  If there is a non-identity brush transform or render target transform, the brush's start point and end point are also transformed.
     * @param {D2D_POINT_2F} startPoint Type: <b><a href="https://docs.microsoft.com/windows/win32/Direct2D/d2d1-point-2f">D2D1_POINT_2F</a></b>
     * 
     * The starting two-dimensional coordinates of the linear gradient, in the brush's coordinate space.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1lineargradientbrush-setstartpoint
     */
    SetStartPoint(startPoint) {
        ComCall(8, this, D2D_POINT_2F, startPoint)
    }

    /**
     * Sets the ending coordinates of the linear gradient in the brush's coordinate space.
     * @remarks
     * The start point and end point are described in the brush's space and are mapped to the render target when the brush is used.  If there is a non-identity brush transform or render target transform, the brush's start point and end point are also transformed.
     * @param {D2D_POINT_2F} endPoint Type: <b><a href="https://docs.microsoft.com/windows/win32/Direct2D/d2d1-point-2f">D2D1_POINT_2F</a></b>
     * 
     * The ending two-dimensional coordinates of the linear gradient, in the brush's coordinate space.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1lineargradientbrush-setendpoint
     */
    SetEndPoint(endPoint) {
        ComCall(9, this, D2D_POINT_2F, endPoint)
    }

    /**
     * Retrieves the starting coordinates of the linear gradient.
     * @remarks
     * The start point and end point are described in the brush's space and are mapped to the render target when the brush is used.  If there is a non-identity brush transform or render target transform, the brush's start point and end point are also transformed.
     * @returns {D2D_POINT_2F} Type: <b><a href="https://docs.microsoft.com/windows/win32/Direct2D/d2d1-point-2f">D2D1_POINT_2F</a></b>
     * 
     * The starting two-dimensional coordinates of the linear gradient, in the brush's coordinate space.
     * @see https://learn.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1lineargradientbrush-getstartpoint
     */
    GetStartPoint() {
        result := ComCall(10, this, D2D_POINT_2F)
        return result
    }

    /**
     * Retrieves the ending coordinates of the linear gradient.
     * @remarks
     * The start point and end point are described in the brush's space and are mapped to the render target when the brush is used.  If there is a non-identity brush transform or render target transform, the brush's start point and end point are also transformed.
     * @returns {D2D_POINT_2F} Type: <b><a href="https://docs.microsoft.com/windows/win32/Direct2D/d2d1-point-2f">D2D1_POINT_2F</a></b>
     * 
     * The ending two-dimensional coordinates of the linear gradient, in the brush's coordinate space.
     * @see https://learn.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1lineargradientbrush-getendpoint
     */
    GetEndPoint() {
        result := ComCall(11, this, D2D_POINT_2F)
        return result
    }

    /**
     * Retrieves the ID2D1GradientStopCollection associated with this linear gradient brush.
     * @remarks
     * <a href="https://docs.microsoft.com/windows/win32/api/d2d1/nn-d2d1-id2d1gradientstopcollection">ID2D1GradientStopCollection</a> contains an array of <a href="https://docs.microsoft.com/windows/win32/api/d2d1/ns-d2d1-d2d1_gradient_stop">D2D1_GRADIENT_STOP</a> structures and information, such as the extend mode and the color interpolation mode.
     * @param {Pointer<ID2D1GradientStopCollection>} gradientStopCollection Type: <b><a href="https://docs.microsoft.com/windows/win32/api/d2d1/nn-d2d1-id2d1gradientstopcollection">ID2D1GradientStopCollection</a>**</b>
     * 
     * The  <a href="https://docs.microsoft.com/windows/win32/api/d2d1/nn-d2d1-id2d1gradientstopcollection">ID2D1GradientStopCollection</a> object associated with this linear gradient brush object. This parameter is passed uninitialized.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1lineargradientbrush-getgradientstopcollection
     */
    GetGradientStopCollection(gradientStopCollection) {
        ComCall(12, this, ID2D1GradientStopCollection.Ptr, gradientStopCollection)
    }

    Query(iid) {
        if (ID2D1LinearGradientBrush.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetStartPoint := CallbackCreate(GetMethod(implObj, "SetStartPoint"), flags, 2)
        this.vtbl.SetEndPoint := CallbackCreate(GetMethod(implObj, "SetEndPoint"), flags, 2)
        this.vtbl.GetStartPoint := CallbackCreate(GetMethod(implObj, "GetStartPoint"), flags, 1)
        this.vtbl.GetEndPoint := CallbackCreate(GetMethod(implObj, "GetEndPoint"), flags, 1)
        this.vtbl.GetGradientStopCollection := CallbackCreate(GetMethod(implObj, "GetGradientStopCollection"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetStartPoint)
        CallbackFree(this.vtbl.SetEndPoint)
        CallbackFree(this.vtbl.GetStartPoint)
        CallbackFree(this.vtbl.GetEndPoint)
        CallbackFree(this.vtbl.GetGradientStopCollection)
    }
}
