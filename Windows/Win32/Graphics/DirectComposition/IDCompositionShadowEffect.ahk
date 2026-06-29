#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\Direct2D\Common\D2D_VECTOR_4F.ahk" { D2D_VECTOR_4F }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IDCompositionFilterEffect.ahk" { IDCompositionFilterEffect }
#Import ".\IDCompositionAnimation.ahk" { IDCompositionAnimation }

/**
 * The shadow effect is used to generate a shadow from the alpha channel of an image. The shadow is more opaque for higher alpha values and more transparent for lower alpha values. You can set the amount of blur and the color of the shadow.
 * @see https://learn.microsoft.com/windows/win32/api/dcomp/nn-dcomp-idcompositionshadoweffect
 * @namespace Windows.Win32.Graphics.DirectComposition
 */
export default struct IDCompositionShadowEffect extends IDCompositionFilterEffect {
    /**
     * The interface identifier for IDCompositionShadowEffect
     * @type {Guid}
     */
    static IID := Guid("{4ad18ac0-cfd2-4c2f-bb62-96e54fdb6879}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDCompositionShadowEffect interfaces
    */
    struct Vtbl extends IDCompositionFilterEffect.Vtbl {
        SetStandardDeviation  : IntPtr
        SetStandardDeviation1 : IntPtr
        SetColor              : IntPtr
        SetRed                : IntPtr
        SetRed1               : IntPtr
        SetGreen              : IntPtr
        SetGreen1             : IntPtr
        SetBlue               : IntPtr
        SetBlue1              : IntPtr
        SetAlpha              : IntPtr
        SetAlpha1             : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDCompositionShadowEffect.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Sets the amount of blur to be applied to the alpha channel of the image. (overload 1/2)
     * @param {IDCompositionAnimation} animation 
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionshadoweffect-setstandarddeviation(float)
     */
    SetStandardDeviation(animation) {
        result := ComCall(4, this, "ptr", animation, "HRESULT")
        return result
    }

    /**
     * Sets the amount of blur to be applied to the alpha channel of the image. (overload 1/2)
     * @param {Float} amount Type: <b>float</b>
     * 
     * The amount of blur to be applied to the alpha channel of the image. You can compute the blur radius of the kernel by multiplying the standard deviation by 3.
     *             The units of both the standard deviation and blur radius are DIPs.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionshadoweffect-setstandarddeviation(float)
     */
    SetStandardDeviation1(amount) {
        result := ComCall(5, this, "float", amount, "HRESULT")
        return result
    }

    /**
     * Sets color of the shadow.
     * @param {Pointer<D2D_VECTOR_4F>} _color Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/dcommon/ns-dcommon-d2d_vector_4f">D2D1_VECTOR_4F</a></b>
     * 
     * The color of the shadow.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionshadoweffect-setcolor
     */
    SetColor(_color) {
        result := ComCall(6, this, D2D_VECTOR_4F.Ptr, _color, "HRESULT")
        return result
    }

    /**
     * Sets the red value for the color of the shadow. (overload 2/2)
     * @param {IDCompositionAnimation} animation 
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionshadoweffect-setred(float)
     */
    SetRed(animation) {
        result := ComCall(7, this, "ptr", animation, "HRESULT")
        return result
    }

    /**
     * Sets the red value for the color of the shadow. (overload 2/2)
     * @param {Float} amount Type: <b>float</b>
     * 
     * The red value for the color of the shadow.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionshadoweffect-setred(float)
     */
    SetRed1(amount) {
        result := ComCall(8, this, "float", amount, "HRESULT")
        return result
    }

    /**
     * Sets the green value for the color of the shadow. (overload 1/2)
     * @param {IDCompositionAnimation} animation 
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionshadoweffect-setgreen(float)
     */
    SetGreen(animation) {
        result := ComCall(9, this, "ptr", animation, "HRESULT")
        return result
    }

    /**
     * Sets the green value for the color of the shadow. (overload 1/2)
     * @param {Float} amount Type: <b>float</b>
     * 
     * The green value for the color of the shadow.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionshadoweffect-setgreen(float)
     */
    SetGreen1(amount) {
        result := ComCall(10, this, "float", amount, "HRESULT")
        return result
    }

    /**
     * Sets the blue value for the color of the shadow. (overload 2/2)
     * @param {IDCompositionAnimation} animation Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/dcompanimation/nn-dcompanimation-idcompositionanimation">IDCompositionAnimation</a>*</b>
     * 
     * An animation that represents how the blue value for the color of the shadow changes over time. This parameter must not be NULL.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionshadoweffect-setblue(idcompositionanimation)
     */
    SetBlue(animation) {
        result := ComCall(11, this, "ptr", animation, "HRESULT")
        return result
    }

    /**
     * Sets the blue value for the color of the shadow. (overload 2/2)
     * @param {Float} amount 
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionshadoweffect-setblue(idcompositionanimation)
     */
    SetBlue1(amount) {
        result := ComCall(12, this, "float", amount, "HRESULT")
        return result
    }

    /**
     * Sets the alpha value for the effect. (overload 1/2)
     * @param {IDCompositionAnimation} animation Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/dcompanimation/nn-dcompanimation-idcompositionanimation">IDCompositionAnimation</a>*</b>
     * 
     * An animation that represents how the alpha value for the effect changes over time. This parameter must not be NULL.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionshadoweffect-setalpha(idcompositionanimation)
     */
    SetAlpha(animation) {
        result := ComCall(13, this, "ptr", animation, "HRESULT")
        return result
    }

    /**
     * Sets the alpha value for the effect. (overload 1/2)
     * @param {Float} amount 
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionshadoweffect-setalpha(idcompositionanimation)
     */
    SetAlpha1(amount) {
        result := ComCall(14, this, "float", amount, "HRESULT")
        return result
    }

    Query(iid) {
        if (IDCompositionShadowEffect.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetStandardDeviation := CallbackCreate(GetMethod(implObj, "SetStandardDeviation"), flags, 2)
        this.vtbl.SetStandardDeviation1 := CallbackCreate(GetMethod(implObj, "SetStandardDeviation1"), flags, 2)
        this.vtbl.SetColor := CallbackCreate(GetMethod(implObj, "SetColor"), flags, 2)
        this.vtbl.SetRed := CallbackCreate(GetMethod(implObj, "SetRed"), flags, 2)
        this.vtbl.SetRed1 := CallbackCreate(GetMethod(implObj, "SetRed1"), flags, 2)
        this.vtbl.SetGreen := CallbackCreate(GetMethod(implObj, "SetGreen"), flags, 2)
        this.vtbl.SetGreen1 := CallbackCreate(GetMethod(implObj, "SetGreen1"), flags, 2)
        this.vtbl.SetBlue := CallbackCreate(GetMethod(implObj, "SetBlue"), flags, 2)
        this.vtbl.SetBlue1 := CallbackCreate(GetMethod(implObj, "SetBlue1"), flags, 2)
        this.vtbl.SetAlpha := CallbackCreate(GetMethod(implObj, "SetAlpha"), flags, 2)
        this.vtbl.SetAlpha1 := CallbackCreate(GetMethod(implObj, "SetAlpha1"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetStandardDeviation)
        CallbackFree(this.vtbl.SetStandardDeviation1)
        CallbackFree(this.vtbl.SetColor)
        CallbackFree(this.vtbl.SetRed)
        CallbackFree(this.vtbl.SetRed1)
        CallbackFree(this.vtbl.SetGreen)
        CallbackFree(this.vtbl.SetGreen1)
        CallbackFree(this.vtbl.SetBlue)
        CallbackFree(this.vtbl.SetBlue1)
        CallbackFree(this.vtbl.SetAlpha)
        CallbackFree(this.vtbl.SetAlpha1)
    }
}
