#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ID2D1InkStyle.ahk" { ID2D1InkStyle }
#Import ".\ID2D1Resource.ahk" { ID2D1Resource }
#Import "Common\D2D_RECT_F.ahk" { D2D_RECT_F }
#Import ".\D2D1_INK_BEZIER_SEGMENT.ahk" { D2D1_INK_BEZIER_SEGMENT }
#Import "Common\ID2D1SimplifiedGeometrySink.ahk" { ID2D1SimplifiedGeometrySink }
#Import ".\D2D1_INK_POINT.ahk" { D2D1_INK_POINT }
#Import "Common\D2D_MATRIX_3X2_F.ahk" { D2D_MATRIX_3X2_F }

/**
 * Represents a single continuous stroke of variable-width ink, as defined by a series of Bezier segments and widths.
 * @see https://learn.microsoft.com/windows/win32/api/d2d1_3/nn-d2d1_3-id2d1ink
 * @namespace Windows.Win32.Graphics.Direct2D
 */
export default struct ID2D1Ink extends ID2D1Resource {
    /**
     * The interface identifier for ID2D1Ink
     * @type {Guid}
     */
    static IID := Guid("{b499923b-7029-478f-a8b3-432c7c5f5312}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID2D1Ink interfaces
    */
    struct Vtbl extends ID2D1Resource.Vtbl {
        SetStartPoint       : IntPtr
        GetStartPoint       : IntPtr
        AddSegments         : IntPtr
        RemoveSegmentsAtEnd : IntPtr
        SetSegments         : IntPtr
        SetSegmentAtEnd     : IntPtr
        GetSegmentCount     : IntPtr
        GetSegments         : IntPtr
        StreamAsGeometry    : IntPtr
        GetBounds           : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID2D1Ink.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Sets the starting point for this ink object. This determines where this ink object will start rendering. (overload 1/2)
     * @param {Pointer<D2D1_INK_POINT>} startPoint Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/d2d1_3/ns-d2d1_3-d2d1_ink_point">D2D1_INK_POINT</a>*</b>
     * 
     * The new starting point for this ink object.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_3/nf-d2d1_3-id2d1ink-setstartpoint(constd2d1_ink_point)
     */
    SetStartPoint(startPoint) {
        ComCall(4, this, D2D1_INK_POINT.Ptr, startPoint)
    }

    /**
     * Retrieves the starting point for this ink object.
     * @returns {D2D1_INK_POINT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1_3/ns-d2d1_3-d2d1_ink_point">D2D1_INK_POINT</a></b>
     * 
     * The starting point for this ink object.
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_3/nf-d2d1_3-id2d1ink-getstartpoint
     */
    GetStartPoint() {
        result := ComCall(5, this, D2D1_INK_POINT)
        return result
    }

    /**
     * Adds the given segments to the end of this ink object.
     * @param {Pointer<D2D1_INK_BEZIER_SEGMENT>} segments Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/d2d1_3/ns-d2d1_3-d2d1_ink_bezier_segment">D2D1_INK_BEZIER_SEGMENT</a>*</b>
     * 
     * A pointer to an array of segments to be added to this ink object.
     * @param {Integer} segmentsCount Type: <b>UINT32</b>
     * 
     * The number of segments to be added to this ink object.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_3/nf-d2d1_3-id2d1ink-addsegments
     */
    AddSegments(segments, segmentsCount) {
        result := ComCall(6, this, D2D1_INK_BEZIER_SEGMENT.Ptr, segments, "uint", segmentsCount, "HRESULT")
        return result
    }

    /**
     * Removes the given number of segments from the end of this ink object.
     * @param {Integer} segmentsCount Type: <b>UINT32</b>
     * 
     * The number of segments to be removed from the end of this ink object. Note that segmentsCount must be less or equal to the number of segments in the ink object.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_3/nf-d2d1_3-id2d1ink-removesegmentsatend
     */
    RemoveSegmentsAtEnd(segmentsCount) {
        result := ComCall(7, this, "uint", segmentsCount, "HRESULT")
        return result
    }

    /**
     * Updates the specified segments in this ink object with new control points.
     * @param {Integer} startSegment Type: <b>UINT32</b>
     * 
     * The index of the first segment in this ink object to update.
     * @param {Pointer<D2D1_INK_BEZIER_SEGMENT>} segments Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/d2d1_3/ns-d2d1_3-d2d1_ink_bezier_segment">D2D1_INK_BEZIER_SEGMENT</a>*</b>
     * 
     * A pointer to the array of segment data to be used in the update.
     * @param {Integer} segmentsCount Type: <b>UINT32</b>
     * 
     * The number of segments in this ink object that will be updated with new data. Note that segmentsCount must be less than or equal to the number of segments in the ink object minus startSegment.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_3/nf-d2d1_3-id2d1ink-setsegments
     */
    SetSegments(startSegment, segments, segmentsCount) {
        result := ComCall(8, this, "uint", startSegment, D2D1_INK_BEZIER_SEGMENT.Ptr, segments, "uint", segmentsCount, "HRESULT")
        return result
    }

    /**
     * Updates the last segment in this ink object with new control points. (overload 1/2)
     * @param {Pointer<D2D1_INK_BEZIER_SEGMENT>} segment Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/d2d1_3/ns-d2d1_3-d2d1_ink_bezier_segment">D2D1_INK_BEZIER_SEGMENT</a>*</b>
     * 
     * A pointer to the segment data with which to overwrite this ink object's last segment. Note that if there are currently no segments in the ink object, SetSegmentsAtEnd will return an error.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_3/nf-d2d1_3-id2d1ink-setsegmentatend(constd2d1_ink_bezier_segment)
     */
    SetSegmentAtEnd(segment) {
        result := ComCall(9, this, D2D1_INK_BEZIER_SEGMENT.Ptr, segment, "HRESULT")
        return result
    }

    /**
     * Returns the number of segments in this ink object.
     * @returns {Integer} Type: <b>UINT32
     *           </b>
     * 
     * Returns the number of segments in this ink object.
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_3/nf-d2d1_3-id2d1ink-getsegmentcount
     */
    GetSegmentCount() {
        result := ComCall(10, this, UInt32)
        return result
    }

    /**
     * Retrieves the specified subset of segments stored in this ink object.
     * @param {Integer} startSegment Type: <b>UINT32</b>
     * 
     * The index of the first segment in this ink object to retrieve.
     * @param {Integer} segmentsCount Type: <b>UINT32</b>
     * 
     * The number of segments to retrieve. Note that segmentsCount must be less than or equal to the number of segments in the ink object minus startSegment.
     * @returns {D2D1_INK_BEZIER_SEGMENT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1_3/ns-d2d1_3-d2d1_ink_bezier_segment">D2D1_INK_BEZIER_SEGMENT</a>*</b>
     * 
     * When this method returns, contains a pointer to an array of retrieved segments.
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_3/nf-d2d1_3-id2d1ink-getsegments
     */
    GetSegments(startSegment, segmentsCount) {
        segments := D2D1_INK_BEZIER_SEGMENT()
        result := ComCall(11, this, "uint", startSegment, D2D1_INK_BEZIER_SEGMENT.Ptr, segments, "uint", segmentsCount, "HRESULT")
        return segments
    }

    /**
     * Retrieves a geometric representation of this ink object. (overload 4/4)
     * @param {ID2D1InkStyle} inkStyle Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1_3/nn-d2d1_3-id2d1inkstyle">ID2D1InkStyle</a>*</b>
     * 
     * The ink style to be used in determining the geometric representation.
     * @param {Pointer<D2D_MATRIX_3X2_F>} worldTransform Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/Direct2D/d2d1-matrix-3x2-f">D2D1_MATRIX_3X2_F</a></b>
     * 
     * The world transform to be used in determining the geometric representation.
     * @param {Float} flatteningTolerance Type: <b>FLOAT</b>
     * 
     * The flattening tolerance to be used in determining the geometric representation.
     * @param {ID2D1SimplifiedGeometrySink} geometrySink Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1/nn-d2d1-id2d1simplifiedgeometrysink">ID2D1SimplifiedGeometrySink</a>*</b>
     * 
     * The geometry sink to which the geometry representation will be streamed.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_3/nf-d2d1_3-id2d1ink-streamasgeometry(id2d1inkstyle_constd2d1_matrix_3x2_f__float_id2d1simplifiedgeometrysink)
     */
    StreamAsGeometry(inkStyle, worldTransform, flatteningTolerance, geometrySink) {
        result := ComCall(12, this, "ptr", inkStyle, D2D_MATRIX_3X2_F.Ptr, worldTransform, "float", flatteningTolerance, "ptr", geometrySink, "HRESULT")
        return result
    }

    /**
     * Retrieve the bounds of the geometry, with an optional applied transform.
     * @param {ID2D1InkStyle} inkStyle Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1_3/nn-d2d1_3-id2d1inkstyle">ID2D1InkStyle</a>*</b>
     * 
     * The ink style to be used in determining the bounds of this ink object.
     * @param {Pointer<D2D_MATRIX_3X2_F>} worldTransform Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/Direct2D/d2d1-matrix-3x2-f">D2D1_MATRIX_3X2_F</a>*</b>
     * 
     * The world transform to be used in determining the bounds of this ink object.
     * @returns {D2D_RECT_F} Type: <b><a href="https://docs.microsoft.com/windows/desktop/Direct2D/d2d1-rect-f">D2D1_RECT_F</a>*</b>
     * 
     * When this method returns, contains the bounds of this ink object.
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_3/nf-d2d1_3-id2d1ink-getbounds
     */
    GetBounds(inkStyle, worldTransform) {
        bounds := D2D_RECT_F()
        result := ComCall(13, this, "ptr", inkStyle, D2D_MATRIX_3X2_F.Ptr, worldTransform, D2D_RECT_F.Ptr, bounds, "HRESULT")
        return bounds
    }

    Query(iid) {
        if (ID2D1Ink.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetStartPoint := CallbackCreate(GetMethod(implObj, "SetStartPoint"), flags, 2)
        this.vtbl.GetStartPoint := CallbackCreate(GetMethod(implObj, "GetStartPoint"), flags, 1)
        this.vtbl.AddSegments := CallbackCreate(GetMethod(implObj, "AddSegments"), flags, 3)
        this.vtbl.RemoveSegmentsAtEnd := CallbackCreate(GetMethod(implObj, "RemoveSegmentsAtEnd"), flags, 2)
        this.vtbl.SetSegments := CallbackCreate(GetMethod(implObj, "SetSegments"), flags, 4)
        this.vtbl.SetSegmentAtEnd := CallbackCreate(GetMethod(implObj, "SetSegmentAtEnd"), flags, 2)
        this.vtbl.GetSegmentCount := CallbackCreate(GetMethod(implObj, "GetSegmentCount"), flags, 1)
        this.vtbl.GetSegments := CallbackCreate(GetMethod(implObj, "GetSegments"), flags, 4)
        this.vtbl.StreamAsGeometry := CallbackCreate(GetMethod(implObj, "StreamAsGeometry"), flags, 5)
        this.vtbl.GetBounds := CallbackCreate(GetMethod(implObj, "GetBounds"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetStartPoint)
        CallbackFree(this.vtbl.GetStartPoint)
        CallbackFree(this.vtbl.AddSegments)
        CallbackFree(this.vtbl.RemoveSegmentsAtEnd)
        CallbackFree(this.vtbl.SetSegments)
        CallbackFree(this.vtbl.SetSegmentAtEnd)
        CallbackFree(this.vtbl.GetSegmentCount)
        CallbackFree(this.vtbl.GetSegments)
        CallbackFree(this.vtbl.StreamAsGeometry)
        CallbackFree(this.vtbl.GetBounds)
    }
}
