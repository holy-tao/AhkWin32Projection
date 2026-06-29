#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\IDocHostUIHandler.ahk" { IDocHostUIHandler }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct IDocHostUIHandler2 extends IDocHostUIHandler {
    /**
     * The interface identifier for IDocHostUIHandler2
     * @type {Guid}
     */
    static IID := Guid("{3050f6d0-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDocHostUIHandler2 interfaces
    */
    struct Vtbl extends IDocHostUIHandler.Vtbl {
        GetOverrideKeyPath : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDocHostUIHandler2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Integer} dw 
     * @returns {PWSTR} 
     */
    GetOverrideKeyPath(dw) {
        result := ComCall(18, this, PWSTR.Ptr, &pchKey := 0, "uint", dw, "HRESULT")
        return pchKey
    }

    Query(iid) {
        if (IDocHostUIHandler2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetOverrideKeyPath := CallbackCreate(GetMethod(implObj, "GetOverrideKeyPath"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetOverrideKeyPath)
    }
}
