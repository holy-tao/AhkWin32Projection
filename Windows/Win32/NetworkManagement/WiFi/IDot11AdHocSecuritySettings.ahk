#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\DOT11_ADHOC_CIPHER_ALGORITHM.ahk" { DOT11_ADHOC_CIPHER_ALGORITHM }
#Import ".\DOT11_ADHOC_AUTH_ALGORITHM.ahk" { DOT11_ADHOC_AUTH_ALGORITHM }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Specifies the security settings for a wireless ad hoc network.
 * @see https://learn.microsoft.com/windows/win32/api/adhoc/nn-adhoc-idot11adhocsecuritysettings
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
export default struct IDot11AdHocSecuritySettings extends IUnknown {
    /**
     * The interface identifier for IDot11AdHocSecuritySettings
     * @type {Guid}
     */
    static IID := Guid("{8f10cc2e-cf0d-42a0-acbe-e2de7007384d}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDot11AdHocSecuritySettings interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetDot11AuthAlgorithm   : IntPtr
        GetDot11CipherAlgorithm : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDot11AdHocSecuritySettings.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets the authentication algorithm associated with the security settings.
     * @param {Pointer<DOT11_ADHOC_AUTH_ALGORITHM>} pAuth A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/adhoc/ne-adhoc-dot11_adhoc_auth_algorithm">DOT11_ADHOC_AUTH_ALGORITHM</a> value that specifies the authentication algorithm.
     * @returns {HRESULT} Possible return values include, but are not limited to, the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method completed successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method failed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The value pointed to by <i>pAuth</i> is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method could not allocate the memory required to perform this operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The pointer <i>pAuth</i> is invalid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/adhoc/nf-adhoc-idot11adhocsecuritysettings-getdot11authalgorithm
     */
    GetDot11AuthAlgorithm(pAuth) {
        pAuthMarshal := pAuth is VarRef ? "int*" : "ptr"

        result := ComCall(3, this, pAuthMarshal, pAuth, "HRESULT")
        return result
    }

    /**
     * Gets the cipher algorithm associated with the security settings.
     * @param {Pointer<DOT11_ADHOC_CIPHER_ALGORITHM>} pCipher A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/adhoc/ne-adhoc-dot11_adhoc_cipher_algorithm">DOT11_ADHOC_CIPHER_ALGORITHM</a> value that specifies the cipher algorithm.
     * @returns {HRESULT} Possible return values include, but are not limited to, the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method completed successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method failed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The value pointed to by <i>pCipher</i> is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method could not allocate the memory required to perform this operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The pointer <i>pCipher</i> is invalid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/adhoc/nf-adhoc-idot11adhocsecuritysettings-getdot11cipheralgorithm
     */
    GetDot11CipherAlgorithm(pCipher) {
        pCipherMarshal := pCipher is VarRef ? "int*" : "ptr"

        result := ComCall(4, this, pCipherMarshal, pCipher, "HRESULT")
        return result
    }

    Query(iid) {
        if (IDot11AdHocSecuritySettings.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetDot11AuthAlgorithm := CallbackCreate(GetMethod(implObj, "GetDot11AuthAlgorithm"), flags, 2)
        this.vtbl.GetDot11CipherAlgorithm := CallbackCreate(GetMethod(implObj, "GetDot11CipherAlgorithm"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetDot11AuthAlgorithm)
        CallbackFree(this.vtbl.GetDot11CipherAlgorithm)
    }
}
