#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IDCompositionFilterEffect.ahk" { IDCompositionFilterEffect }
#Import ".\IDCompositionAnimation.ahk" { IDCompositionAnimation }

/**
 * The hue rotate effect alters the hue of an image by applying a color matrix based on the rotation angle.
 * @see https://learn.microsoft.com/windows/win32/api/dcomp/nn-dcomp-idcompositionhuerotationeffect
 * @namespace Windows.Win32.Graphics.DirectComposition
 */
export default struct IDCompositionHueRotationEffect extends IDCompositionFilterEffect {
    /**
     * The interface identifier for IDCompositionHueRotationEffect
     * @type {Guid}
     */
    static IID := Guid("{6db9f920-0770-4781-b0c6-381912f9d167}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDCompositionHueRotationEffect interfaces
    */
    struct Vtbl extends IDCompositionFilterEffect.Vtbl {
        SetAngle  : IntPtr
        SetAngle1 : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDCompositionHueRotationEffect.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The IDCompositionHueRotationEffect::SetAngle(float) method sets the angle to rotate the hue.
     * @param {IDCompositionAnimation} animation 
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionhuerotationeffect-setangle(float)
     */
    SetAngle(animation) {
        result := ComCall(4, this, "ptr", animation, "HRESULT")
        return result
    }

    /**
     * The IDCompositionHueRotationEffect::SetAngle(float) method sets the angle to rotate the hue.
     * @param {Float} amountDegrees Type: <b>float</b>
     * 
     * The angle to rotate the hue. The effect calculates a color matrix based on the rotation angle (θ) according to the following matrix equations:
     *           
     * 
     * <img alt="Matrix equation" src="./images/hue_formula.png"/>
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionhuerotationeffect-setangle(float)
     */
    SetAngle1(amountDegrees) {
        result := ComCall(5, this, "float", amountDegrees, "HRESULT")
        return result
    }

    Query(iid) {
        if (IDCompositionHueRotationEffect.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetAngle := CallbackCreate(GetMethod(implObj, "SetAngle"), flags, 2)
        this.vtbl.SetAngle1 := CallbackCreate(GetMethod(implObj, "SetAngle1"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetAngle)
        CallbackFree(this.vtbl.SetAngle1)
    }
}
