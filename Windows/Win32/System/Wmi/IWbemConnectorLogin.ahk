#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IWbemContext.ahk" { IWbemContext }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.Wmi
 */
export default struct IWbemConnectorLogin extends IUnknown {
    /**
     * The interface identifier for IWbemConnectorLogin
     * @type {Guid}
     */
    static IID := Guid("{d8ec9cb1-b135-4f10-8b1b-c7188bb0d186}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWbemConnectorLogin interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        ConnectorLogin : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWbemConnectorLogin.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {PWSTR} wszNetworkResource 
     * @param {PWSTR} wszPreferredLocale 
     * @param {Integer} lFlags 
     * @param {IWbemContext} pCtx 
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<Void>} 
     */
    ConnectorLogin(wszNetworkResource, wszPreferredLocale, lFlags, pCtx, riid) {
        wszNetworkResource := wszNetworkResource is String ? StrPtr(wszNetworkResource) : wszNetworkResource
        wszPreferredLocale := wszPreferredLocale is String ? StrPtr(wszPreferredLocale) : wszPreferredLocale

        result := ComCall(3, this, "ptr", wszNetworkResource, "ptr", wszPreferredLocale, "int", lFlags, "ptr", pCtx, Guid.Ptr, riid, "ptr*", &pInterface := 0, "HRESULT")
        return pInterface
    }

    Query(iid) {
        if (IWbemConnectorLogin.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.ConnectorLogin := CallbackCreate(GetMethod(implObj, "ConnectorLogin"), flags, 7)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.ConnectorLogin)
    }
}
