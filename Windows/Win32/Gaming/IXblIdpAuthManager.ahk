#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\System\Com\IUnknown.ahk

/**
 * Reserved for Microsoft use.
 * @see https://docs.microsoft.com/windows/win32/api//xblidpauthmanager/nn-xblidpauthmanager-ixblidpauthmanager
 * @namespace Windows.Win32.Gaming
 * @version v4.0.30319
 */
class IXblIdpAuthManager extends IUnknown{
    /**
     * The interface identifier for IXblIdpAuthManager
     * @type {Guid}
     */
    static IID => Guid("{eb5ddb08-8bbf-449b-ac21-b02ddeb3b136}")

    /**
     * The class identifier for XblIdpAuthManager
     * @type {Guid}
     */
    static CLSID => Guid("{ce23534b-56d8-4978-86a2-7ee570640468}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {PWSTR} msaAccountId 
     * @param {PWSTR} xuid 
     * @returns {HRESULT} 
     */
    SetGamerAccount(msaAccountId, xuid) {
        msaAccountId := msaAccountId is String ? StrPtr(msaAccountId) : msaAccountId
        xuid := xuid is String ? StrPtr(xuid) : xuid

        result := ComCall(3, this, "ptr", msaAccountId, "ptr", xuid, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} msaAccountId 
     * @param {Pointer<PWSTR>} xuid 
     * @returns {HRESULT} 
     */
    GetGamerAccount(msaAccountId, xuid) {
        result := ComCall(4, this, "ptr", msaAccountId, "ptr", xuid, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} appSid 
     * @param {PWSTR} msaAccountId 
     * @returns {HRESULT} 
     */
    SetAppViewInitialized(appSid, msaAccountId) {
        appSid := appSid is String ? StrPtr(appSid) : appSid
        msaAccountId := msaAccountId is String ? StrPtr(msaAccountId) : msaAccountId

        result := ComCall(5, this, "ptr", appSid, "ptr", msaAccountId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} environment 
     * @returns {HRESULT} 
     */
    GetEnvironment(environment) {
        result := ComCall(6, this, "ptr", environment, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} sandbox 
     * @returns {HRESULT} 
     */
    GetSandbox(sandbox) {
        result := ComCall(7, this, "ptr", sandbox, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} msaAccountId 
     * @param {PWSTR} appSid 
     * @param {PWSTR} msaTarget 
     * @param {PWSTR} msaPolicy 
     * @param {PWSTR} httpMethod 
     * @param {PWSTR} uri 
     * @param {PWSTR} headers 
     * @param {Pointer<Byte>} body 
     * @param {Integer} bodySize 
     * @param {BOOL} forceRefresh 
     * @param {Pointer<IXblIdpAuthTokenResult>} result 
     * @returns {HRESULT} 
     */
    GetTokenAndSignatureWithTokenResult(msaAccountId, appSid, msaTarget, msaPolicy, httpMethod, uri, headers, body, bodySize, forceRefresh, result) {
        msaAccountId := msaAccountId is String ? StrPtr(msaAccountId) : msaAccountId
        appSid := appSid is String ? StrPtr(appSid) : appSid
        msaTarget := msaTarget is String ? StrPtr(msaTarget) : msaTarget
        msaPolicy := msaPolicy is String ? StrPtr(msaPolicy) : msaPolicy
        httpMethod := httpMethod is String ? StrPtr(httpMethod) : httpMethod
        uri := uri is String ? StrPtr(uri) : uri
        headers := headers is String ? StrPtr(headers) : headers

        result := ComCall(8, this, "ptr", msaAccountId, "ptr", appSid, "ptr", msaTarget, "ptr", msaPolicy, "ptr", httpMethod, "ptr", uri, "ptr", headers, "char*", body, "uint", bodySize, "int", forceRefresh, "ptr", result, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
