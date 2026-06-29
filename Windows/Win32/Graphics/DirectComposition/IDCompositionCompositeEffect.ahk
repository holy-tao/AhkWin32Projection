#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IDCompositionFilterEffect.ahk" { IDCompositionFilterEffect }
#Import "..\Direct2D\Common\D2D1_COMPOSITE_MODE.ahk" { D2D1_COMPOSITE_MODE }

/**
 * The composite effect is used to combine 2 or more images.
 * @see https://learn.microsoft.com/windows/win32/api/dcomp/nn-dcomp-idcompositioncompositeeffect
 * @namespace Windows.Win32.Graphics.DirectComposition
 */
export default struct IDCompositionCompositeEffect extends IDCompositionFilterEffect {
    /**
     * The interface identifier for IDCompositionCompositeEffect
     * @type {Guid}
     */
    static IID := Guid("{576616c0-a231-494d-a38d-00fd5ec4db46}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDCompositionCompositeEffect interfaces
    */
    struct Vtbl extends IDCompositionFilterEffect.Vtbl {
        SetMode : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDCompositionCompositeEffect.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Sets the mode for the composite effect.
     * @param {D2D1_COMPOSITE_MODE} _mode Type: <b><a href="https://docs.microsoft.com/windows/desktop/Direct2D/composite">D2D1_COMPOSITE_MODE</a></b>
     * 
     * The mode for the composite effect.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositioncompositeeffect-setmode
     */
    SetMode(_mode) {
        result := ComCall(4, this, D2D1_COMPOSITE_MODE, _mode, "HRESULT")
        return result
    }

    Query(iid) {
        if (IDCompositionCompositeEffect.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetMode := CallbackCreate(GetMethod(implObj, "SetMode"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetMode)
    }
}
