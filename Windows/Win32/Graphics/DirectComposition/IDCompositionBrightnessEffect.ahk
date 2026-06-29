#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IDCompositionFilterEffect.ahk" { IDCompositionFilterEffect }
#Import ".\IDCompositionAnimation.ahk" { IDCompositionAnimation }
#Import "..\Direct2D\Common\D2D_VECTOR_2F.ahk" { D2D_VECTOR_2F }

/**
 * The brightness effect controls the brightness of the image.
 * @see https://learn.microsoft.com/windows/win32/api/dcomp/nn-dcomp-idcompositionbrightnesseffect
 * @namespace Windows.Win32.Graphics.DirectComposition
 */
export default struct IDCompositionBrightnessEffect extends IDCompositionFilterEffect {
    /**
     * The interface identifier for IDCompositionBrightnessEffect
     * @type {Guid}
     */
    static IID := Guid("{6027496e-cb3a-49ab-934f-d798da4f7da6}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDCompositionBrightnessEffect interfaces
    */
    struct Vtbl extends IDCompositionFilterEffect.Vtbl {
        SetWhitePoint   : IntPtr
        SetBlackPoint   : IntPtr
        SetWhitePointX  : IntPtr
        SetWhitePointX1 : IntPtr
        SetWhitePointY  : IntPtr
        SetWhitePointY1 : IntPtr
        SetBlackPointX  : IntPtr
        SetBlackPointX1 : IntPtr
        SetBlackPointY  : IntPtr
        SetBlackPointY1 : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDCompositionBrightnessEffect.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Sets the upper portion of the brightness transfer curve.
     * @param {Pointer<D2D_VECTOR_2F>} whitePoint Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/dcommon/ns-dcommon-d2d_vector_2f">D2D1_VECTOR_2F</a></b>
     * 
     * The upper portion of the brightness transfer curve. The white point adjusts the appearance of the brighter portions of the image. 
     * This vector is for both the x value and the y value, in that order. Each of the values must be between 0 and 1, inclusive.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionbrightnesseffect-setwhitepoint
     */
    SetWhitePoint(whitePoint) {
        result := ComCall(4, this, D2D_VECTOR_2F.Ptr, whitePoint, "HRESULT")
        return result
    }

    /**
     * Specifies the lower portion of the brightness transfer curve for the brightness effect.
     * @param {Pointer<D2D_VECTOR_2F>} blackPoint Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/dcommon/ns-dcommon-d2d_vector_2f">D2D1_VECTOR_2F</a></b>
     * 
     * The lower portion of the brightness transfer curve. The black point adjusts the appearance of the darker portions of the image. The vector is for both the x value and the y value, in that order. Each of the values must be between 0 and 1, inclusive.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionbrightnesseffect-setblackpoint
     */
    SetBlackPoint(blackPoint) {
        result := ComCall(5, this, D2D_VECTOR_2F.Ptr, blackPoint, "HRESULT")
        return result
    }

    /**
     * Sets the x value of the white point. (overload 2/2)
     * @param {IDCompositionAnimation} animation 
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionbrightnesseffect-setwhitepointx(float)
     */
    SetWhitePointX(animation) {
        result := ComCall(6, this, "ptr", animation, "HRESULT")
        return result
    }

    /**
     * Sets the x value of the white point. (overload 2/2)
     * @param {Float} whitePointX Type: <b>float</b>
     * 
     * The x value of the white point. This value must be between 0 and 1.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionbrightnesseffect-setwhitepointx(float)
     */
    SetWhitePointX1(whitePointX) {
        result := ComCall(7, this, "float", whitePointX, "HRESULT")
        return result
    }

    /**
     * Sets the y value of the white point. (overload 1/2)
     * @param {IDCompositionAnimation} animation Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/dcompanimation/nn-dcompanimation-idcompositionanimation">IDCompositionAnimation</a>*</b>
     * 
     * An animation that represents how the y value of the white point changes over time. This parameter must not be NULL.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionbrightnesseffect-setwhitepointy(idcompositionanimation)
     */
    SetWhitePointY(animation) {
        result := ComCall(8, this, "ptr", animation, "HRESULT")
        return result
    }

    /**
     * Sets the y value of the white point. (overload 1/2)
     * @param {Float} whitePointY 
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionbrightnesseffect-setwhitepointy(idcompositionanimation)
     */
    SetWhitePointY1(whitePointY) {
        result := ComCall(9, this, "float", whitePointY, "HRESULT")
        return result
    }

    /**
     * Sets the x value of the black point. (overload 1/2)
     * @param {IDCompositionAnimation} animation Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/dcompanimation/nn-dcompanimation-idcompositionanimation">IDCompositionAnimation</a>*</b>
     * 
     * An animation that represents how the x value of the black point changes over time. This parameter must not be NULL.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionbrightnesseffect-setblackpointx(idcompositionanimation)
     */
    SetBlackPointX(animation) {
        result := ComCall(10, this, "ptr", animation, "HRESULT")
        return result
    }

    /**
     * Sets the x value of the black point. (overload 1/2)
     * @param {Float} blackPointX 
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionbrightnesseffect-setblackpointx(idcompositionanimation)
     */
    SetBlackPointX1(blackPointX) {
        result := ComCall(11, this, "float", blackPointX, "HRESULT")
        return result
    }

    /**
     * Sets the y value of the black point. (overload 1/2)
     * @param {IDCompositionAnimation} animation 
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionbrightnesseffect-setblackpointy(float)
     */
    SetBlackPointY(animation) {
        result := ComCall(12, this, "ptr", animation, "HRESULT")
        return result
    }

    /**
     * Sets the y value of the black point. (overload 1/2)
     * @param {Float} blackPointY Type: <b>float</b>
     * 
     * The y value of the black point.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionbrightnesseffect-setblackpointy(float)
     */
    SetBlackPointY1(blackPointY) {
        result := ComCall(13, this, "float", blackPointY, "HRESULT")
        return result
    }

    Query(iid) {
        if (IDCompositionBrightnessEffect.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetWhitePoint := CallbackCreate(GetMethod(implObj, "SetWhitePoint"), flags, 2)
        this.vtbl.SetBlackPoint := CallbackCreate(GetMethod(implObj, "SetBlackPoint"), flags, 2)
        this.vtbl.SetWhitePointX := CallbackCreate(GetMethod(implObj, "SetWhitePointX"), flags, 2)
        this.vtbl.SetWhitePointX1 := CallbackCreate(GetMethod(implObj, "SetWhitePointX1"), flags, 2)
        this.vtbl.SetWhitePointY := CallbackCreate(GetMethod(implObj, "SetWhitePointY"), flags, 2)
        this.vtbl.SetWhitePointY1 := CallbackCreate(GetMethod(implObj, "SetWhitePointY1"), flags, 2)
        this.vtbl.SetBlackPointX := CallbackCreate(GetMethod(implObj, "SetBlackPointX"), flags, 2)
        this.vtbl.SetBlackPointX1 := CallbackCreate(GetMethod(implObj, "SetBlackPointX1"), flags, 2)
        this.vtbl.SetBlackPointY := CallbackCreate(GetMethod(implObj, "SetBlackPointY"), flags, 2)
        this.vtbl.SetBlackPointY1 := CallbackCreate(GetMethod(implObj, "SetBlackPointY1"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetWhitePoint)
        CallbackFree(this.vtbl.SetBlackPoint)
        CallbackFree(this.vtbl.SetWhitePointX)
        CallbackFree(this.vtbl.SetWhitePointX1)
        CallbackFree(this.vtbl.SetWhitePointY)
        CallbackFree(this.vtbl.SetWhitePointY1)
        CallbackFree(this.vtbl.SetBlackPointX)
        CallbackFree(this.vtbl.SetBlackPointX1)
        CallbackFree(this.vtbl.SetBlackPointY)
        CallbackFree(this.vtbl.SetBlackPointY1)
    }
}
