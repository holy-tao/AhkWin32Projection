#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\IXblIdpAuthTokenResult.ahk
#Include ..\System\Com\IUnknown.ahk

/**
 * Reserved for Microsoft use.
 * @see https://docs.microsoft.com/windows/win32/api//xblidpauthmanager/nn-xblidpauthmanager-ixblidpauthmanager
 * @namespace Windows.Win32.Gaming
 * @version v4.0.30319
 */
class IXblIdpAuthManager extends IUnknown{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetGamerAccount", "GetGamerAccount", "SetAppViewInitialized", "GetEnvironment", "GetSandbox", "GetTokenAndSignatureWithTokenResult"]

    /**
     * 
     * @param {PWSTR} msaAccountId 
     * @param {PWSTR} xuid 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xblidpauthmanager/nf-xblidpauthmanager-ixblidpauthmanager-setgameraccount
     */
    SetGamerAccount(msaAccountId, xuid) {
        msaAccountId := msaAccountId is String ? StrPtr(msaAccountId) : msaAccountId
        xuid := xuid is String ? StrPtr(xuid) : xuid

        result := ComCall(3, this, "ptr", msaAccountId, "ptr", xuid, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} msaAccountId 
     * @param {Pointer<PWSTR>} xuid 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xblidpauthmanager/nf-xblidpauthmanager-ixblidpauthmanager-getgameraccount
     */
    GetGamerAccount(msaAccountId, xuid) {
        msaAccountIdMarshal := msaAccountId is VarRef ? "ptr*" : "ptr"
        xuidMarshal := xuid is VarRef ? "ptr*" : "ptr"

        result := ComCall(4, this, msaAccountIdMarshal, msaAccountId, xuidMarshal, xuid, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} appSid 
     * @param {PWSTR} msaAccountId 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xblidpauthmanager/nf-xblidpauthmanager-ixblidpauthmanager-setappviewinitialized
     */
    SetAppViewInitialized(appSid, msaAccountId) {
        appSid := appSid is String ? StrPtr(appSid) : appSid
        msaAccountId := msaAccountId is String ? StrPtr(msaAccountId) : msaAccountId

        result := ComCall(5, this, "ptr", appSid, "ptr", msaAccountId, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {PWSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/xblidpauthmanager/nf-xblidpauthmanager-ixblidpauthmanager-getenvironment
     */
    GetEnvironment() {
        result := ComCall(6, this, "ptr*", &environment := 0, "HRESULT")
        return environment
    }

    /**
     * 
     * @returns {PWSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/xblidpauthmanager/nf-xblidpauthmanager-ixblidpauthmanager-getsandbox
     */
    GetSandbox() {
        result := ComCall(7, this, "ptr*", &sandbox := 0, "HRESULT")
        return sandbox
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
     * @param {Pointer<Integer>} body 
     * @param {Integer} bodySize 
     * @param {BOOL} forceRefresh 
     * @returns {IXblIdpAuthTokenResult} 
     * @see https://learn.microsoft.com/windows/win32/api/xblidpauthmanager/nf-xblidpauthmanager-ixblidpauthmanager-gettokenandsignaturewithtokenresult
     */
    GetTokenAndSignatureWithTokenResult(msaAccountId, appSid, msaTarget, msaPolicy, httpMethod, uri, headers, body, bodySize, forceRefresh) {
        msaAccountId := msaAccountId is String ? StrPtr(msaAccountId) : msaAccountId
        appSid := appSid is String ? StrPtr(appSid) : appSid
        msaTarget := msaTarget is String ? StrPtr(msaTarget) : msaTarget
        msaPolicy := msaPolicy is String ? StrPtr(msaPolicy) : msaPolicy
        httpMethod := httpMethod is String ? StrPtr(httpMethod) : httpMethod
        uri := uri is String ? StrPtr(uri) : uri
        headers := headers is String ? StrPtr(headers) : headers

        bodyMarshal := body is VarRef ? "char*" : "ptr"

        result := ComCall(8, this, "ptr", msaAccountId, "ptr", appSid, "ptr", msaTarget, "ptr", msaPolicy, "ptr", httpMethod, "ptr", uri, "ptr", headers, bodyMarshal, body, "uint", bodySize, "int", forceRefresh, "ptr*", &result := 0, "HRESULT")
        return IXblIdpAuthTokenResult(result)
    }
}
