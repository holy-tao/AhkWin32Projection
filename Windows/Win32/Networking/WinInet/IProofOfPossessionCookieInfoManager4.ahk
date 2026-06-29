#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\WinRT\IInspectable.ahk" { IInspectable }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\ProofOfPossessionCookieInfo.ahk" { ProofOfPossessionCookieInfo }

/**
 * Supports the creation of proof-of-possession cookies, for a WebAccount and a client id.
 * @see https://learn.microsoft.com/windows/win32/WinInet/proofofpossessioncookieinfo/nn-proofofpossessioncookieinfo-iproofofpossessioncookieinfomanager4
 * @namespace Windows.Win32.Networking.WinInet
 */
export default struct IProofOfPossessionCookieInfoManager4 extends IUnknown {
    /**
     * The interface identifier for IProofOfPossessionCookieInfoManager4
     * @type {Guid}
     */
    static IID := Guid("{3b74c75b-6e3f-494e-95ec-13174e12a89f}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IProofOfPossessionCookieInfoManager4 interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetCookieInfoForUriWithUserAgentId           : IntPtr
        GetCookieInfoWithUriAndUserAgentIdForAccount : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IProofOfPossessionCookieInfoManager4.Vtbl()
        }
        super.__New(implObj, flags)
    }

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

    Query(iid) {
        if (IProofOfPossessionCookieInfoManager4.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetCookieInfoForUriWithUserAgentId := CallbackCreate(GetMethod(implObj, "GetCookieInfoForUriWithUserAgentId"), flags, 5)
        this.vtbl.GetCookieInfoWithUriAndUserAgentIdForAccount := CallbackCreate(GetMethod(implObj, "GetCookieInfoWithUriAndUserAgentIdForAccount"), flags, 6)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetCookieInfoForUriWithUserAgentId)
        CallbackFree(this.vtbl.GetCookieInfoWithUriAndUserAgentIdForAccount)
    }
}
