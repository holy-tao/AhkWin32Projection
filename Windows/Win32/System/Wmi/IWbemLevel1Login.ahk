#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Wmi
 * @version v4.0.30319
 */
class IWbemLevel1Login extends IUnknown{
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
     * 
     * @param {PWSTR} wszLocaleList 
     * @param {Integer} dwNumLocales 
     * @param {Pointer<UInt32>} reserved 
     * @returns {HRESULT} 
     */
    EstablishPosition(wszLocaleList, dwNumLocales, reserved) {
        wszLocaleList := wszLocaleList is String ? StrPtr(wszLocaleList) : wszLocaleList

        result := ComCall(3, this, "ptr", wszLocaleList, "uint", dwNumLocales, "uint*", reserved, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} wszNetworkResource 
     * @param {PWSTR} wszUser 
     * @param {Pointer<Byte>} Nonce 
     * @returns {HRESULT} 
     */
    RequestChallenge(wszNetworkResource, wszUser, Nonce) {
        wszNetworkResource := wszNetworkResource is String ? StrPtr(wszNetworkResource) : wszNetworkResource
        wszUser := wszUser is String ? StrPtr(wszUser) : wszUser

        result := ComCall(4, this, "ptr", wszNetworkResource, "ptr", wszUser, "char*", Nonce, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} wszPreferredLocale 
     * @param {Pointer<Byte>} AccessToken 
     * @param {Integer} lFlags 
     * @param {Pointer<IWbemContext>} pCtx 
     * @param {Pointer<IWbemServices>} ppNamespace 
     * @returns {HRESULT} 
     */
    WBEMLogin(wszPreferredLocale, AccessToken, lFlags, pCtx, ppNamespace) {
        wszPreferredLocale := wszPreferredLocale is String ? StrPtr(wszPreferredLocale) : wszPreferredLocale

        result := ComCall(5, this, "ptr", wszPreferredLocale, "char*", AccessToken, "int", lFlags, "ptr", pCtx, "ptr", ppNamespace, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} wszNetworkResource 
     * @param {PWSTR} wszPreferredLocale 
     * @param {Integer} lFlags 
     * @param {Pointer<IWbemContext>} pCtx 
     * @param {Pointer<IWbemServices>} ppNamespace 
     * @returns {HRESULT} 
     */
    NTLMLogin(wszNetworkResource, wszPreferredLocale, lFlags, pCtx, ppNamespace) {
        wszNetworkResource := wszNetworkResource is String ? StrPtr(wszNetworkResource) : wszNetworkResource
        wszPreferredLocale := wszPreferredLocale is String ? StrPtr(wszPreferredLocale) : wszPreferredLocale

        result := ComCall(6, this, "ptr", wszNetworkResource, "ptr", wszPreferredLocale, "int", lFlags, "ptr", pCtx, "ptr", ppNamespace, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
