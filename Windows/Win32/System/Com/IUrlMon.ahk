#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\IBindCtx.ahk" { IBindCtx }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.Com
 */
export default struct IUrlMon extends IUnknown {
    /**
     * The interface identifier for IUrlMon
     * @type {Guid}
     */
    static IID := Guid("{00000026-0000-0000-c000-000000000046}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IUrlMon interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        AsyncGetClassBits : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IUrlMon.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Pointer<Guid>} rclsid 
     * @param {PWSTR} pszTYPE 
     * @param {PWSTR} pszExt 
     * @param {Integer} dwFileVersionMS 
     * @param {Integer} dwFileVersionLS 
     * @param {PWSTR} pszCodeBase 
     * @param {IBindCtx} pbc 
     * @param {Integer} dwClassContext 
     * @param {Pointer<Guid>} riid 
     * @param {Integer} flags 
     * @returns {HRESULT} 
     */
    AsyncGetClassBits(rclsid, pszTYPE, pszExt, dwFileVersionMS, dwFileVersionLS, pszCodeBase, pbc, dwClassContext, riid, flags) {
        pszTYPE := pszTYPE is String ? StrPtr(pszTYPE) : pszTYPE
        pszExt := pszExt is String ? StrPtr(pszExt) : pszExt
        pszCodeBase := pszCodeBase is String ? StrPtr(pszCodeBase) : pszCodeBase

        result := ComCall(3, this, Guid.Ptr, rclsid, "ptr", pszTYPE, "ptr", pszExt, "uint", dwFileVersionMS, "uint", dwFileVersionLS, "ptr", pszCodeBase, "ptr", pbc, "uint", dwClassContext, Guid.Ptr, riid, "uint", flags, "HRESULT")
        return result
    }

    Query(iid) {
        if (IUrlMon.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.AsyncGetClassBits := CallbackCreate(GetMethod(implObj, "AsyncGetClassBits"), flags, 11)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.AsyncGetClassBits)
    }
}
