#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\DIRECTMANIPULATION_HORIZONTALALIGNMENT.ahk" { DIRECTMANIPULATION_HORIZONTALALIGNMENT }
#Import ".\DIRECTMANIPULATION_SNAPPOINT_TYPE.ahk" { DIRECTMANIPULATION_SNAPPOINT_TYPE }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\DIRECTMANIPULATION_MOTION_TYPES.ahk" { DIRECTMANIPULATION_MOTION_TYPES }
#Import ".\DIRECTMANIPULATION_SNAPPOINT_COORDINATE.ahk" { DIRECTMANIPULATION_SNAPPOINT_COORDINATE }
#Import ".\DIRECTMANIPULATION_VERTICALALIGNMENT.ahk" { DIRECTMANIPULATION_VERTICALALIGNMENT }

/**
 * Encapsulates the primary content inside a viewport.
 * @see https://learn.microsoft.com/windows/win32/api/directmanipulation/nn-directmanipulation-idirectmanipulationprimarycontent
 * @namespace Windows.Win32.Graphics.DirectManipulation
 */
export default struct IDirectManipulationPrimaryContent extends IUnknown {
    /**
     * The interface identifier for IDirectManipulationPrimaryContent
     * @type {Guid}
     */
    static IID := Guid("{c12851e4-1698-4625-b9b1-7ca3ec18630b}")

