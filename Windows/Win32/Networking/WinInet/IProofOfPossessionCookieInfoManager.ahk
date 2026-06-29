#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\ProofOfPossessionCookieInfo.ahk" { ProofOfPossessionCookieInfo }

/**
 * Supports the creation of proof of possession cookies.
 * @see https://learn.microsoft.com/windows/win32/api/proofofpossessioncookieinfo/nn-proofofpossessioncookieinfo-iproofofpossessioncookieinfomanager
 * @namespace Windows.Win32.Networking.WinInet
 */
export default struct IProofOfPossessionCookieInfoManager extends IUnknown {
    /**
     * The interface identifier for IProofOfPossessionCookieInfoManager
     * @type {Guid}
     */
    static IID := Guid("{cdaece56-4edf-43df-b113-88e4556fa1bb}")

    /**
     * The class identifier for ProofOfPossessionCookieInfoManager
     * @type {Guid}
     */
    static CLSID := Guid("{a9927f85-a304-4390-8b23-a75f1c668600}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IProofOfPossessionCookieInfoManager interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetCookieInfoForUri : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IProofOfPossessionCookieInfoManager.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets cookie information for the supplied URI to be used for proof of possession cookies.
     * @param {PWSTR} uri The URI to retrieve cookie information for. The URI is case-sensitive.
     * @param {Pointer<Integer>} cookieInfoCount The number of cookies found. `*cookieInfoCount` contains the number of elements in  *cookieInfo*.
     * @param {Pointer<Pointer<ProofOfPossessionCookieInfo>>} cookieInfo A returned array of cookie information objects. You should free the returned array by using [FreeProofOfPossessionCookieInfoArray](./nf-proofofpossessioncookieinfo-freeproofofpossessioncookieinfoarray.md).
     * @returns {HRESULT} If this method succeeds, it returns **S_OK**. Otherwise, it returns an **HRESULT** error code.
     * @see https://learn.microsoft.com/windows/win32/api/proofofpossessioncookieinfo/nf-proofofpossessioncookieinfo-iproofofpossessioncookieinfomanager-getcookieinfoforuri
     */
    GetCookieInfoForUri(uri, cookieInfoCount, cookieInfo) {
        uri := uri is String ? StrPtr(uri) : uri

        cookieInfoCountMarshal := cookieInfoCount is VarRef ? "uint*" : "ptr"
        cookieInfoMarshal := cookieInfo is VarRef ? "ptr*" : "ptr"

        result := ComCall(3, this, "ptr", uri, cookieInfoCountMarshal, cookieInfoCount, cookieInfoMarshal, cookieInfo, "HRESULT")
        return result
    }

    Query(iid) {
        if (IProofOfPossessionCookieInfoManager.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetCookieInfoForUri := CallbackCreate(GetMethod(implObj, "GetCookieInfoForUri"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetCookieInfoForUri)
    }
}
