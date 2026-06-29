#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IDCompositionFilterEffect.ahk" { IDCompositionFilterEffect }
#Import "..\Direct2D\Common\D2D1_BORDER_MODE.ahk" { D2D1_BORDER_MODE }
#Import "..\Direct2D\Common\D2D1_2DAFFINETRANSFORM_INTERPOLATION_MODE.ahk" { D2D1_2DAFFINETRANSFORM_INTERPOLATION_MODE }
#Import "..\Direct2D\Common\D2D_MATRIX_3X2_F.ahk" { D2D_MATRIX_3X2_F }
#Import ".\IDCompositionAnimation.ahk" { IDCompositionAnimation }

/**
 * The arithmetic composite effect is used to combine 2 images using a weighted sum of pixels from the input images. (IDCompositionAffineTransform2DEffect)
 * @see https://learn.microsoft.com/windows/win32/api/dcomp/nn-dcomp-idcompositionaffinetransform2deffect
 * @namespace Windows.Win32.Graphics.DirectComposition
 */
export default struct IDCompositionAffineTransform2DEffect extends IDCompositionFilterEffect {
    /**
     * The interface identifier for IDCompositionAffineTransform2DEffect
     * @type {Guid}
     */
    static IID := Guid("{0b74b9e8-cdd6-492f-bbbc-5ed32157026d}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDCompositionAffineTransform2DEffect interfaces
    */
    struct Vtbl extends IDCompositionFilterEffect.Vtbl {
        SetInterpolationMode       : IntPtr
        SetBorderMode              : IntPtr
        SetTransformMatrix         : IntPtr
        SetTransformMatrixElement  : IntPtr
        SetTransformMatrixElement1 : IntPtr
        SetSharpness               : IntPtr
        SetSharpness1              : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDCompositionAffineTransform2DEffect.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Sets the interpolation mode of the effect.
     * @param {D2D1_2DAFFINETRANSFORM_INTERPOLATION_MODE} _interpolationMode Type: <b><a href="https://docs.microsoft.com/windows/desktop/Direct2D/2d-affine-transform">D2D1_2DAFFINETRANSFORM_INTERPOLATION_MODE</a></b>
     * 
     * Specifies the interpolation mode of the effect.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionaffinetransform2deffect-setinterpolationmode
     */
    SetInterpolationMode(_interpolationMode) {
        result := ComCall(4, this, D2D1_2DAFFINETRANSFORM_INTERPOLATION_MODE, _interpolationMode, "HRESULT")
        return result
    }

    /**
     * Sets the border mode to use with the effect.
     * @param {D2D1_BORDER_MODE} borderMode Type: <b><a href="https://docs.microsoft.com/windows/desktop/Direct2D/2d-affine-transform">D2D1_BORDER_MODE</a></b>
     * 
     * Specifies the border mode to use with the effect.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionaffinetransform2deffect-setbordermode
     */
    SetBorderMode(borderMode) {
        result := ComCall(5, this, D2D1_BORDER_MODE, borderMode, "HRESULT")
        return result
    }

    /**
     * Sets the transform matrix of the effect.
     * @param {Pointer<D2D_MATRIX_3X2_F>} transformMatrix Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/Direct2D/d2d1-matrix-3x2-f">D2D1_MATRIX_3X2_F</a></b>
     * 
     * Specifies the transform matrix for the effect to use.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionaffinetransform2deffect-settransformmatrix
     */
    SetTransformMatrix(transformMatrix) {
        result := ComCall(6, this, D2D_MATRIX_3X2_F.Ptr, transformMatrix, "HRESULT")
        return result
    }

    /**
     * Sets an element of the transform matrix of the effect. (overload 2/2)
     * @param {Integer} row Type: <b>int</b>
     * 
     * The row of the element.
     * @param {Integer} _column Type: <b>int</b>
     * 
     * The column of the element.
     * @param {IDCompositionAnimation} animation Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/dcompanimation/nn-dcompanimation-idcompositionanimation">IDCompositionAnimation</a>*</b>
     * 
     * An animation that represents how the element value changes over time. This parameter must not be NULL.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionaffinetransform2deffect-settransformmatrixelement(int_int_idcompositionanimation)
     */
    SetTransformMatrixElement(row, _column, animation) {
        result := ComCall(7, this, "int", row, "int", _column, "ptr", animation, "HRESULT")
        return result
    }

    /**
     * Sets an element of the transform matrix of the effect. (overload 2/2)
     * @param {Integer} row Type: <b>int</b>
     * 
     * The row of the element.
     * @param {Integer} _column Type: <b>int</b>
     * 
     * The column of the element.
     * @param {Float} value 
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionaffinetransform2deffect-settransformmatrixelement(int_int_idcompositionanimation)
     */
    SetTransformMatrixElement1(row, _column, value) {
        result := ComCall(8, this, "int", row, "int", _column, "float", value, "HRESULT")
        return result
    }

    /**
     * Sets the sharpness of the effect. (overload 2/2)
     * @param {IDCompositionAnimation} animation 
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionaffinetransform2deffect-setsharpness(float)
     */
    SetSharpness(animation) {
        result := ComCall(9, this, "ptr", animation, "HRESULT")
        return result
    }

    /**
     * Sets the sharpness of the effect. (overload 2/2)
     * @param {Float} sharpness Type: <b>float</b>
     * 
     * Specifies the sharpness of the effect.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionaffinetransform2deffect-setsharpness(float)
     */
    SetSharpness1(sharpness) {
        result := ComCall(10, this, "float", sharpness, "HRESULT")
        return result
    }

    Query(iid) {
        if (IDCompositionAffineTransform2DEffect.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetInterpolationMode := CallbackCreate(GetMethod(implObj, "SetInterpolationMode"), flags, 2)
        this.vtbl.SetBorderMode := CallbackCreate(GetMethod(implObj, "SetBorderMode"), flags, 2)
        this.vtbl.SetTransformMatrix := CallbackCreate(GetMethod(implObj, "SetTransformMatrix"), flags, 2)
        this.vtbl.SetTransformMatrixElement := CallbackCreate(GetMethod(implObj, "SetTransformMatrixElement"), flags, 4)
        this.vtbl.SetTransformMatrixElement1 := CallbackCreate(GetMethod(implObj, "SetTransformMatrixElement1"), flags, 4)
        this.vtbl.SetSharpness := CallbackCreate(GetMethod(implObj, "SetSharpness"), flags, 2)
        this.vtbl.SetSharpness1 := CallbackCreate(GetMethod(implObj, "SetSharpness1"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetInterpolationMode)
        CallbackFree(this.vtbl.SetBorderMode)
        CallbackFree(this.vtbl.SetTransformMatrix)
        CallbackFree(this.vtbl.SetTransformMatrixElement)
        CallbackFree(this.vtbl.SetTransformMatrixElement1)
        CallbackFree(this.vtbl.SetSharpness)
        CallbackFree(this.vtbl.SetSharpness1)
    }
}
