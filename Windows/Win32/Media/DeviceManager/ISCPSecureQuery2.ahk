#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\ISCPSecureQuery.ahk" { ISCPSecureQuery }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IMDSPStorageGlobals.ahk" { IMDSPStorageGlobals }
#Import ".\ISCPSecureExchange.ahk" { ISCPSecureExchange }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The ISCPSecureQuery2 interface extends ISCPSecureQuery through functionality that determines whether the secure content provider is responsible for the content, and if so, providing a URL for updating revoked components and determining which components have been revoked.
 * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nn-mswmdm-iscpsecurequery2
 * @namespace Windows.Win32.Media.DeviceManager
 */
export default struct ISCPSecureQuery2 extends ISCPSecureQuery {
    /**
     * The interface identifier for ISCPSecureQuery2
     * @type {Guid}
     */
    static IID := Guid("{ebe17e25-4fd7-4632-af46-6d93d4fcc72e}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISCPSecureQuery2 interfaces
    */
    struct Vtbl extends ISCPSecureQuery.Vtbl {
        MakeDecision2 : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISCPSecureQuery2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The MakeDecision2 method determines whether the secure content provider is responsible for the content by examining data that Windows Media Device Manager passes to this method.
     * @param {Integer} fuFlags Flags describing the data offered to the secure content provider for making decisions. This parameter must be included in the input message authentication code. One or more of the following flags can be combined using a bitwise <b>OR</b>.
     * 
     * <table>
     * <tr>
     * <th>Flag
     *                 </th>
     * <th>Description
     *                 </th>
     * </tr>
     * <tr>
     * <td>WMDM_SCP_DECIDE_DATA</td>
     * <td>The <i>pData</i> parameter points to the data to be examined.</td>
     * </tr>
     * <tr>
     * <td>WMDM_MODE_TRANSFER_PROTECTED</td>
     * <td>The output object data from the <a href="https://docs.microsoft.com/windows/desktop/api/mswmdm/nn-mswmdm-iscpsecureexchange">ISCPSecureExchange</a> interface must be protected. If Windows Media Device Manager sets neither or both mode flags, Windows Media Digital Rights Manager decides whether the output object data from the <b>ISCPSecureExchange</b> interface must be protected or unprotected.</td>
     * </tr>
     * <tr>
     * <td>WMDM_MODE_TRANSFER_UNPROTECTED</td>
     * <td>The output object data from the <b>ISCPSecureExchange</b> interface must be unprotected. If Windows Media Device Manager sets neither or both mode flags, Windows Media Digital Rights Manager decides whether the output object data from the <b>ISCPSecureExchange</b> interface must be protected or unprotected.</td>
     * </tr>
     * </table>
     * @param {Pointer<Integer>} pData Pointer to a data object containing the data to be examined. This parameter must be included in the input message authentication code and must be encrypted.
     * @param {Integer} dwSize <b>DWORD</b> containing the size of the file data.
     * @param {Integer} dwAppSec <b>DWORD</b> that contains the length, in bytes, of the <b>dwAppSec</b> member of the <a href="https://docs.microsoft.com/windows/desktop/WMDM/wmdmrights">WMDMRIGHTS</a> structure of the service provider and secure content provider to be examined. This parameter must be included in the input message authentication code.
     * @param {Pointer<Integer>} pbSPSessionKey Pointer to an array of bytes containing the session key for securing communication with the service provider to which <i>pStgGlobals</i> points. This parameter must be included in the input message authentication code and must be encrypted.
     * @param {Integer} dwSessionKeyLen <b>DWORD</b> containing the session key length.
     * @param {IMDSPStorageGlobals} pStorageGlobals Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mswmdm/nn-mswmdm-iwmdmstorageglobals">IWMDMStorageGlobals</a> interface on the root storage of the media or device to or from which the file is being transferred. This parameter must be included in the input message authentication code.
     * @param {Pointer<Integer>} pAppCertApp Pointer to an application certificate of the application object.
     * @param {Integer} dwAppCertAppLen <b>DWORD</b> containing the length, in bytes, of the application certificate.
     * @param {Pointer<Integer>} pAppCertSP Pointer to the application certificate of the service provider object.
     * @param {Integer} dwAppCertSPLen <b>DWORD</b> containing the length, in bytes, of the application certificate.
     * @param {Pointer<PWSTR>} pszRevocationURL Pointer to a buffer to hold the revocation URL.
     * @param {Pointer<Integer>} pdwRevocationURLLen Pointer to a <b>DWORD</b> containing the size of the <i>rpszRevocationURL</i> buffer in bytes.
     * @param {Pointer<Integer>} pdwRevocationBitFlag Pointer to a <b>DWORD</b> containing the revocation bit flag. The flag value will be either zero, or one or more of the following flag names combined by using a bitwise <b>OR</b>.
     * 
     * <table>
     * <tr>
     * <th>Value
     *                 </th>
     * <th>Description
     *                 </th>
     * </tr>
     * <tr>
     * <td>WMDM_WMDM_REVOKED</td>
     * <td>Windows Media Device Manager itself has been revoked.</td>
     * </tr>
     * <tr>
     * <td>WMDM_APP_REVOKED</td>
     * <td>The application has been revoked and needs to be updated before any DRM-protected content can be transferred.</td>
     * </tr>
     * <tr>
     * <td>WMDM_SP_REVOKED</td>
     * <td>The service provider has been revoked and needs to be updated before any DRM-protected content can be transferred to it.</td>
     * </tr>
     * <tr>
     * <td>WMDM_SCP_REVOKED</td>
     * <td>The secure content provider has been revoked and needs to be updated before any DRM-protected content can be transferred.</td>
     * </tr>
     * </table>
     * @param {Pointer<Integer>} pqwFileSize Pointer to a <b>QWORD</b> containing the file size. The secure content provider is responsible for updating this value or setting it to zero if the size of the destination file cannot be determined at this point.
     * @param {IUnknown} pUnknown Pointer to an unknown interface from the application.
     * @param {Pointer<ISCPSecureExchange>} ppExchange Pointer to an exchange object that receives the exchange interface.
     * @param {Pointer<Integer>} abMac Array of eight bytes containing the message authentication code for the parameter data of this method. (WMDM_MAC_LENGTH is defined as 8.)
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an <b>HRESULT</b> error code.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WMDM_E_REVOKED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The application certificate that the secure content provider uses to talk to the DRM client has been revoked.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nf-mswmdm-iscpsecurequery2-makedecision2
     */
    MakeDecision2(fuFlags, pData, dwSize, dwAppSec, pbSPSessionKey, dwSessionKeyLen, pStorageGlobals, pAppCertApp, dwAppCertAppLen, pAppCertSP, dwAppCertSPLen, pszRevocationURL, pdwRevocationURLLen, pdwRevocationBitFlag, pqwFileSize, pUnknown, ppExchange, abMac) {
        pDataMarshal := pData is VarRef ? "char*" : "ptr"
        pbSPSessionKeyMarshal := pbSPSessionKey is VarRef ? "char*" : "ptr"
        pAppCertAppMarshal := pAppCertApp is VarRef ? "char*" : "ptr"
        pAppCertSPMarshal := pAppCertSP is VarRef ? "char*" : "ptr"
        pszRevocationURLMarshal := pszRevocationURL is VarRef ? "ptr*" : "ptr"
        pdwRevocationURLLenMarshal := pdwRevocationURLLen is VarRef ? "uint*" : "ptr"
        pdwRevocationBitFlagMarshal := pdwRevocationBitFlag is VarRef ? "uint*" : "ptr"
        pqwFileSizeMarshal := pqwFileSize is VarRef ? "uint*" : "ptr"
        abMacMarshal := abMac is VarRef ? "char*" : "ptr"

        result := ComCall(7, this, "uint", fuFlags, pDataMarshal, pData, "uint", dwSize, "uint", dwAppSec, pbSPSessionKeyMarshal, pbSPSessionKey, "uint", dwSessionKeyLen, "ptr", pStorageGlobals, pAppCertAppMarshal, pAppCertApp, "uint", dwAppCertAppLen, pAppCertSPMarshal, pAppCertSP, "uint", dwAppCertSPLen, pszRevocationURLMarshal, pszRevocationURL, pdwRevocationURLLenMarshal, pdwRevocationURLLen, pdwRevocationBitFlagMarshal, pdwRevocationBitFlag, pqwFileSizeMarshal, pqwFileSize, "ptr", pUnknown, ISCPSecureExchange.Ptr, ppExchange, abMacMarshal, abMac, "HRESULT")
        return result
    }

    Query(iid) {
        if (ISCPSecureQuery2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.MakeDecision2 := CallbackCreate(GetMethod(implObj, "MakeDecision2"), flags, 19)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.MakeDecision2)
    }
}
