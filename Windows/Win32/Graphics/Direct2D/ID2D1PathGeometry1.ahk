#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "Common\D2D_MATRIX_3X2_F.ahk" { D2D_MATRIX_3X2_F }
#Import ".\ID2D1PathGeometry.ahk" { ID2D1PathGeometry }
#Import ".\D2D1_POINT_DESCRIPTION.ahk" { D2D1_POINT_DESCRIPTION }

/**
 * The ID2D1PathGeometry1 interface adds functionality to ID2D1PathGeometry. In particular, it provides the path geometry-specific ComputePointAndSegmentAtLength method.
 * @remarks
 * This interface adds functionality to <a href="https://docs.microsoft.com/windows/desktop/api/d2d1/nn-d2d1-id2d1pathgeometry">ID2D1PathGeometry</a>.
 * @see https://learn.microsoft.com/windows/win32/api/d2d1_1/nn-d2d1_1-id2d1pathgeometry1
 * @namespace Windows.Win32.Graphics.Direct2D
 */
export default struct ID2D1PathGeometry1 extends ID2D1PathGeometry {
    /**
     * The interface identifier for ID2D1PathGeometry1
     * @type {Guid}
     */
    static IID := Guid("{62baa2d2-ab54-41b7-b872-787e0106a421}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID2D1PathGeometry1 interfaces
    */
    struct Vtbl extends ID2D1PathGeometry.Vtbl {
        ComputePointAndSegmentAtLength : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID2D1PathGeometry1.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Computes the point that exists at a given distance along the path geometry along with the index of the segment the point is on and the directional vector at that point. (overload 3/4)
     * @param {Float} length Type: <b>FLOAT</b>
     * 
     * The distance to walk along the path.
     * @param {Integer} startSegment Type: <b>UINT32</b>
     * 
     * The index of the segment at which to begin walking. Note: This index is global to the entire path, not just a particular figure.
     * @param {Pointer<D2D_MATRIX_3X2_F>} worldTransform Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/Direct2D/d2d1-matrix-3x2-f">D2D1_MATRIX_3X2_F</a></b>
     * 
     * The transform to apply to the path prior to walking.
     * @param {Float} flatteningTolerance Type: <b>FLOAT</b>
     * 
     * The flattening tolerance to use when walking along an arc or Bezier segment. The flattening tolerance is the maximum 
     *             error allowed when constructing a polygonal approximation of the geometry. No point in the polygonal representation will diverge 
     *             from the original geometry by more than the flattening tolerance. Smaller values produce more accurate results but cause slower execution.
     * @returns {D2D1_POINT_DESCRIPTION} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1_1/ns-d2d1_1-d2d1_point_description">D2D1_POINT_DESCRIPTION</a>*</b>
     * 
     * When this method returns, contains a description of the point that can be found at the given location.
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_1/nf-d2d1_1-id2d1pathgeometry1-computepointandsegmentatlength(float_uint32_constd2d1_matrix_3x2_f__float_d2d1_point_description)
     */
    ComputePointAndSegmentAtLength(length, startSegment, worldTransform, flatteningTolerance) {
        pointDescription := D2D1_POINT_DESCRIPTION()
        result := ComCall(21, this, "float", length, "uint", startSegment, D2D_MATRIX_3X2_F.Ptr, worldTransform, "float", flatteningTolerance, D2D1_POINT_DESCRIPTION.Ptr, pointDescription, "HRESULT")
        return pointDescription
    }

    Query(iid) {
        if (ID2D1PathGeometry1.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.ComputePointAndSegmentAtLength := CallbackCreate(GetMethod(implObj, "ComputePointAndSegmentAtLength"), flags, 6)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.ComputePointAndSegmentAtLength)
    }
}
