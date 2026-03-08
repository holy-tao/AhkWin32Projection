#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IDCompositionTransform.ahk

/**
 * Represents an arbitrary affine 2D transformation defined by a 3-by-2 matrix. (IDCompositionMatrixTransform)
 * @see https://learn.microsoft.com/windows/win32/api/dcomp/nn-dcomp-idcompositionmatrixtransform
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
     * Changes all values of the matrix of this 2D transform.
     * @remarks
     * This method fails if any of the matrix values are NaN, positive infinity, or negative infinity.
     * 
     * If any of the matrix elements were previously animated, this method removes the animations and sets the elements to the specified static value.
     * @param {Pointer<D2D_MATRIX_3X2_F>} matrix Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/dcommon/ns-dcommon-d2d_matrix_3x2_f">D2D_MATRIX_3X2_F</a></b>
     * 
     * The new matrix for this 2D transform.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If the function succeeds, it returns S_OK. Otherwise, it returns an <b>HRESULT</b> error code. See <a href="https://docs.microsoft.com/windows/desktop/directcomp/directcomposition-error-codes">DirectComposition Error Codes</a>  for a list of error codes.
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionmatrixtransform-setmatrix
     */
    SetMatrix(matrix) {
        result := ComCall(3, this, "ptr", matrix, "HRESULT")
        return result
    }

    /**
     * Animates the value of one element of the matrix of this 2D transform.
     * @remarks
     * This method makes a copy of the specified animation. If the object referenced by the <i>animation</i> parameter is changed after calling this method, the change does not affect the element unless this method is called again. If the element was previously animated, calling this method replaces the previous animation with the new animation. 
     * 
     * 
     * 
     * This method fails if <i>animation</i> is an invalid pointer or if it was not created by the same <a href="https://docs.microsoft.com/windows/desktop/api/dcomp/nn-dcomp-idcompositiondevice">IDCompositionDevice</a> interface as the affected transform. The interface cannot be a custom implementation; only interfaces created by Microsoft DirectComposition can be used with this method.
     * @param {Integer} row The row index of the element to change. This value must be between 0 and 2, inclusive.
     * @param {Integer} column The column index of the element to change. This value must be between 0 and 1, inclusive.
     * @param {IDCompositionAnimation} animation An animation that represents how the value of the specified element changes over time. This parameter must not be NULL.
     * @returns {HRESULT} If the function succeeds, it returns S_OK. Otherwise, it returns an <b>HRESULT</b> error code. See <a href="https://docs.microsoft.com/windows/desktop/directcomp/directcomposition-error-codes">DirectComposition Error Codes</a>  for a list of error codes.
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionmatrixtransform-setmatrixelement(int_int_idcompositionanimation)
     */
    SetMatrixElement(row, column, animation) {
        result := ComCall(4, this, "int", row, "int", column, "ptr", animation, "HRESULT")
        return result
    }

    /**
     * Animates the value of one element of the matrix of this 2D transform.
     * @remarks
     * This method makes a copy of the specified animation. If the object referenced by the <i>animation</i> parameter is changed after calling this method, the change does not affect the element unless this method is called again. If the element was previously animated, calling this method replaces the previous animation with the new animation. 
     * 
     * 
     * 
     * This method fails if <i>animation</i> is an invalid pointer or if it was not created by the same <a href="https://docs.microsoft.com/windows/desktop/api/dcomp/nn-dcomp-idcompositiondevice">IDCompositionDevice</a> interface as the affected transform. The interface cannot be a custom implementation; only interfaces created by Microsoft DirectComposition can be used with this method.
     * @param {Integer} row The row index of the element to change. This value must be between 0 and 2, inclusive.
     * @param {Integer} column The column index of the element to change. This value must be between 0 and 1, inclusive.
     * @param {Float} value 
     * @returns {HRESULT} If the function succeeds, it returns S_OK. Otherwise, it returns an <b>HRESULT</b> error code. See <a href="https://docs.microsoft.com/windows/desktop/directcomp/directcomposition-error-codes">DirectComposition Error Codes</a>  for a list of error codes.
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionmatrixtransform-setmatrixelement(int_int_idcompositionanimation)
     */
    SetMatrixElement1(row, column, value) {
        result := ComCall(5, this, "int", row, "int", column, "float", value, "HRESULT")
        return result
    }
}
