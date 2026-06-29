#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IWbemContext.ahk" { IWbemContext }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * The IWbemDecoupledRegistrar interface associates decoupled providers with WMI. This interface allows a process-hosted provider to define the interoperability lifetime of the interface and to coexist with other providers.
 * @see https://learn.microsoft.com/windows/win32/api/wbemprov/nn-wbemprov-iwbemdecoupledregistrar
 * @namespace Windows.Win32.System.Wmi
 */
export default struct IWbemDecoupledRegistrar extends IUnknown {
    /**
     * The interface identifier for IWbemDecoupledRegistrar
     * @type {Guid}
     */
    static IID := Guid("{1005cbcf-e64f-4646-bcd3-3a089d8a84b4}")

    /**
     * The class identifier for WbemDecoupledRegistrar
     * @type {Guid}
     */
    static CLSID := Guid("{4cfc7932-0f9d-4bef-9c32-8ea2a6b56fcb}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWbemDecoupledRegistrar interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Register   : IntPtr
        UnRegister : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWbemDecoupledRegistrar.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The IWbemDecoupledRegistrar::Register method registers an object interface with WMI.
     * @param {Integer} a_Flags Reserved for future use.
     * @param {IWbemContext} a_Context Reserved for future use.
     * @param {PWSTR} a_User String identifying the user for this registration.
     * @param {PWSTR} a_Locale String identifying the locale for this registration.
     * @param {PWSTR} a_Scope Object path representing the binding to a WMI provider registration object in a specified namespace. The scope object path can be <b>NULL</b>, indicating that the provider will support all namespaces.
     * @param {PWSTR} a_Registration Name of the provider being registered.
     * @param {IUnknown} pIUnknown Pointer to an object for particular registration. This interface will be queried to determine the interface support that the object is capable of servicing.
     * @returns {HRESULT} This method returns an <b>HRESULT</b> indicating the status of the method call. The following list lists the value contained within an <b>HRESULT</b>.
     * @see https://learn.microsoft.com/windows/win32/api/wbemprov/nf-wbemprov-iwbemdecoupledregistrar-register
     */
    Register(a_Flags, a_Context, a_User, a_Locale, a_Scope, a_Registration, pIUnknown) {
        a_User := a_User is String ? StrPtr(a_User) : a_User
        a_Locale := a_Locale is String ? StrPtr(a_Locale) : a_Locale
        a_Scope := a_Scope is String ? StrPtr(a_Scope) : a_Scope
        a_Registration := a_Registration is String ? StrPtr(a_Registration) : a_Registration

        result := ComCall(3, this, "int", a_Flags, "ptr", a_Context, "ptr", a_User, "ptr", a_Locale, "ptr", a_Scope, "ptr", a_Registration, "ptr", pIUnknown, "HRESULT")
        return result
    }

    /**
     * The IWbemDecoupledRegistrar::UnRegister method removes the registration of an object interface from WMI.
     * @returns {HRESULT} This method returns an <b>HRESULT</b> indicating the status of the method call. The following list lists the value contained within an <b>HRESULT</b>.
     * @see https://learn.microsoft.com/windows/win32/api/wbemprov/nf-wbemprov-iwbemdecoupledregistrar-unregister
     */
    UnRegister() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IWbemDecoupledRegistrar.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Register := CallbackCreate(GetMethod(implObj, "Register"), flags, 8)
        this.vtbl.UnRegister := CallbackCreate(GetMethod(implObj, "UnRegister"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Register)
        CallbackFree(this.vtbl.UnRegister)
    }
}
