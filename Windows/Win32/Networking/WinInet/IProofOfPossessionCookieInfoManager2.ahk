#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Supports the creation of proof-of-possession cookies, for a WebAccount.
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api/proofofpossessioncookieinfo/nn-proofofpossessioncookieinfo-iproofofpossessioncookieinfomanager2
 * @namespace Windows.Win32.Networking.WinInet
 * @version v4.0.30319
 */
class IProofOfPossessionCookieInfoManager2 extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IProofOfPossessionCookieInfoManager2
     * @type {Guid}
     */
    static IID => Guid("{15e41407-b42f-4ae7-9966-34a087b2d713}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetCookieInfoWithUriForAccount"]

    /**
     * Retrieves cookie information corresponding to the supplied WebAccount and URI.
     * @param {IInspectable} webAccount A [WebAccount](/uwp/api/windows.security.credentials.webaccount) as **IInspectable**. You can obtain a **WebAccount** object by calling methods on [WebAuthenticationCoreManager](/uwp/api/windows.security.authentication.web.core.webauthenticationcoremanager) suchas **FindAccountAsync** and **FindAllAccountsAsync**.
     * @param {PWSTR} uri The URI to retrieve cookie information for. The URI is case-sensitive.
     * @param {Pointer<Integer>} cookieInfoCount The number of cookies found. `*cookieInfoCount` contains the number of elements in  *cookieInfo*.
     * @param {Pointer<Pointer<ProofOfPossessionCookieInfo>>} cookieInfo A returned array of cookie information objects. You should free the returned array by using [FreeProofOfPossessionCookieInfoArray](./nf-proofofpossessioncookieinfo-freeproofofpossessioncookieinfoarray.md).
     * @returns {HRESULT} If this method succeeds, it returns **S_OK**. Otherwise, it returns an **HRESULT** error code.
     * @see https://learn.microsoft.com/windows/win32/api/proofofpossessioncookieinfo/nf-proofofpossessioncookieinfo-iproofofpossessioncookieinfomanager2-getcookieinfowithuriforaccount
     */
    GetCookieInfoWithUriForAccount(webAccount, uri, cookieInfoCount, cookieInfo) {
        uri := uri is String ? StrPtr(uri) : uri

        cookieInfoCountMarshal := cookieInfoCount is VarRef ? "uint*" : "ptr"
        cookieInfoMarshal := cookieInfo is VarRef ? "ptr*" : "ptr"

        result := ComCall(3, this, "ptr", webAccount, "ptr", uri, cookieInfoCountMarshal, cookieInfoCount, cookieInfoMarshal, cookieInfo, "HRESULT")
        return result
    }
}
