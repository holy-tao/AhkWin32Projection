#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\ProofOfPossessionCookieInfo.ahk" { ProofOfPossessionCookieInfo }

/**
 * @namespace Windows.Win32.Networking.WinInet
 */
export default struct IProofOfPossessionCookieInfoManager3 extends IUnknown {
    /**
     * The interface identifier for IProofOfPossessionCookieInfoManager3
     * @type {Guid}
     */
    static IID := Guid("{c8891744-32bd-4a77-b92c-0e79a2823b96}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IProofOfPossessionCookieInfoManager3 interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetCookieInfoForUriWithOptions : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IProofOfPossessionCookieInfoManager3.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {PWSTR} uri 
     * @param {Integer} options 
     * @param {Pointer<Integer>} cookieInfoCount 
     * @param {Pointer<Pointer<ProofOfPossessionCookieInfo>>} cookieInfo 
     * @returns {HRESULT} 
     */
    GetCookieInfoForUriWithOptions(uri, options, cookieInfoCount, cookieInfo) {
        uri := uri is String ? StrPtr(uri) : uri

        cookieInfoCountMarshal := cookieInfoCount is VarRef ? "uint*" : "ptr"
        cookieInfoMarshal := cookieInfo is VarRef ? "ptr*" : "ptr"

        result := ComCall(3, this, "ptr", uri, "uint", options, cookieInfoCountMarshal, cookieInfoCount, cookieInfoMarshal, cookieInfo, "HRESULT")
        return result
    }

    Query(iid) {
        if (IProofOfPossessionCookieInfoManager3.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetCookieInfoForUriWithOptions := CallbackCreate(GetMethod(implObj, "GetCookieInfoForUriWithOptions"), flags, 5)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetCookieInfoForUriWithOptions)
    }
}
