#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IDCompositionTransform3D.ahk

/**
 * Represents an arbitrary 3D transformation defined by a 4-by-4 matrix.
 * @remarks
 * A 3D matrix transform represents the following 4-by-4 matrix:
 * 
 * <img alt="Four-by-four 3D transform matrix" src="./images/3D_matrix.png"/>
 * 
 *  The application can set any of the values in the first three columns. Note that the fourth column is padded to allow for matrix concatenation.
 * @see https://learn.microsoft.com/windows/win32/api/dcomp/nn-dcomp-idcompositionmatrixtransform3d
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
     * Changes all values of the matrix of this 3D transformation effect.
     * @remarks
     * This method fails if any of the matrix values are NaN, positive infinity, or negative infinity.
     * 
     * If any of the matrix elements were previously animated, this method removes the animations and sets the elements to the specified static value.
     * @param {Pointer<D3DMATRIX>} _matrix 
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If the function succeeds, it returns S_OK. Otherwise, it returns an <b>HRESULT</b> error code. See <a href="https://docs.microsoft.com/windows/desktop/directcomp/directcomposition-error-codes">DirectComposition Error Codes</a>  for a list of error codes.
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionmatrixtransform3d-setmatrix
     */
    SetMatrix(_matrix) {
        result := ComCall(3, this, "ptr", _matrix, "HRESULT")
        return result
    }

    /**
     * Animates the value of one element of the matrix of this 3D transform.
     * @remarks
     * This method makes a copy of the specified animation. If the object referenced by the <i>animation</i> parameter is changed after calling this method, the change does not affect the specified element unless this method is called again. If the specified element was previously animated, calling this method replaces the previous animation with the new animation.
     * 
     * This method fails if <i>animation</i> is an invalid pointer or if it was not created by the same <a href="https://docs.microsoft.com/windows/desktop/api/dcomp/nn-dcomp-idcompositiondevice">IDCompositionDevice</a> interface as the affected transform. The interface cannot be a custom implementation; only interfaces created by Microsoft DirectComposition can be used with this method.
     * @param {Integer} row Type: <b>int</b>
     * 
     * The row index of the element to change. This value must be between 0 and 3, inclusive.
     * @param {Integer} _column 
     * @param {IDCompositionAnimation} animation Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/dcompanimation/nn-dcompanimation-idcompositionanimation">IDCompositionAnimation</a>*</b>
     * 
     * An animation that represents how the value of the specified element changes over time. This parameter must not be NULL.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If the function succeeds, it returns S_OK. Otherwise, it returns an <b>HRESULT</b> error code. See <a href="https://docs.microsoft.com/windows/desktop/directcomp/directcomposition-error-codes">DirectComposition Error Codes</a>  for a list of error codes.
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionmatrixtransform3d-setmatrixelement(int_int_idcompositionanimation)
     */
    SetMatrixElement(row, _column, animation) {
        result := ComCall(4, this, "int", row, "int", _column, "ptr", animation, "HRESULT")
        return result
    }

    /**
     * Animates the value of one element of the matrix of this 3D transform.
     * @remarks
     * This method makes a copy of the specified animation. If the object referenced by the <i>animation</i> parameter is changed after calling this method, the change does not affect the specified element unless this method is called again. If the specified element was previously animated, calling this method replaces the previous animation with the new animation.
     * 
     * This method fails if <i>animation</i> is an invalid pointer or if it was not created by the same <a href="https://docs.microsoft.com/windows/desktop/api/dcomp/nn-dcomp-idcompositiondevice">IDCompositionDevice</a> interface as the affected transform. The interface cannot be a custom implementation; only interfaces created by Microsoft DirectComposition can be used with this method.
     * @param {Integer} row Type: <b>int</b>
     * 
     * The row index of the element to change. This value must be between 0 and 3, inclusive.
     * @param {Integer} _column 
     * @param {Float} value 
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If the function succeeds, it returns S_OK. Otherwise, it returns an <b>HRESULT</b> error code. See <a href="https://docs.microsoft.com/windows/desktop/directcomp/directcomposition-error-codes">DirectComposition Error Codes</a>  for a list of error codes.
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionmatrixtransform3d-setmatrixelement(int_int_idcompositionanimation)
     */
    SetMatrixElement1(row, _column, value) {
        result := ComCall(5, this, "int", row, "int", _column, "float", value, "HRESULT")
        return result
    }
}
