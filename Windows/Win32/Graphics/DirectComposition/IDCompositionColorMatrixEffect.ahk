#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\Direct2D\Common\D2D1_COLORMATRIX_ALPHA_MODE.ahk" { D2D1_COLORMATRIX_ALPHA_MODE }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IDCompositionFilterEffect.ahk" { IDCompositionFilterEffect }
#Import "..\Direct2D\Common\D2D_MATRIX_5X4_F.ahk" { D2D_MATRIX_5X4_F }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\IDCompositionAnimation.ahk" { IDCompositionAnimation }

/**
 * The color matrix effect alters the RGBA values of a bitmap.
 * @see https://learn.microsoft.com/windows/win32/api/dcomp/nn-dcomp-idcompositioncolormatrixeffect
 * @namespace Windows.Win32.Graphics.DirectComposition
 */
export default struct IDCompositionColorMatrixEffect extends IDCompositionFilterEffect {
    /**
     * The interface identifier for IDCompositionColorMatrixEffect
     * @type {Guid}
     */
    static IID := Guid("{c1170a22-3ce2-4966-90d4-55408bfc84c4}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDCompositionColorMatrixEffect interfaces
    */
    struct Vtbl extends IDCompositionFilterEffect.Vtbl {
        SetMatrix         : IntPtr
        SetMatrixElement  : IntPtr
        SetMatrixElement1 : IntPtr
        SetAlphaMode      : IntPtr
        SetClampOutput    : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDCompositionColorMatrixEffect.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Sets the matrix used by the effect to multiply the RGBA values of the image.
     * @param {Pointer<D2D_MATRIX_5X4_F>} _matrix Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/Direct2D/d2d1-matrix-5x4-f">D2D1_MATRIX_5X4_F</a></b>
     * 
     * The matrix used by the effect to multiply the RGBA values of the image. The matrix is column major and is applied as shown in the following equation:
     *           
     * 
     * <img alt="Matrix equation" src="./images/color_matrix_formula.png"/>
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositioncolormatrixeffect-setmatrix
     */
    SetMatrix(_matrix) {
        result := ComCall(4, this, D2D_MATRIX_5X4_F.Ptr, _matrix, "HRESULT")
        return result
    }

    /**
     * Sets an element of the color matrix. (overload 1/2)
     * @param {Integer} row Type: <b>int</b>
     * 
     * The row of the element.
     * @param {Integer} _column Type: <b>int</b>
     * 
     * The column of the element.
     * @param {IDCompositionAnimation} animation 
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositioncolormatrixeffect-setmatrixelement(int_int_float)
     */
    SetMatrixElement(row, _column, animation) {
        result := ComCall(5, this, "int", row, "int", _column, "ptr", animation, "HRESULT")
        return result
    }

    /**
     * Sets an element of the color matrix. (overload 1/2)
     * @param {Integer} row Type: <b>int</b>
     * 
     * The row of the element.
     * @param {Integer} _column Type: <b>int</b>
     * 
     * The column of the element.
     * @param {Float} value Type: <b>float</b>
     * 
     * The new value of the element.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositioncolormatrixeffect-setmatrixelement(int_int_float)
     */
    SetMatrixElement1(row, _column, value) {
        result := ComCall(6, this, "int", row, "int", _column, "float", value, "HRESULT")
        return result
    }

    /**
     * Sets the alpha mode of the output for the color matrix effect.
     * @param {D2D1_COLORMATRIX_ALPHA_MODE} _mode Type: <b><a href="https://docs.microsoft.com/windows/desktop/Direct2D/color-matrix">D2D1_COLORMATRIX_ALPHA_MODE</a></b>
     * 
     * The alpha mode of the output for the color matrix effect.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositioncolormatrixeffect-setalphamode
     */
    SetAlphaMode(_mode) {
        result := ComCall(7, this, D2D1_COLORMATRIX_ALPHA_MODE, _mode, "HRESULT")
        return result
    }

    /**
     * Specifies whether the effect clamps color values to between 0 and 1 before the effects passes the values to the next effect in the chain.
     * @param {BOOL} clamp Type: <b>BOOL</b>
     * 
     * A boolean value indicating whether the effect clamps color values to between 0 and 1 before the effects passes the values to the next effect in the chain.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositioncolormatrixeffect-setclampoutput
     */
    SetClampOutput(clamp) {
        result := ComCall(8, this, BOOL, clamp, "HRESULT")
        return result
    }

    Query(iid) {
        if (IDCompositionColorMatrixEffect.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetMatrix := CallbackCreate(GetMethod(implObj, "SetMatrix"), flags, 2)
        this.vtbl.SetMatrixElement := CallbackCreate(GetMethod(implObj, "SetMatrixElement"), flags, 4)
        this.vtbl.SetMatrixElement1 := CallbackCreate(GetMethod(implObj, "SetMatrixElement1"), flags, 4)
        this.vtbl.SetAlphaMode := CallbackCreate(GetMethod(implObj, "SetAlphaMode"), flags, 2)
        this.vtbl.SetClampOutput := CallbackCreate(GetMethod(implObj, "SetClampOutput"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetMatrix)
        CallbackFree(this.vtbl.SetMatrixElement)
        CallbackFree(this.vtbl.SetMatrixElement1)
        CallbackFree(this.vtbl.SetAlphaMode)
        CallbackFree(this.vtbl.SetClampOutput)
    }
}
