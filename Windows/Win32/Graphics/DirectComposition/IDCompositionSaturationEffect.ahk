#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IDCompositionFilterEffect.ahk" { IDCompositionFilterEffect }
#Import ".\IDCompositionAnimation.ahk" { IDCompositionAnimation }

/**
 * This effect is used to alter the saturation of an image. The saturation effect is a specialization of the color matrix effect.
 * @see https://learn.microsoft.com/windows/win32/api/dcomp/nn-dcomp-idcompositionsaturationeffect
 * @namespace Windows.Win32.Graphics.DirectComposition
 */
export default struct IDCompositionSaturationEffect extends IDCompositionFilterEffect {
    /**
     * The interface identifier for IDCompositionSaturationEffect
     * @type {Guid}
     */
    static IID := Guid("{a08debda-3258-4fa4-9f16-9174d3fe93b1}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDCompositionSaturationEffect interfaces
    */
    struct Vtbl extends IDCompositionFilterEffect.Vtbl {
        SetSaturation  : IntPtr
        SetSaturation1 : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDCompositionSaturationEffect.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Sets the saturation of the image. (overload 2/2)
     * @param {IDCompositionAnimation} animation 
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionsaturationeffect-setsaturation(float)
     */
    SetSaturation(animation) {
        result := ComCall(4, this, "ptr", animation, "HRESULT")
        return result
    }

    /**
     * Sets the saturation of the image. (overload 2/2)
     * @param {Float} ratio Type: <b>float</b>
     * 
     * The saturation of the image. You can set the saturation to a value between 0 and 1. If you set it to 1 the output image is fully saturated. If you set it to 0 the output image is monochrome. The saturation value is unitless. The effect calculates a color matrix based on the saturation value (s in the equation here) using the following equation:
     *             
     * <img alt="Matrix equation" src="./images/saturation_formula.png"/>
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionsaturationeffect-setsaturation(float)
     */
    SetSaturation1(ratio) {
        result := ComCall(5, this, "float", ratio, "HRESULT")
        return result
    }

    Query(iid) {
        if (IDCompositionSaturationEffect.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetSaturation := CallbackCreate(GetMethod(implObj, "SetSaturation"), flags, 2)
        this.vtbl.SetSaturation1 := CallbackCreate(GetMethod(implObj, "SetSaturation1"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetSaturation)
        CallbackFree(this.vtbl.SetSaturation1)
    }
}
