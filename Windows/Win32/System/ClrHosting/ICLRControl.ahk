#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.ClrHosting
 */
export default struct ICLRControl extends IUnknown {
    /**
     * The interface identifier for ICLRControl
     * @type {Guid}
     */
    static IID := Guid("{9065597e-d1a1-4fb2-b6ba-7e1fce230f61}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ICLRControl interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetCLRManager           : IntPtr
        SetAppDomainManagerType : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ICLRControl.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<Void>} 
     */
    GetCLRManager(riid) {
        result := ComCall(3, this, Guid.Ptr, riid, "ptr*", &ppObject := 0, "HRESULT")
        return ppObject
    }

    /**
     * 
     * @param {PWSTR} pwzAppDomainManagerAssembly 
     * @param {PWSTR} pwzAppDomainManagerType 
     * @returns {HRESULT} 
     */
    SetAppDomainManagerType(pwzAppDomainManagerAssembly, pwzAppDomainManagerType) {
        pwzAppDomainManagerAssembly := pwzAppDomainManagerAssembly is String ? StrPtr(pwzAppDomainManagerAssembly) : pwzAppDomainManagerAssembly
        pwzAppDomainManagerType := pwzAppDomainManagerType is String ? StrPtr(pwzAppDomainManagerType) : pwzAppDomainManagerType

        result := ComCall(4, this, "ptr", pwzAppDomainManagerAssembly, "ptr", pwzAppDomainManagerType, "HRESULT")
        return result
    }

    Query(iid) {
        if (ICLRControl.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetCLRManager := CallbackCreate(GetMethod(implObj, "GetCLRManager"), flags, 3)
        this.vtbl.SetAppDomainManagerType := CallbackCreate(GetMethod(implObj, "SetAppDomainManagerType"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetCLRManager)
        CallbackFree(this.vtbl.SetAppDomainManagerType)
    }
}
