#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IWbemServices.ahk" { IWbemServices }
#Import ".\IWbemContext.ahk" { IWbemContext }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.Wmi
 */
export default struct IWbemLevel1Login extends IUnknown {
    /**
     * The interface identifier for IWbemLevel1Login
     * @type {Guid}
     */
    static IID := Guid("{f309ad18-d86a-11d0-a075-00c04fb68820}")

    /**
     * The class identifier for WbemLevel1Login
     * @type {Guid}
     */
    static CLSID := Guid("{8bc3f05e-d86b-11d0-a075-00c04fb68820}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWbemLevel1Login interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        EstablishPosition : IntPtr
        RequestChallenge  : IntPtr
        WBEMLogin         : IntPtr
        NTLMLogin         : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWbemLevel1Login.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {PWSTR} wszLocaleList 
     * @param {Integer} dwNumLocales 
     * @returns {Integer} 
     */
    EstablishPosition(wszLocaleList, dwNumLocales) {
        wszLocaleList := wszLocaleList is String ? StrPtr(wszLocaleList) : wszLocaleList

        result := ComCall(3, this, "ptr", wszLocaleList, "uint", dwNumLocales, "uint*", &reserved := 0, "HRESULT")
        return reserved
    }

    /**
     * 
     * @param {PWSTR} wszNetworkResource 
     * @param {PWSTR} wszUser 
     * @returns {Integer} 
     */
    RequestChallenge(wszNetworkResource, wszUser) {
        wszNetworkResource := wszNetworkResource is String ? StrPtr(wszNetworkResource) : wszNetworkResource
        wszUser := wszUser is String ? StrPtr(wszUser) : wszUser

        result := ComCall(4, this, "ptr", wszNetworkResource, "ptr", wszUser, "char*", &Nonce := 0, "HRESULT")
        return Nonce
    }

    /**
     * 
     * @param {PWSTR} wszPreferredLocale 
     * @param {Pointer<Integer>} AccessToken 
     * @param {Integer} lFlags 
     * @param {IWbemContext} pCtx 
     * @returns {IWbemServices} 
     */
    WBEMLogin(wszPreferredLocale, AccessToken, lFlags, pCtx) {
        wszPreferredLocale := wszPreferredLocale is String ? StrPtr(wszPreferredLocale) : wszPreferredLocale

        AccessTokenMarshal := AccessToken is VarRef ? "char*" : "ptr"

        result := ComCall(5, this, "ptr", wszPreferredLocale, AccessTokenMarshal, AccessToken, "int", lFlags, "ptr", pCtx, "ptr*", &ppNamespace := 0, "HRESULT")
        return IWbemServices(ppNamespace)
    }

    /**
     * 
     * @param {PWSTR} wszNetworkResource 
     * @param {PWSTR} wszPreferredLocale 
     * @param {Integer} lFlags 
     * @param {IWbemContext} pCtx 
     * @returns {IWbemServices} 
     */
    NTLMLogin(wszNetworkResource, wszPreferredLocale, lFlags, pCtx) {
        wszNetworkResource := wszNetworkResource is String ? StrPtr(wszNetworkResource) : wszNetworkResource
        wszPreferredLocale := wszPreferredLocale is String ? StrPtr(wszPreferredLocale) : wszPreferredLocale

        result := ComCall(6, this, "ptr", wszNetworkResource, "ptr", wszPreferredLocale, "int", lFlags, "ptr", pCtx, "ptr*", &ppNamespace := 0, "HRESULT")
        return IWbemServices(ppNamespace)
    }

    Query(iid) {
        if (IWbemLevel1Login.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.EstablishPosition := CallbackCreate(GetMethod(implObj, "EstablishPosition"), flags, 4)
        this.vtbl.RequestChallenge := CallbackCreate(GetMethod(implObj, "RequestChallenge"), flags, 4)
        this.vtbl.WBEMLogin := CallbackCreate(GetMethod(implObj, "WBEMLogin"), flags, 6)
        this.vtbl.NTLMLogin := CallbackCreate(GetMethod(implObj, "NTLMLogin"), flags, 6)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.EstablishPosition)
        CallbackFree(this.vtbl.RequestChallenge)
        CallbackFree(this.vtbl.WBEMLogin)
        CallbackFree(this.vtbl.NTLMLogin)
    }
}
