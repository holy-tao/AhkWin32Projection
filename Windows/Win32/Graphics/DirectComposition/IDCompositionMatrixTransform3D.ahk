#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IDCompositionTransform3D.ahk

/**
 * Represents an arbitrary 3D transformation defined by a 4-by-4 matrix.
 * @remarks
 * 
  * A 3D matrix transform represents the following 4-by-4 matrix:
  * 
  * <img alt="Four-by-four 3D transform matrix" src="./images/3D_matrix.png"/>
  * 
  *  The application can set any of the values in the first three columns. Note that the fourth column is padded to allow for matrix concatenation.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//dcomp/nn-dcomp-idcompositionmatrixtransform3d
 * @namespace Windows.Win32.Graphics.DirectComposition
 * @version v4.0.30319
 */
class IDCompositionMatrixTransform3D extends IDCompositionTransform3D{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDCompositionMatrixTransform3D
     * @type {Guid}
     */
    static IID => Guid("{4b3363f0-643b-41b7-b6e0-ccf22d34467c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetMatrix", "SetMatrixElement", "SetMatrixElement1"]

    /**
     * 
     * @param {Pointer<D3DMATRIX>} matrix 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionmatrixtransform3d-setmatrix
     */
    SetMatrix(matrix) {
        result := ComCall(3, this, "ptr", matrix, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} row 
     * @param {Integer} column 
     * @param {IDCompositionAnimation} animation 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionmatrixtransform3d-setmatrixelement(int_int_idcompositionanimation)
     */
    SetMatrixElement(row, column, animation) {
        result := ComCall(4, this, "int", row, "int", column, "ptr", animation, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} row 
     * @param {Integer} column 
     * @param {Float} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionmatrixtransform3d-setmatrixelement(int_int_idcompositionanimation)
     */
    SetMatrixElement1(row, column, value) {
        result := ComCall(5, this, "int", row, "int", column, "float", value, "HRESULT")
        return result
    }
}
