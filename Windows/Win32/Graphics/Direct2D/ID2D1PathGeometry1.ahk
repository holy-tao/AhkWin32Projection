#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID2D1PathGeometry.ahk

/**
 * The ID2D1PathGeometry1 interface adds functionality to ID2D1PathGeometry. In particular, it provides the path geometry-specific ComputePointAndSegmentAtLength method.
 * @remarks
 * 
  * This interface adds functionality to <a href="https://docs.microsoft.com/windows/desktop/api/d2d1/nn-d2d1-id2d1pathgeometry">ID2D1PathGeometry</a>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//d2d1_1/nn-d2d1_1-id2d1pathgeometry1
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
     * 
     * @param {Float} length 
     * @param {Integer} startSegment 
     * @param {Pointer<D2D_MATRIX_3X2_F>} worldTransform 
     * @param {Float} flatteningTolerance 
     * @param {Pointer<D2D1_POINT_DESCRIPTION>} pointDescription 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_1/nf-d2d1_1-id2d1pathgeometry1-computepointandsegmentatlength(float_uint32_constd2d1_matrix_3x2_f__float_d2d1_point_description)
     */
    ComputePointAndSegmentAtLength(length, startSegment, worldTransform, flatteningTolerance, pointDescription) {
        result := ComCall(21, this, "float", length, "uint", startSegment, "ptr", worldTransform, "float", flatteningTolerance, "ptr", pointDescription, "HRESULT")
        return result
    }
}
