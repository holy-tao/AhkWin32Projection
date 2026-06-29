#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IDCompositionDevice4.ahk" { IDCompositionDevice4 }
#Import ".\IDCompositionDynamicTexture.ahk" { IDCompositionDynamicTexture }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.Graphics.DirectComposition
 */
export default struct IDCompositionDevice5 extends IDCompositionDevice4 {
    /**
     * The interface identifier for IDCompositionDevice5
     * @type {Guid}
     */
    static IID := Guid("{2c6bebfe-a603-472f-af34-d2443356e61b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDCompositionDevice5 interfaces
    */
    struct Vtbl extends IDCompositionDevice4.Vtbl {
        CreateDynamicTexture : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDCompositionDevice5.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @returns {IDCompositionDynamicTexture} 
     */
    CreateDynamicTexture() {
        result := ComCall(39, this, "ptr*", &compositionDynamicTexture := 0, "HRESULT")
        return IDCompositionDynamicTexture(compositionDynamicTexture)
    }

    Query(iid) {
        if (IDCompositionDevice5.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.CreateDynamicTexture := CallbackCreate(GetMethod(implObj, "CreateDynamicTexture"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.CreateDynamicTexture)
    }
}
