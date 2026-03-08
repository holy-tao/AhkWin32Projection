#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Supports the creation of proof-of-possession cookies, for a WebAccount and a client id.
 * @see https://learn.microsoft.com/windows/win32/WinInet/proofofpossessioncookieinfo/nn-proofofpossessioncookieinfo-iproofofpossessioncookieinfomanager4
 * @namespace Windows.Win32.Networking.WinInet
 * @version v4.0.30319
 */
class IProofOfPossessionCookieInfoManager4 extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IProofOfPossessionCookieInfoManager4
     * @type {Guid}
     */
    static IID => Guid("{3b74c75b-6e3f-494e-95ec-13174e12a89f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetCookieInfoForUriWithUserAgentId", "GetCookieInfoWithUriAndUserAgentIdForAccount"]

    /**
     * Retrieves cookie information for the supplied URI, with a user id.
     * @param {PWSTR} uri The URI to retrieve cookie information for. The URI is case-sensitive.
     * @param {PWSTR} uaClientId A client id, which will be added to the returned cookie.
     * @param {Pointer<Integer>} cookieInfoCount The number of cookies found. `*cookieInfoCount` contains the number of elements in *cookieInfo*.
     * @param {Pointer<Pointer<ProofOfPossessionCookieInfo>>} cookieInfo A returned array of cookie information objects. You should free the returned array by using [FreeProofOfPossessionCookieInfoArray](/windows/win32/api/proofofpossessioncookieinfo/nf-proofofpossessioncookieinfo-freeproofofpossessioncookieinfoarray).
     * @returns {HRESULT} If this method succeeds, it returns **S_OK**. Otherwise, it returns an **HRESULT** error code.
     * @see https://learn.microsoft.com/windows/win32/WinInet/proofofpossessioncookieinfo/nf-proofofpossessioncookieinfo-getcookieinfoforuriwithuseragentid
     */
    GetCookieInfoForUriWithUserAgentId(uri, uaClientId, cookieInfoCount, cookieInfo) {
        uri := uri is String ? StrPtr(uri) : uri
        uaClientId := uaClientId is String ? StrPtr(uaClientId) : uaClientId

        cookieInfoCountMarshal := cookieInfoCount is VarRef ? "uint*" : "ptr"
        cookieInfoMarshal := cookieInfo is VarRef ? "ptr*" : "ptr"

        result := ComCall(3, this, "ptr", uri, "ptr", uaClientId, cookieInfoCountMarshal, cookieInfoCount, cookieInfoMarshal, cookieInfo, "HRESULT")
        return result
    }

    /**
     * Retrieves cookie information for the supplied WebAccount and URI, with a user id.
     * @param {IInspectable} webAccount A [WebAccount](/uwp/api/windows.security.credentials.webaccount) as **IInspectable**. You can obtain a **WebAccount** object by calling methods on [WebAuthenticationCoreManager](/uwp/api/windows.security.authentication.web.core.webauthenticationcoremanager) such as **FindAccountAsync** and **FindAllAccountsAsync**.
     * @param {PWSTR} uri The URI to retrieve cookie information for. The URI is case-sensitive.
     * @param {PWSTR} uaClientId A client id, which will be added to the returned cookie.
     * @param {Pointer<Integer>} cookieInfoCount The number of cookies found. `*cookieInfoCount` contains the number of elements in *cookieInfo*.
     * @param {Pointer<Pointer<ProofOfPossessionCookieInfo>>} cookieInfo A returned array of cookie information objects. You should free the returned array by using [FreeProofOfPossessionCookieInfoArray](/windows/win32/api/proofofpossessioncookieinfo/nf-proofofpossessioncookieinfo-freeproofofpossessioncookieinfoarray).
     * @returns {HRESULT} If this method succeeds, it returns **S_OK**. Otherwise, it returns an **HRESULT** error code.
     * @see https://learn.microsoft.com/windows/win32/WinInet/proofofpossessioncookieinfo/nf-proofofpossessioncookieinfo-getcookieinfowithurianduseragentidforaccount
     */
    GetCookieInfoWithUriAndUserAgentIdForAccount(webAccount, uri, uaClientId, cookieInfoCount, cookieInfo) {
        uri := uri is String ? StrPtr(uri) : uri
        uaClientId := uaClientId is String ? StrPtr(uaClientId) : uaClientId

        cookieInfoCountMarshal := cookieInfoCount is VarRef ? "uint*" : "ptr"
        cookieInfoMarshal := cookieInfo is VarRef ? "ptr*" : "ptr"

        result := ComCall(4, this, "ptr", webAccount, "ptr", uri, "ptr", uaClientId, cookieInfoCountMarshal, cookieInfoCount, cookieInfoMarshal, cookieInfo, "HRESULT")
        return result
    }
}
