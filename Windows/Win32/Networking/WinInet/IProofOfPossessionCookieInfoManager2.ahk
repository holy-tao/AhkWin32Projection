#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\WinRT\IInspectable.ahk" { IInspectable }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\ProofOfPossessionCookieInfo.ahk" { ProofOfPossessionCookieInfo }

/**
 * Supports the creation of proof-of-possession cookies, for a WebAccount.
 * @see https://learn.microsoft.com/windows/win32/api/proofofpossessioncookieinfo/nn-proofofpossessioncookieinfo-iproofofpossessioncookieinfomanager2
 * @namespace Windows.Win32.Networking.WinInet
 */
export default struct IProofOfPossessionCookieInfoManager2 extends IUnknown {
    /**
     * The interface identifier for IProofOfPossessionCookieInfoManager2
     * @type {Guid}
     */
    static IID := Guid("{15e41407-b42f-4ae7-9966-34a087b2d713}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IProofOfPossessionCookieInfoManager2 interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetCookieInfoWithUriForAccount : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IProofOfPossessionCookieInfoManager2.Vtbl()
        }
        super.__New(implObj, flags)
    }

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

    Query(iid) {
        if (IProofOfPossessionCookieInfoManager2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetCookieInfoWithUriForAccount := CallbackCreate(GetMethod(implObj, "GetCookieInfoWithUriForAccount"), flags, 5)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetCookieInfoWithUriForAccount)
    }
}
