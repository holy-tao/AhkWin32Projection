#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\D2D1_POINT_DESCRIPTION.ahk
#Include .\ID2D1PathGeometry.ahk

/**
 * The ID2D1PathGeometry1 interface adds functionality to ID2D1PathGeometry. In particular, it provides the path geometry-specific ComputePointAndSegmentAtLength method.
 * @remarks
 * This interface adds functionality to <a href="https://docs.microsoft.com/windows/desktop/api/d2d1/nn-d2d1-id2d1pathgeometry">ID2D1PathGeometry</a>.
 * @see https://learn.microsoft.com/windows/win32/api/d2d1_1/nn-d2d1_1-id2d1pathgeometry1
 * @namespace Windows.Win32.Graphics.Direct2D
 * @version v4.0.30319
 */
class ID2D1PathGeometry1 extends ID2D1PathGeometry{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID2D1PathGeometry1
     * @type {Guid}
     */
    static IID => Guid("{62baa2d2-ab54-41b7-b872-787e0106a421}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 21

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["ComputePointAndSegmentAtLength"]

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
        result := ComCall(21, this, "float", length, "uint", startSegment, "ptr", worldTransform, "float", flatteningTolerance, "ptr", pointDescription, "HRESULT")
        return pointDescription
    }
}
