#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\IDCompositionEffect.ahk" { IDCompositionEffect }

/**
 * Represents a filter effect.
 * @see https://learn.microsoft.com/windows/win32/api/dcomp/nn-dcomp-idcompositionfiltereffect
 * @namespace Windows.Win32.Graphics.DirectComposition
 */
export default struct IDCompositionFilterEffect extends IDCompositionEffect {
    /**
     * The interface identifier for IDCompositionFilterEffect
     * @type {Guid}
     */
    static IID := Guid("{30c421d5-8cb2-4e9f-b133-37be270d4ac2}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDCompositionFilterEffect interfaces
    */
    struct Vtbl extends IDCompositionEffect.Vtbl {
        SetInput : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDCompositionFilterEffect.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Sets the the input at an index to the specified filter effect.
     * @param {Integer} index Type: <b>UINT</b>
     * 
     * Specifies the index the to apply the filter effect at.
     * @param {IUnknown} _input Type: <b>IUnknown*</b>
     * 
     * The filter effect to apply.
     *           The following effects are available:
     *           
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/dcomp/nn-dcomp-idcompositionaffinetransform2deffect">IDCompositionAffineTransform2DEffect</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/dcomp/nn-dcomp-idcompositionarithmeticcompositeeffect">IDCompositionArithmeticCompositeEffect</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/dcomp/nn-dcomp-idcompositionblendeffect">IDCompositionBlendEffect</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/dcomp/nn-dcomp-idcompositionbrightnesseffect">IDCompositionBrightnessEffect</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/dcomp/nn-dcomp-idcompositioncolormatrixeffect">IDCompositionColorMatrixEffect</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/dcomp/nn-dcomp-idcompositioncompositeeffect">IDCompositionCompositeEffect</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/dn919732(v=vs.85)">IDCompositionFloodEffect</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/dcomp/nn-dcomp-idcompositiongaussianblureffect">IDCompositionGaussianBlurEffect</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/dcomp/nn-dcomp-idcompositionhuerotationeffect">IDCompositionHueRotationEffect</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/dcomp/nn-dcomp-idcompositionlineartransfereffect">IDCompositionLinearTransferEffect</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/dcomp/nn-dcomp-idcompositionsaturationeffect">IDCompositionSaturationEffect</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/dcomp/nn-dcomp-idcompositionshadoweffect">IDCompositionShadowEffect</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/dcomp/nn-dcomp-idcompositiontabletransfereffect">IDCompositionTableTransferEffect</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/dcomp/nn-dcomp-idcompositionturbulenceeffect">IDCompositionTurbulenceEffect</a>
     * </li>
     * </ul>
     * @param {Integer} flags Type: <b>UINT</b>
     * 
     * Flags to apply to the filter effect.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionfiltereffect-setinput
     */
    SetInput(index, _input, flags) {
        result := ComCall(3, this, "uint", index, "ptr", _input, "uint", flags, "HRESULT")
        return result
    }

    Query(iid) {
        if (IDCompositionFilterEffect.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetInput := CallbackCreate(GetMethod(implObj, "SetInput"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetInput)
    }
}
