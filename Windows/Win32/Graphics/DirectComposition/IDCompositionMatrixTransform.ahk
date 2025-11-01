#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IDCompositionTransform.ahk

/**
 * Represents an arbitrary affine 2D transformation defined by a 3-by-2 matrix.
 * @see https://docs.microsoft.com/windows/win32/api//dcomp/nn-dcomp-idcompositionmatrixtransform
 * @namespace Windows.Win32.Graphics.DirectComposition
 * @version v4.0.30319
 */
class IDCompositionMatrixTransform extends IDCompositionTransform{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDCompositionMatrixTransform
     * @type {Guid}
     */
    static IID => Guid("{16cdff07-c503-419c-83f2-0965c7af1fa6}")

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
     * @param {Pointer<D2D_MATRIX_3X2_F>} matrix 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionmatrixtransform-setmatrix
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
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionmatrixtransform-setmatrixelement(int_int_idcompositionanimation)
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
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionmatrixtransform-setmatrixelement(int_int_idcompositionanimation)
     */
    SetMatrixElement1(row, column, value) {
        result := ComCall(5, this, "int", row, "int", column, "float", value, "HRESULT")
        return result
    }
}
