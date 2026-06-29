#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IDCompositionFilterEffect.ahk" { IDCompositionFilterEffect }
#Import "..\Direct2D\Common\D2D1_BORDER_MODE.ahk" { D2D1_BORDER_MODE }
#Import ".\IDCompositionAnimation.ahk" { IDCompositionAnimation }

/**
 * The Gaussian blur effect is used to blur an image by a Gaussian function, typically to reduce image noise and reduce detail.
 * @see https://learn.microsoft.com/windows/win32/api/dcomp/nn-dcomp-idcompositiongaussianblureffect
 * @namespace Windows.Win32.Graphics.DirectComposition
 */
export default struct IDCompositionGaussianBlurEffect extends IDCompositionFilterEffect {
    /**
     * The interface identifier for IDCompositionGaussianBlurEffect
     * @type {Guid}
     */
    static IID := Guid("{45d4d0b7-1bd4-454e-8894-2bfa68443033}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDCompositionGaussianBlurEffect interfaces
    */
    struct Vtbl extends IDCompositionFilterEffect.Vtbl {
        SetStandardDeviation  : IntPtr
        SetStandardDeviation1 : IntPtr
        SetBorderMode         : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDCompositionGaussianBlurEffect.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The IDCompositionGaussianBlurEffect::SetStandardDeviation(float) method sets the amount of blur to be applied to the image.
     * @param {IDCompositionAnimation} animation 
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositiongaussianblureffect-setstandarddeviation(float)
     */
    SetStandardDeviation(animation) {
        result := ComCall(4, this, "ptr", animation, "HRESULT")
        return result
    }

    /**
     * The IDCompositionGaussianBlurEffect::SetStandardDeviation(float) method sets the amount of blur to be applied to the image.
     * @param {Float} amount Type: <b>float</b>
     * 
     * The amount of blur to be applied to the image. You can compute the blur radius of the kernel by multiplying the standard deviation by 3.
     *             The units of both the standard deviation and blur radius are DIPs. A value of zero DIPs disables this effect entirely.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositiongaussianblureffect-setstandarddeviation(float)
     */
    SetStandardDeviation1(amount) {
        result := ComCall(5, this, "float", amount, "HRESULT")
        return result
    }

    /**
     * Sets the mode used to calculate the border of the image.
     * @param {D2D1_BORDER_MODE} _mode Type: <b><a href="https://docs.microsoft.com/windows/desktop/Direct2D/gaussian-blur">D2D1_BORDER_MODE</a></b>
     * 
     * The mode used to calculate the border of the image.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositiongaussianblureffect-setbordermode
     */
    SetBorderMode(_mode) {
        result := ComCall(6, this, D2D1_BORDER_MODE, _mode, "HRESULT")
        return result
    }

    Query(iid) {
        if (IDCompositionGaussianBlurEffect.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetStandardDeviation := CallbackCreate(GetMethod(implObj, "SetStandardDeviation"), flags, 2)
        this.vtbl.SetStandardDeviation1 := CallbackCreate(GetMethod(implObj, "SetStandardDeviation1"), flags, 2)
        this.vtbl.SetBorderMode := CallbackCreate(GetMethod(implObj, "SetBorderMode"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetStandardDeviation)
        CallbackFree(this.vtbl.SetStandardDeviation1)
        CallbackFree(this.vtbl.SetBorderMode)
    }
}