    /**
     * The class identifier for DirectManipulationPrimaryContent
     * @type {Guid}
     */
    static CLSID := Guid("{caa02661-d59e-41c7-8393-3ba3bacb6b57}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDirectManipulationPrimaryContent interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        SetSnapInterval        : IntPtr
        SetSnapPoints          : IntPtr
        SetSnapType            : IntPtr
        SetSnapCoordinate      : IntPtr
        SetZoomBoundaries      : IntPtr
        SetHorizontalAlignment : IntPtr
        SetVerticalAlignment   : IntPtr
        GetInertiaEndTransform : IntPtr
        GetCenterPoint         : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDirectManipulationPrimaryContent.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Specifies snap points for the inertia end position at uniform intervals.
     * @remarks
     * Snap point locations are in content coordinate units. 
     * 
     * Specify snap points through <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/directmanipulation/nf-directmanipulation-idirectmanipulationprimarycontent-setsnappoints">SetSnapPoints</a> or <b>SetSnapInterval</b>. 
     * 
     * If snap points are invalid (for example, outside of the content boundaries), they are ignored and the content is always within the content boundaries. 
     * 
     * Snap points are not at boundaries by default. If you wish for content to stop at a boundary, a snap point must be set at the boundary.
     * 
     *  Snap points set by <b>SetSnapInterval</b> can be cleared by calling <b>SetSnapInterval</b> with an interval of 0.0f.
     * @param {DIRECTMANIPULATION_MOTION_TYPES} motion One of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/directmanipulation/ne-directmanipulation-directmanipulation_motion_types">DIRECTMANIPULATION_MOTION_TYPES</a> enumeration values.
     * @param {Float} _interval The interval between each snap point.
     * @param {Float} offset The offset from the coordinate specified in <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/directmanipulation/nf-directmanipulation-idirectmanipulationprimarycontent-setsnapcoordinate">SetSnapCoordinate</a>.
     * @returns {HRESULT} If the method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/directmanipulation/nf-directmanipulation-idirectmanipulationprimarycontent-setsnapinterval
     */
    SetSnapInterval(motion, _interval, offset) {
        result := ComCall(3, this, DIRECTMANIPULATION_MOTION_TYPES, motion, "float", _interval, "float", offset, "HRESULT")
        return result
    }

    /**
     * Specifies the snap points for the inertia rest position.
     * @remarks
     * If snap points are invalid (for example, outside of the content boundaries), they are ignored and the content is always within the content boundaries.
     * @param {DIRECTMANIPULATION_MOTION_TYPES} motion One or more of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/directmanipulation/ne-directmanipulation-directmanipulation_motion_types">DIRECTMANIPULATION_MOTION_TYPES</a> enumeration values. Only <b>DIRECTMANIPULATION_MOTION_TRANSLATE_X</b>, <b>DIRECTMANIPULATION_MOTION_TRANSLATE_Y</b>, or <b>DIRECTMANIPULATION_MOTION_ZOOM</b> are allowed.
     * @param {Pointer<Float>} _points An array of snap points within the boundaries of the content to snap to. Should be specified in increasing order relative to the origin set in <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/directmanipulation/nf-directmanipulation-idirectmanipulationprimarycontent-setsnapcoordinate">SetSnapCoordinate</a>.
     * @param {Integer} pointCount The size of the array of snap points. Should be greater than 0.
     * @returns {HRESULT} If the method succeeds, it returns <b>S_OK</b>. If there is no change in the snap points, this method can return <b>S_FALSE</b>. Otherwise, it returns an <b>HRESULT</b> error code. If invalid snap points are specified, existing snap points might be affected.
     * @see https://learn.microsoft.com/windows/win32/api/directmanipulation/nf-directmanipulation-idirectmanipulationprimarycontent-setsnappoints
     */
    SetSnapPoints(motion, _points, pointCount) {
        _pointsMarshal := _points is VarRef ? "float*" : "ptr"

        result := ComCall(4, this, DIRECTMANIPULATION_MOTION_TYPES, motion, _pointsMarshal, _points, "uint", pointCount, "HRESULT")
        return result
    }

    /**
     * Specifies the type of snap point.
     * @param {DIRECTMANIPULATION_MOTION_TYPES} motion One or more of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/directmanipulation/ne-directmanipulation-directmanipulation_motion_types">DIRECTMANIPULATION_MOTION_TYPES</a> enumeration values.
     * @param {DIRECTMANIPULATION_SNAPPOINT_TYPE} type One of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/directmanipulation/ne-directmanipulation-directmanipulation_snappoint_type">DIRECTMANIPULATION_SNAPPOINT_TYPE</a> enumeration values.
     * 
     * If set to <b>DIRECTMANIPULATION_SNAPPOINT_TYPE_NONE</b>, snap points specified through <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/directmanipulation/nf-directmanipulation-idirectmanipulationprimarycontent-setsnappoints">SetSnapPoints</a> or <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/directmanipulation/nf-directmanipulation-idirectmanipulationprimarycontent-setsnapinterval">SetSnapInterval</a> are cleared.
     * @returns {HRESULT} If the method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/directmanipulation/nf-directmanipulation-idirectmanipulationprimarycontent-setsnaptype
     */
    SetSnapType(motion, type) {
        result := ComCall(5, this, DIRECTMANIPULATION_MOTION_TYPES, motion, DIRECTMANIPULATION_SNAPPOINT_TYPE, type, "HRESULT")
        return result
    }

    /**
     * Specifies the coordinate system for snap points or snap intervals.
     * @remarks
     * The origin is relative to the content boundaries. If no boundary has been set (<a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/directmanipulation/nf-directmanipulation-idirectmanipulationcontent-setcontentrect">SetContentRect</a> is never called) the default boundaries are (-<a href="https://docs.microsoft.com/previous-versions/ms858507(v=msdn.10)">FLT_MAX</a>, <a href="https://docs.microsoft.com/previous-versions/ms858507(v=msdn.10)">FLT_MAX</a>).
     * @param {DIRECTMANIPULATION_MOTION_TYPES} motion One of the values from <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/directmanipulation/ne-directmanipulation-directmanipulation_motion_types">DIRECTMANIPULATION_MOTION_TYPES</a>.
     * @param {DIRECTMANIPULATION_SNAPPOINT_COORDINATE} coordinate One of the values from <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/directmanipulation/ne-directmanipulation-directmanipulation_snappoint_coordinate">DIRECTMANIPULATION_SNAPPOINT_COORDINATE</a>. 
     * 
     * If <i>motion</i> is set to translation (<b>DIRECTMANIPULATION_MOTION_TRANSLATEX</b> or <b>DIRECTMANIPULATION_MOTION_TRANSLATEY</b>), all values of <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/directmanipulation/ne-directmanipulation-directmanipulation_snappoint_coordinate">DIRECTMANIPULATION_SNAPPOINT_COORDINATE</a> are valid. 
     * 
     * If <i>motion</i> is set to <b>DIRECTMANIPULATION_MOTION_ZOOM</b>, only <b>DIRECTMANIPULATION_COORDINATE_ORIGIN</b> of <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/directmanipulation/ne-directmanipulation-directmanipulation_snappoint_coordinate">DIRECTMANIPULATION_SNAPPOINT_COORDINATE</a> is valid (<i>origin</i> must be set to 0.0f).
     * @param {Float} origin The initial, or starting, snap point. All snap points are relative to this one. Only used when  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/directmanipulation/ne-directmanipulation-directmanipulation_snappoint_coordinate">DIRECTMANIPULATION_COORDINATE_ORIGIN</a> is set. 
     * 
     * If <i>motion</i> is set to <b>DIRECTMANIPULATION_MOTION_ZOOM</b>, then <i>origin</i> must be set to 0.0f.
     * @returns {HRESULT} If the method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/directmanipulation/nf-directmanipulation-idirectmanipulationprimarycontent-setsnapcoordinate
     */
    SetSnapCoordinate(motion, coordinate, origin) {
        result := ComCall(6, this, DIRECTMANIPULATION_MOTION_TYPES, motion, DIRECTMANIPULATION_SNAPPOINT_COORDINATE, coordinate, "float", origin, "HRESULT")
        return result
    }

    /**
     * Specifies the minimum and maximum boundaries for zoom.
     * @remarks
     * If the content is outside the new boundaries, and the viewport is ENABLED or READY, then the content is reset to be within the new boundaries. If inertia configuration is enabled, the reset operation uses an inertia animation.
     * @param {Float} zoomMinimum The minimum zoom level allowed. Must be greater than or equal to 0.1f, which corresponds to 100% zoom.
     * @param {Float} zoomMaximum The maximum zoom allowed. Must be greater than <i>zoomMinimum</i> and less than <a href="https://docs.microsoft.com/previous-versions/ms858507(v=msdn.10)">FLT_MAX</a>.
     * @returns {HRESULT} If the method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/directmanipulation/nf-directmanipulation-idirectmanipulationprimarycontent-setzoomboundaries
     */
    SetZoomBoundaries(zoomMinimum, zoomMaximum) {
        result := ComCall(7, this, "float", zoomMinimum, "float", zoomMaximum, "HRESULT")
        return result
    }

    /**
     * Sets the horizontal alignment of the primary content relative to the viewport.
     * @remarks
     * If you have activated a configuration consisting only of zoom or zoom inertia, specify DIRECTMANIPULATION_HORIZONTALALIGNMENT_UNLOCKCENTER to respect the zoom center point.
     * @param {DIRECTMANIPULATION_HORIZONTALALIGNMENT} alignment One or more values from <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/directmanipulation/ne-directmanipulation-directmanipulation_horizontalalignment">DIRECTMANIPULATION_HORIZONTALALIGNMENT</a>. The default is <b>DIRECTMANIPULATION_HORIZONTALALIGNMENT_NONE</b>.
     * 
     * <div class="alert"><b>Note</b>  You cannot combine the following options: DIRECTMANIPULATION_HORIZONTALALIGNMENT_LEFT, DIRECTMANIPULATION-HORIZONTALALIGNMENT_CENTER, DIRECTMANIPULATION_HORIZONTALALIGNMENT_RIGHT. DIRECTMANIPULATION_HORIZONTALALIGNMENT_UNLOCKCENTER can be combined with any option but cannot be configured by itself.</div>
     * <div> </div>
     * @returns {HRESULT} If the method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/directmanipulation/nf-directmanipulation-idirectmanipulationprimarycontent-sethorizontalalignment
     */
    SetHorizontalAlignment(alignment) {
        result := ComCall(8, this, DIRECTMANIPULATION_HORIZONTALALIGNMENT, alignment, "HRESULT")
        return result
    }

    /**
     * Specifies the vertical alignment of the primary content in the viewport.
     * @remarks
     * If you have activated a configuration consisting only of zoom or zoom inertia, specify <b>DIRECTMANIPULATION_VERTICALALIGNMENT_UNLOCKCENTER</b> to respect the zoom center point.
     * @param {DIRECTMANIPULATION_VERTICALALIGNMENT} alignment One or more values from <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/directmanipulation/ne-directmanipulation-directmanipulation_verticalalignment">DIRECTMANIPULATION_VERTICALALIGNMENT</a>.
     * 
     * <div class="alert"><b>Note</b>  You cannot combine <b>DIRECTMANIPULATION_VERTICALALIGNMENT_TOP</b>, <b>DIRECTMANIPULATION_VERTICALALIGNMENT_CENTER</b>, or <b>DIRECTMANIPULATION_VERTICALALIGNMENT_BOTTOM</b>. <b>DIRECTMANIPULATION_VERTICALALIGNMENT_UNLOCKCENTER</b> can be combined with any option but cannot be configured by itself.</div>
     * <div> </div>
     * @returns {HRESULT} If the method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/directmanipulation/nf-directmanipulation-idirectmanipulationprimarycontent-setverticalalignment
     */
    SetVerticalAlignment(alignment) {
        result := ComCall(9, this, DIRECTMANIPULATION_VERTICALALIGNMENT, alignment, "HRESULT")
        return result
    }

    /**
     * Gets the final transform, including inertia, of the primary content.
     * @remarks
     * <div class="alert"><b>Warning</b>  Calling this method can cause a race condition if inertia has ended or been interrupted. This can also occur during the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/directmanipulation/nf-directmanipulation-idirectmanipulationviewporteventhandler-onviewportstatuschanged">OnViewportStatusChanged</a> callback.</div>
     * <div> </div>
     * @param {Integer} pointCount The size of the matrix. 
     * 
     *  This value is always 6, because a 3x2 matrix is used for all direct manipulation transforms.
     * @returns {Float} The transformed matrix that represents the inertia ending position.
     * @see https://learn.microsoft.com/windows/win32/api/directmanipulation/nf-directmanipulation-idirectmanipulationprimarycontent-getinertiaendtransform
     */
    GetInertiaEndTransform(pointCount) {
        result := ComCall(10, this, "float*", &_matrix := 0, "uint", pointCount, "HRESULT")
        return _matrix
    }

    /**
     * Retrieves the center point of the manipulation in content coordinates.
     * @param {Pointer<Float>} centerX The center on the horizontal axis.
     * @param {Pointer<Float>} centerY The center on the vertical axis.
     * @returns {HRESULT} If the method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/directmanipulation/nf-directmanipulation-idirectmanipulationprimarycontent-getcenterpoint
     */
    GetCenterPoint(centerX, centerY) {
        centerXMarshal := centerX is VarRef ? "float*" : "ptr"
        centerYMarshal := centerY is VarRef ? "float*" : "ptr"

        result := ComCall(11, this, centerXMarshal, centerX, centerYMarshal, centerY, "HRESULT")
        return result
    }

    Query(iid) {
        if (IDirectManipulationPrimaryContent.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetSnapInterval := CallbackCreate(GetMethod(implObj, "SetSnapInterval"), flags, 4)
        this.vtbl.SetSnapPoints := CallbackCreate(GetMethod(implObj, "SetSnapPoints"), flags, 4)
        this.vtbl.SetSnapType := CallbackCreate(GetMethod(implObj, "SetSnapType"), flags, 3)
        this.vtbl.SetSnapCoordinate := CallbackCreate(GetMethod(implObj, "SetSnapCoordinate"), flags, 4)
        this.vtbl.SetZoomBoundaries := CallbackCreate(GetMethod(implObj, "SetZoomBoundaries"), flags, 3)
        this.vtbl.SetHorizontalAlignment := CallbackCreate(GetMethod(implObj, "SetHorizontalAlignment"), flags, 2)
        this.vtbl.SetVerticalAlignment := CallbackCreate(GetMethod(implObj, "SetVerticalAlignment"), flags, 2)
        this.vtbl.GetInertiaEndTransform := CallbackCreate(GetMethod(implObj, "GetInertiaEndTransform"), flags, 3)
        this.vtbl.GetCenterPoint := CallbackCreate(GetMethod(implObj, "GetCenterPoint"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetSnapInterval)
        CallbackFree(this.vtbl.SetSnapPoints)
        CallbackFree(this.vtbl.SetSnapType)
        CallbackFree(this.vtbl.SetSnapCoordinate)
        CallbackFree(this.vtbl.SetZoomBoundaries)
        CallbackFree(this.vtbl.SetHorizontalAlignment)
        CallbackFree(this.vtbl.SetVerticalAlignment)
        CallbackFree(this.vtbl.GetInertiaEndTransform)
        CallbackFree(this.vtbl.GetCenterPoint)
    }
}
