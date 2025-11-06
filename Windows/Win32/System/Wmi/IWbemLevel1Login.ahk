#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IWbemServices.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Wmi
 * @version v4.0.30319
 */
class IWbemLevel1Login extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWbemLevel1Login
     * @type {Guid}
     */
    static IID => Guid("{f309ad18-d86a-11d0-a075-00c04fb68820}")

    /**
     * The class identifier for WbemLevel1Login
     * @type {Guid}
     */
    static CLSID => Guid("{8bc3f05e-d86b-11d0-a075-00c04fb68820}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["EstablishPosition", "RequestChallenge", "WBEMLogin", "NTLMLogin"]

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
}
