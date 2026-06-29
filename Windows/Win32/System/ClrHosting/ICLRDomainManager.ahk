#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\EInitializeNewDomainFlags.ahk" { EInitializeNewDomainFlags }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.ClrHosting
 */
export default struct ICLRDomainManager extends IUnknown {
    /**
     * The interface identifier for ICLRDomainManager
     * @type {Guid}
     */
    static IID := Guid("{270d00a2-8e15-4d0b-adeb-37bc3e47df77}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ICLRDomainManager interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        SetAppDomainManagerType          : IntPtr
        SetPropertiesForDefaultAppDomain : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ICLRDomainManager.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {PWSTR} wszAppDomainManagerAssembly 
     * @param {PWSTR} wszAppDomainManagerType 
     * @param {EInitializeNewDomainFlags} dwInitializeDomainFlags 
     * @returns {HRESULT} 
     */
    SetAppDomainManagerType(wszAppDomainManagerAssembly, wszAppDomainManagerType, dwInitializeDomainFlags) {
        wszAppDomainManagerAssembly := wszAppDomainManagerAssembly is String ? StrPtr(wszAppDomainManagerAssembly) : wszAppDomainManagerAssembly
        wszAppDomainManagerType := wszAppDomainManagerType is String ? StrPtr(wszAppDomainManagerType) : wszAppDomainManagerType

        result := ComCall(3, this, "ptr", wszAppDomainManagerAssembly, "ptr", wszAppDomainManagerType, EInitializeNewDomainFlags, dwInitializeDomainFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} nProperties 
     * @param {Pointer<PWSTR>} pwszPropertyNames 
     * @param {Pointer<PWSTR>} pwszPropertyValues 
     * @returns {HRESULT} 
     */
    SetPropertiesForDefaultAppDomain(nProperties, pwszPropertyNames, pwszPropertyValues) {
        pwszPropertyNamesMarshal := pwszPropertyNames is VarRef ? "ptr*" : "ptr"
        pwszPropertyValuesMarshal := pwszPropertyValues is VarRef ? "ptr*" : "ptr"

        result := ComCall(4, this, "uint", nProperties, pwszPropertyNamesMarshal, pwszPropertyNames, pwszPropertyValuesMarshal, pwszPropertyValues, "HRESULT")
        return result
    }

    Query(iid) {
        if (ICLRDomainManager.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetAppDomainManagerType := CallbackCreate(GetMethod(implObj, "SetAppDomainManagerType"), flags, 4)
        this.vtbl.SetPropertiesForDefaultAppDomain := CallbackCreate(GetMethod(implObj, "SetPropertiesForDefaultAppDomain"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetAppDomainManagerType)
        CallbackFree(this.vtbl.SetPropertiesForDefaultAppDomain)
    }
}
