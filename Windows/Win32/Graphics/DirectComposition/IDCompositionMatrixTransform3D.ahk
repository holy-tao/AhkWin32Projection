#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IDCompositionTransform3D.ahk" { IDCompositionTransform3D }
#Import ".\IDCompositionAnimation.ahk" { IDCompositionAnimation }
#Import "..\Direct3D\D3DMATRIX.ahk" { D3DMATRIX }

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
 */
export default struct IDCompositionMatrixTransform3D extends IDCompositionTransform3D {
    /**
     * The interface identifier for IDCompositionMatrixTransform3D
     * @type {Guid}
     */
    static IID := Guid("{4b3363f0-643b-41b7-b6e0-ccf22d34467c}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDCompositionMatrixTransform3D interfaces
    */
    struct Vtbl extends IDCompositionTransform3D.Vtbl {
        SetMatrix         : IntPtr
        SetMatrixElement  : IntPtr
        SetMatrixElement1 : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDCompositionMatrixTransform3D.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Changes all values of the matrix of this 3D transformation effect.
     * @remarks
     * This method fails if any of the matrix values are NaN, positive infinity, or negative infinity.
     * 
     * If any of the matrix elements were previously animated, this method removes the animations and sets the elements to the specified static value.
     * @param {Pointer<D3DMATRIX>} _matrix Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dmatrix">D3DMATRIX</a></b>
     * 
     * The new matrix for this 3D transformation effect.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If the function succeeds, it returns S_OK. Otherwise, it returns an <b>HRESULT</b> error code. See <a href="https://docs.microsoft.com/windows/desktop/directcomp/directcomposition-error-codes">DirectComposition Error Codes</a>  for a list of error codes.
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionmatrixtransform3d-setmatrix
     */
    SetMatrix(_matrix) {
        result := ComCall(3, this, D3DMATRIX.Ptr, _matrix, "HRESULT")
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
     * @param {Integer} _column Type: <b>int</b>
     * 
     * The column index of the element to change. This value must be between 0 and 3, inclusive.
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
     * @param {Integer} _column Type: <b>int</b>
     * 
     * The column index of the element to change. This value must be between 0 and 3, inclusive.
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

    Query(iid) {
        if (IDCompositionMatrixTransform3D.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetMatrix := CallbackCreate(GetMethod(implObj, "SetMatrix"), flags, 2)
        this.vtbl.SetMatrixElement := CallbackCreate(GetMethod(implObj, "SetMatrixElement"), flags, 4)
        this.vtbl.SetMatrixElement1 := CallbackCreate(GetMethod(implObj, "SetMatrixElement1"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetMatrix)
        CallbackFree(this.vtbl.SetMatrixElement)
        CallbackFree(this.vtbl.SetMatrixElement1)
    }
}
