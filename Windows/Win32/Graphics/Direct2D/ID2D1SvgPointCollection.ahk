#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ID2D1SvgAttribute.ahk" { ID2D1SvgAttribute }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "Common\D2D_POINT_2F.ahk" { D2D_POINT_2F }

/**
 * Interface describing an SVG points value in a polyline or polygon element.
 * @see https://learn.microsoft.com/windows/win32/api/d2d1svg/nn-d2d1svg-id2d1svgpointcollection
 * @namespace Windows.Win32.Graphics.Direct2D
 */
export default struct ID2D1SvgPointCollection extends ID2D1SvgAttribute {
    /**
     * The interface identifier for ID2D1SvgPointCollection
     * @type {Guid}
     */
    static IID := Guid("{9dbe4c0d-3572-4dd9-9825-5530813bb712}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID2D1SvgPointCollection interfaces
    */
    struct Vtbl extends ID2D1SvgAttribute.Vtbl {
        RemovePointsAtEnd : IntPtr
        UpdatePoints      : IntPtr
        GetPoints         : IntPtr
        GetPointsCount    : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID2D1SvgPointCollection.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Removes points from the end of the array.
     * @param {Integer} pointsCount Type: <b>UINT32</b>
     * 
     * Specifies how many points to remove.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * This method returns an HRESULT success or error code.
     * @see https://learn.microsoft.com/windows/win32/api/d2d1svg/nf-d2d1svg-id2d1svgpointcollection-removepointsatend
     */
    RemovePointsAtEnd(pointsCount) {
        result := ComCall(6, this, "uint", pointsCount, "HRESULT")
        return result
    }

    /**
     * Updates the points array. Existing points not updated by this method are preserved. The array is resized larger if necessary to accommodate the new points.
     * @param {Pointer<D2D_POINT_2F>} _points Type: <b>const D2D1_POINT_2F*</b>
     * 
     * The points array.
     * @param {Integer} pointsCount Type: <b>UINT32</b>
     * 
     * The number of points to update.
     * @param {Integer} startIndex Type: <b>UINT32</b>
     * 
     * The index at which to begin updating points. Must be less than or equal to the size of the array.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * This method returns an HRESULT success or error code.
     * @see https://learn.microsoft.com/windows/win32/api/d2d1svg/nf-d2d1svg-id2d1svgpointcollection-updatepoints
     */
    UpdatePoints(_points, pointsCount, startIndex) {
        result := ComCall(7, this, D2D_POINT_2F.Ptr, _points, "uint", pointsCount, "uint", startIndex, "HRESULT")
        return result
    }

    /**
     * Gets points from the points array.
     * @param {Integer} pointsCount Type: <b>UINT32</b>
     * 
     * The element count of the buffer.
     * @param {Integer} startIndex Type: <b>UINT32</b>
     * 
     * The index of the first point to retrieve.
     * @returns {D2D_POINT_2F} Type: <b>D2D1_POINT_2F*</b>
     * 
     * Buffer to contain the points.
     * @see https://learn.microsoft.com/windows/win32/api/d2d1svg/nf-d2d1svg-id2d1svgpointcollection-getpoints
     */
    GetPoints(pointsCount, startIndex) {
        _points := D2D_POINT_2F()
        result := ComCall(8, this, D2D_POINT_2F.Ptr, _points, "uint", pointsCount, "uint", startIndex, "HRESULT")
        return _points
    }

    /**
     * Gets the number of points in the array.
     * @returns {Integer} Type: <b>UINT32</b>
     * 
     * Returns the number of points in the array.
     * @see https://learn.microsoft.com/windows/win32/api/d2d1svg/nf-d2d1svg-id2d1svgpointcollection-getpointscount
     */
    GetPointsCount() {
        result := ComCall(9, this, UInt32)
        return result
    }

    Query(iid) {
        if (ID2D1SvgPointCollection.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.RemovePointsAtEnd := CallbackCreate(GetMethod(implObj, "RemovePointsAtEnd"), flags, 2)
        this.vtbl.UpdatePoints := CallbackCreate(GetMethod(implObj, "UpdatePoints"), flags, 4)
        this.vtbl.GetPoints := CallbackCreate(GetMethod(implObj, "GetPoints"), flags, 4)
        this.vtbl.GetPointsCount := CallbackCreate(GetMethod(implObj, "GetPointsCount"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.RemovePointsAtEnd)
        CallbackFree(this.vtbl.UpdatePoints)
        CallbackFree(this.vtbl.GetPoints)
        CallbackFree(this.vtbl.GetPointsCount)
    }
}
