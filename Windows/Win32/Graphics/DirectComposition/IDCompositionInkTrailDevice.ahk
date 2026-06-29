#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IDCompositionDelegatedInkTrail.ahk" { IDCompositionDelegatedInkTrail }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.Graphics.DirectComposition
 */
export default struct IDCompositionInkTrailDevice extends IUnknown {
    /**
     * The interface identifier for IDCompositionInkTrailDevice
     * @type {Guid}
     */
    static IID := Guid("{df0c7cec-cdeb-4d4a-b91c-721bf22f4e6c}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDCompositionInkTrailDevice interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        CreateDelegatedInkTrail             : IntPtr
        CreateDelegatedInkTrailForSwapChain : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDCompositionInkTrailDevice.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @returns {IDCompositionDelegatedInkTrail} 
     */
    CreateDelegatedInkTrail() {
        result := ComCall(3, this, "ptr*", &inkTrail := 0, "HRESULT")
        return IDCompositionDelegatedInkTrail(inkTrail)
    }

    /**
     * 
     * @param {IUnknown} swapChain 
     * @returns {IDCompositionDelegatedInkTrail} 
     */
    CreateDelegatedInkTrailForSwapChain(swapChain) {
        result := ComCall(4, this, "ptr", swapChain, "ptr*", &inkTrail := 0, "HRESULT")
        return IDCompositionDelegatedInkTrail(inkTrail)
    }

    Query(iid) {
        if (IDCompositionInkTrailDevice.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.CreateDelegatedInkTrail := CallbackCreate(GetMethod(implObj, "CreateDelegatedInkTrail"), flags, 2)
        this.vtbl.CreateDelegatedInkTrailForSwapChain := CallbackCreate(GetMethod(implObj, "CreateDelegatedInkTrailForSwapChain"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.CreateDelegatedInkTrail)
        CallbackFree(this.vtbl.CreateDelegatedInkTrailForSwapChain)
    }
}
