#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\IDTFilter.ahk" { IDTFilter }
#Import ".\ProtType.ahk" { ProtType }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * The IDTFilter2 interface extends the IDTFilter interface and is exposed by the Decrypter/Detagger filter.
 * @remarks
 * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IDTFilter2)</c>.
 * @see https://learn.microsoft.com/windows/win32/api/encdec/nn-encdec-idtfilter2
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct IDTFilter2 extends IDTFilter {
    /**
     * The interface identifier for IDTFilter2
     * @type {Guid}
     */
    static IID := Guid("{c4c4c4b4-0049-4e2b-98fb-9537f6ce516d}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDTFilter2 interfaces
    */
    struct Vtbl extends IDTFilter.Vtbl {
        get_ChallengeUrl      : IntPtr
        GetCurrLicenseExpDate : IntPtr
        GetLastErrorCode      : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDTFilter2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {BSTR} 
     */
    ChallengeUrl {
        get => this.get_ChallengeUrl()
    }

    /**
     * Not implemented in this release.
     * @returns {BSTR} Reserved.
     * @see https://learn.microsoft.com/windows/win32/api/encdec/nf-encdec-idtfilter2-get_challengeurl
     */
    get_ChallengeUrl() {
        pbstrChallengeUrl := BSTR.Owned()
        result := ComCall(11, this, BSTR.Ptr, pbstrChallengeUrl, "HRESULT")
        return pbstrChallengeUrl
    }

    /**
     * Not implemented in this release.
     * @param {Pointer<ProtType>} _protType Reserved.
     * @returns {Integer} Reserved.
     * @see https://learn.microsoft.com/windows/win32/api/encdec/nf-encdec-idtfilter2-getcurrlicenseexpdate
     */
    GetCurrLicenseExpDate(_protType) {
        _protTypeMarshal := _protType is VarRef ? "int*" : "ptr"

        result := ComCall(12, this, _protTypeMarshal, _protType, "int*", &lpDateTime := 0, "HRESULT")
        return lpDateTime
    }

    /**
     * The GetLastErrorCode method returns the most recent error code from the Decrypter/Detagger filter.
     * @returns {HRESULT} Returns an <b>HRESULT</b>. Possible values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NS_E_DRM_APPCERT_REVOKED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A problem has occurred in the digital rights management (DRM) component.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NS_E_DRM_CERTIFICATE_REVOKED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The client's certificate has been revoked.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No DRM errors have occurred.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/encdec/nf-encdec-idtfilter2-getlasterrorcode
     */
    GetLastErrorCode() {
        result := ComCall(13, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IDTFilter2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_ChallengeUrl := CallbackCreate(GetMethod(implObj, "get_ChallengeUrl"), flags, 2)
        this.vtbl.GetCurrLicenseExpDate := CallbackCreate(GetMethod(implObj, "GetCurrLicenseExpDate"), flags, 3)
        this.vtbl.GetLastErrorCode := CallbackCreate(GetMethod(implObj, "GetLastErrorCode"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_ChallengeUrl)
        CallbackFree(this.vtbl.GetCurrLicenseExpDate)
        CallbackFree(this.vtbl.GetLastErrorCode)
    }
}
