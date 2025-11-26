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
     * Reserved for Microsoft use.
     * @param {PWSTR} msaAccountId Type: <b>__RPC__in_opt_string</b>
     * @param {PWSTR} xuid Type: <b>__RPC__in_opt_string</b>
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//xblidpauthmanager/nf-xblidpauthmanager-ixblidpauthmanager-setgameraccount
     */
    SetGamerAccount(msaAccountId, xuid) {
        msaAccountId := msaAccountId is String ? StrPtr(msaAccountId) : msaAccountId
        xuid := xuid is String ? StrPtr(xuid) : xuid

        result := ComCall(3, this, "ptr", msaAccountId, "ptr", xuid, "HRESULT")
        return result
    }

    /**
     * Reserved for Microsoft use.
     * @param {Pointer<PWSTR>} msaAccountId Type: <b>__RPC__deref_out_opt_string*</b>
     * @param {Pointer<PWSTR>} xuid Type: <b>__RPC__deref_out_opt_string*</b>
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//xblidpauthmanager/nf-xblidpauthmanager-ixblidpauthmanager-getgameraccount
     */
    GetGamerAccount(msaAccountId, xuid) {
        msaAccountIdMarshal := msaAccountId is VarRef ? "ptr*" : "ptr"
        xuidMarshal := xuid is VarRef ? "ptr*" : "ptr"

        result := ComCall(4, this, msaAccountIdMarshal, msaAccountId, xuidMarshal, xuid, "HRESULT")
        return result
    }

    /**
     * Reserved for Microsoft use.
     * @param {PWSTR} appSid Type: <b>__RPC__in_string</b>
     * @param {PWSTR} msaAccountId Type: <b>__RPC__in_string</b>
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//xblidpauthmanager/nf-xblidpauthmanager-ixblidpauthmanager-setappviewinitialized
     */
    SetAppViewInitialized(appSid, msaAccountId) {
        appSid := appSid is String ? StrPtr(appSid) : appSid
        msaAccountId := msaAccountId is String ? StrPtr(msaAccountId) : msaAccountId

        result := ComCall(5, this, "ptr", appSid, "ptr", msaAccountId, "HRESULT")
        return result
    }

    /**
     * Reserved for Microsoft use.
     * @returns {PWSTR} Type: <b>__RPC__deref_out_opt_string*</b>
     * @see https://docs.microsoft.com/windows/win32/api//xblidpauthmanager/nf-xblidpauthmanager-ixblidpauthmanager-getenvironment
     */
    GetEnvironment() {
        result := ComCall(6, this, "ptr*", &environment := 0, "HRESULT")
        return environment
    }

    /**
     * Reserved for Microsoft use.
     * @returns {PWSTR} Type: <b>__RPC__deref_out_opt_string*</b>
     * @see https://docs.microsoft.com/windows/win32/api//xblidpauthmanager/nf-xblidpauthmanager-ixblidpauthmanager-getsandbox
     */
    GetSandbox() {
        result := ComCall(7, this, "ptr*", &sandbox := 0, "HRESULT")
        return sandbox
    }

    /**
     * Reserved for Microsoft use.
     * @param {PWSTR} msaAccountId Type: <b>__RPC__in_opt_string</b>
     * @param {PWSTR} appSid Type: <b>__RPC__in_string</b>
     * @param {PWSTR} msaTarget Type: <b>__RPC__in_string</b>
     * @param {PWSTR} msaPolicy Type: <b>__RPC__in_string</b>
     * @param {PWSTR} httpMethod Type: <b>__RPC__in_string</b>
     * @param {PWSTR} uri Type: <b>__RPC__in_string</b>
     * @param {PWSTR} headers Type: <b>__RPC__in_opt_string</b>
     * @param {Pointer<Integer>} body Type: <b>BYTE*</b>
     * @param {Integer} bodySize Type: <b>__RPC__in_ecount_full_opt</b>
     * @param {BOOL} forceRefresh Type: <b>BOOL</b>
     * @returns {IXblIdpAuthTokenResult} Type: <b>IXblIdpAuthTokenResult**</b>
     * @see https://docs.microsoft.com/windows/win32/api//xblidpauthmanager/nf-xblidpauthmanager-ixblidpauthmanager-gettokenandsignaturewithtokenresult
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
