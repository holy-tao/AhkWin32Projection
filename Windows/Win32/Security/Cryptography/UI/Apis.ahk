#Requires AutoHotkey >= v2.1-alpha.24+ 64-bit

#Import "..\CERT_CONTEXT.ahk" { CERT_CONTEXT }
#Import ".\CERT_SELECTUI_INPUT.ahk" { CERT_SELECTUI_INPUT }
#Import ".\CRYPTUI_WIZ_DIGITAL_SIGN_CONTEXT.ahk" { CRYPTUI_WIZ_DIGITAL_SIGN_CONTEXT }
#Import ".\CRYPTUI_WIZ_DIGITAL_SIGN_INFO.ahk" { CRYPTUI_WIZ_DIGITAL_SIGN_INFO }
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\CRYPTUI_VIEWCERTIFICATE_STRUCTW.ahk" { CRYPTUI_VIEWCERTIFICATE_STRUCTW }
#Import "..\..\..\Foundation\HWND.ahk" { HWND }
#Import ".\CRYPTUI_VIEWCERTIFICATE_STRUCTA.ahk" { CRYPTUI_VIEWCERTIFICATE_STRUCTA }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\HCERTSTORE.ahk" { HCERTSTORE }
#Import ".\CRYPTUI_WIZ_FLAGS.ahk" { CRYPTUI_WIZ_FLAGS }
#Import ".\CRYPTUI_CERT_MGR_STRUCT.ahk" { CRYPTUI_CERT_MGR_STRUCT }
#Import "..\..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\CRYPTUI_WIZ_IMPORT_SRC_INFO.ahk" { CRYPTUI_WIZ_IMPORT_SRC_INFO }
#Import ".\CRYPTUI_WIZ_EXPORT_INFO.ahk" { CRYPTUI_WIZ_EXPORT_INFO }

/**
 * @namespace Windows.Win32.Security.Cryptography.UI
 */

;@region Functions
/**
 * Displays a certificate, CTL, or CRL context.
 * @param {Integer} dwContextType <b>DWORD</b> indicating whether <i>pvContext</i> is a pointer to a certificate, a CRL, or a CTL context as indicated in the following table. 
 * 
 * 
 * 
 * 
 * 					
 * 
 * <table>
 * <tr>
 * <th>Value</th>
 * <th>Meaning</th>
 * </tr>
 * <tr>
 * <td width="40%"><a id="CERT_STORE_CERTIFICATE_CONTEXT"></a><a id="cert_store_certificate_context"></a><dl>
 * <dt><b>CERT_STORE_CERTIFICATE_CONTEXT</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * PCCERT_CONTEXT
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="CERT_STORE_CRL_CONTEXT"></a><a id="cert_store_crl_context"></a><dl>
 * <dt><b>CERT_STORE_CRL_CONTEXT</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * PCCRL_CONTEXT
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="CERT_STORE_CTL_CONTEXT"></a><a id="cert_store_ctl_context"></a><dl>
 * <dt><b>CERT_STORE_CTL_CONTEXT</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * PCCTL_CONTEXT
 * 
 * </td>
 * </tr>
 * </table>
 * @param {Pointer<Void>} pvContext A pointer to a certificate, CRL, or CTL context to be displayed.
 * @param {HWND} _hwnd Handle of the window for the display. If <b>NULL</b>, the display defaults to the desktop window.
 * @param {PWSTR} pwszTitle Display title string. If <b>NULL</b>, the default context type is used as the title.
 * @param {Integer} dwFlags Currently not used and should be set to 0.
 * @param {Pointer<Void>} pvReserved Reserved for future use.
 * @returns {BOOL} This function returns <b>TRUE</b> on success and <b>FALSE</b> on failure.
 * @see https://learn.microsoft.com/windows/win32/api/cryptuiapi/nf-cryptuiapi-cryptuidlgviewcontext
 * @since windows5.1.2600
 */
export CryptUIDlgViewContext(dwContextType, pvContext, _hwnd, pwszTitle, dwFlags, pvReserved) {
    pwszTitle := pwszTitle is String ? StrPtr(pwszTitle) : pwszTitle

    pvContextMarshal := pvContext is VarRef ? "ptr" : "ptr"
    pvReservedMarshal := pvReserved is VarRef ? "ptr" : "ptr"

    result := DllCall("CRYPTUI.dll\CryptUIDlgViewContext", "uint", dwContextType, pvContextMarshal, pvContext, HWND, _hwnd, "ptr", pwszTitle, "uint", dwFlags, pvReservedMarshal, pvReserved, BOOL)
    return result
}

/**
 * Displays a dialog box that allows the selection of a certificate from a specified store.
 * @param {HCERTSTORE} _hCertStore Handle of the certificate store to be searched.
 * @param {HWND} _hwnd Handle of the window for the display. If <b>NULL</b>, defaults to the desktop window.
 * @param {PWSTR} pwszTitle String used as the title of the dialog box. If <b>NULL</b>, the default title, "Select Certificate," is used.
 * @param {PWSTR} pwszDisplayString Text statement in the selection dialog box. If <b>NULL</b>, the default phrase, "Select a certificate you want to use," is used.
 * @param {Integer} dwDontUseColumn Flags that can be combined to exclude columns of the display. 
 * 
 * 
 * 
 * 					
 * 
 * <table>
 * <tr>
 * <th>Value</th>
 * <th>Meaning</th>
 * </tr>
 * <tr>
 * <td width="40%"><a id="CRYPTUI_SELECT_ISSUEDTO_COLUMN"></a><a id="cryptui_select_issuedto_column"></a><dl>
 * <dt><b>CRYPTUI_SELECT_ISSUEDTO_COLUMN</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Do not display the ISSUEDTO information.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="CRYPTUI_SELECT_ISSUEDBY_COLUMN"></a><a id="cryptui_select_issuedby_column"></a><dl>
 * <dt><b>CRYPTUI_SELECT_ISSUEDBY_COLUMN</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Do not display the ISSUEDBY information.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="CRYPTUI_SELECT_INTENDEDUSE_COLUMN"></a><a id="cryptui_select_intendeduse_column"></a><dl>
 * <dt><b>CRYPTUI_SELECT_INTENDEDUSE_COLUMN</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Do not display IntendedUse information.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="CRYPTUI_SELECT_FRIENDLYNAME_COLUMN"></a><a id="cryptui_select_friendlyname_column"></a><dl>
 * <dt><b>CRYPTUI_SELECT_FRIENDLYNAME_COLUMN</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Do not display the display name information.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="CRYPTUI_SELECT_LOCATION_COLUMN"></a><a id="cryptui_select_location_column"></a><dl>
 * <dt><b>CRYPTUI_SELECT_LOCATION_COLUMN</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Do not display location information.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="CRYPTUI_SELECT_EXPIRATION_COLUMN"></a><a id="cryptui_select_expiration_column"></a><dl>
 * <dt><b>CRYPTUI_SELECT_EXPIRATION_COLUMN</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Do not display expiration information.
 * 
 * </td>
 * </tr>
 * </table>
 * @param {Integer} dwFlags Currently not used and should be set to 0.
 * @param {Pointer<Void>} pvReserved Reserved for future use.
 * @returns {Pointer<CERT_CONTEXT>} Returns a pointer to the selected certificate context. If no certificate was selected, <b>NULL</b> is returned. When you have finished using the certificate, free the certificate context by calling the <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/nf-wincrypt-certfreecertificatecontext">CertFreeCertificateContext</a> function.
 * @see https://learn.microsoft.com/windows/win32/api/cryptuiapi/nf-cryptuiapi-cryptuidlgselectcertificatefromstore
 * @since windows5.1.2600
 */
export CryptUIDlgSelectCertificateFromStore(_hCertStore, _hwnd, pwszTitle, pwszDisplayString, dwDontUseColumn, dwFlags, pvReserved) {
    pwszTitle := pwszTitle is String ? StrPtr(pwszTitle) : pwszTitle
    pwszDisplayString := pwszDisplayString is String ? StrPtr(pwszDisplayString) : pwszDisplayString

    pvReservedMarshal := pvReserved is VarRef ? "ptr" : "ptr"

    result := DllCall("CRYPTUI.dll\CryptUIDlgSelectCertificateFromStore", HCERTSTORE, _hCertStore, HWND, _hwnd, "ptr", pwszTitle, "ptr", pwszDisplayString, "uint", dwDontUseColumn, "uint", dwFlags, pvReservedMarshal, pvReserved, CERT_CONTEXT.Ptr)
    return result
}

/**
 * A helper function used to retrieve a serialized certificate BLOB from a CERT_SELECTUI_INPUT structure.
 * @remarks
 * The returned serialized BLOB is passed to the <a href="https://docs.microsoft.com/windows/desktop/api/wincred/nf-wincred-creduipromptforwindowscredentialsa">CredUIPromptForWindowsCredentials</a> function in the <i>pvInAuthBuffer</i> parameter to allow a user to select a certificate by using the credential selection UI.
 * 
 * The certificates that are serialized in the BLOB returned in the buffer pointed to by the <i>ppOutBuffer</i>  parameter of this function are dependent on the values  of the <b>hStore</b> and <b>prgpChain</b> members of the <a href="https://docs.microsoft.com/windows/desktop/api/cryptuiapi/ns-cryptuiapi-cert_selectui_input">CERT_SELECTUI_INPUT</a> structure. 
 * 
 * <table>
 * <tr>
 * <th><b>hStore</b></th>
 * <th><b>prgpChain</b></th>
 * <th>Certificates serialized</th>
 * </tr>
 * <tr>
 * <td>
 * <b>NULL</b>
 * 
 * </td>
 * <td>
 * not <b>NULL</b>
 * 
 * </td>
 * <td>
 * The certificates pointed to by the <b>prgpChain</b> member are serialized.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td>
 * not <b>NULL</b>
 * 
 * </td>
 * <td>
 * <b>NULL</b>
 * 
 * </td>
 * <td>
 * The certificates specified by the <b>hStore</b> member are serialized.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td>
 * <b>NULL</b>
 * 
 * </td>
 * <td>
 * <b>NULL</b>
 * 
 * </td>
 * <td>
 * An empty BLOB is returned.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td>
 * not <b>NULL</b>
 * 
 * </td>
 * <td>
 * not <b>NULL</b>
 * 
 * </td>
 * <td>
 * The call fails and the function returns <b>E_INVALIDARG</b>.
 * 
 * </td>
 * </tr>
 * </table>
 * @param {Pointer<CERT_SELECTUI_INPUT>} pcsi A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/cryptuiapi/ns-cryptuiapi-cert_selectui_input">CERT_SELECTUI_INPUT</a> structure that contains the certificate store and certificate context chain information.
 * @param {Pointer<Pointer<Void>>} ppOutBuffer The address of a pointer to a buffer that receives the serialized certificates BLOB.
 * @param {Pointer<Integer>} pulOutBufferSize A pointer to a <b>ULONG</b> to receive the size, in bytes, of the BLOB received in the buffer pointed to by the <i>ppOutBuffer</i> parameter.
 * @returns {HRESULT} If the function succeeds, the function returns <b>S_OK</b>. 
 * 
 * If the function fails, it returns an <b>HRESULT</b> value that indicates the error. 	If both <b>hStore</b> and <b>prgpChain</b> parameters are not <b>NULL</b>, return <b>E_INVALIDARG</b>. For a list of common error codes, see <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
 * @see https://learn.microsoft.com/windows/win32/api/cryptuiapi/nf-cryptuiapi-certselectiongetserializedblob
 * @since windows6.1
 */
export CertSelectionGetSerializedBlob(pcsi, ppOutBuffer, pulOutBufferSize) {
    ppOutBufferMarshal := ppOutBuffer is VarRef ? "ptr*" : "ptr"
    pulOutBufferSizeMarshal := pulOutBufferSize is VarRef ? "uint*" : "ptr"

    result := DllCall("CRYPTUI.dll\CertSelectionGetSerializedBlob", CERT_SELECTUI_INPUT.Ptr, pcsi, ppOutBufferMarshal, ppOutBuffer, pulOutBufferSizeMarshal, pulOutBufferSize, "HRESULT")
    return result
}

/**
 * Displays a dialog box that allows the user to manage certificates.
 * @param {Pointer<CRYPTUI_CERT_MGR_STRUCT>} pCryptUICertMgr A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/cryptuiapi/ns-cryptuiapi-cryptui_cert_mgr_struct">CRYPTUI_CERT_MGR_STRUCT</a> structure that contains information about how to create the dialog box.
 * @returns {BOOL} The return value is <b>TRUE</b> if the function succeeds; otherwise, <b>FALSE.</b>
 * @see https://learn.microsoft.com/windows/win32/api/cryptuiapi/nf-cryptuiapi-cryptuidlgcertmgr
 * @since windows5.1.2600
 */
export CryptUIDlgCertMgr(pCryptUICertMgr) {
    result := DllCall("CRYPTUI.dll\CryptUIDlgCertMgr", CRYPTUI_CERT_MGR_STRUCT.Ptr, pCryptUICertMgr, BOOL)
    return result
}

/**
 * Digitally signs a document or BLOB.
 * @param {Integer} dwFlags Contains flags that modify the behavior of the function. This can be zero or the following value.
 * 
 * <table>
 * <tr>
 * <th>Value</th>
 * <th>Meaning</th>
 * </tr>
 * <tr>
 * <td width="40%"><a id="CRYPTUI_WIZ_NO_UI"></a><a id="cryptui_wiz_no_ui"></a><dl>
 * <dt><b>CRYPTUI_WIZ_NO_UI</b></dt>
 * <dt>0x0001</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * This function will sign the document based on the information in the <a href="https://docs.microsoft.com/windows/win32/api/cryptuiapi/ns-cryptuiapi-cryptui_wiz_digital_sign_info">CRYPTUI_WIZ_DIGITAL_SIGN_INFO</a> structure pointed to by the <i>pDigitalSignInfo</i> parameter without displaying any user interface. If this flag is not specified, this function will display a wizard to guide the user through the signing process.
 * 
 * </td>
 * </tr>
 * </table>
 * @param {HWND} hwndParent The handle of the window to use as the parent of the dialog box that  this function creates. This parameter is ignored if the <b>CRYPTUI_WIZ_NO_UI</b> flag is set in <i>dwFlags</i>.
 * @param {PWSTR} pwszWizardTitle A pointer to a null-terminated Unicode string that contains the title to use in the dialog box that this function creates. This parameter is ignored if the <b>CRYPT_WIZ_NO_UI</b> flag is set in <i>dwFlags</i>. If this parameter is <b>NULL</b>, a default title is used.
 * @param {Pointer<CRYPTUI_WIZ_DIGITAL_SIGN_INFO>} pDigitalSignInfo A pointer to a <a href="https://docs.microsoft.com/windows/win32/api/cryptuiapi/ns-cryptuiapi-cryptui_wiz_digital_sign_info">CRYPTUI_WIZ_DIGITAL_SIGN_INFO</a> structure that contains information about the signing process.
 * @param {Pointer<Pointer<CRYPTUI_WIZ_DIGITAL_SIGN_CONTEXT>>} ppSignContext A pointer to a <a href="https://docs.microsoft.com/windows/win32/api/cryptuiapi/ns-cryptuiapi-cryptui_wiz_digital_sign_context">CRYPTUI_WIZ_DIGITAL_SIGN_CONTEXT</a> structure pointer that receives the signed BLOB. When you have finished using this structure, you must free the memory by passing this pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/cryptuiapi/nf-cryptuiapi-cryptuiwizfreedigitalsigncontext">CryptUIWizFreeDigitalSignContext</a> function. This parameter can be <b>NULL</b> if the signed BLOB is not needed.
 * @returns {BOOL} If the function succeeds, the function returns nonzero.
 * 
 * If the function fails, it returns zero.
 * @see https://learn.microsoft.com/windows/win32/api/cryptuiapi/nf-cryptuiapi-cryptuiwizdigitalsign
 * @since windows5.1.2600
 */
export CryptUIWizDigitalSign(dwFlags, hwndParent, pwszWizardTitle, pDigitalSignInfo, ppSignContext) {
    pwszWizardTitle := pwszWizardTitle is String ? StrPtr(pwszWizardTitle) : pwszWizardTitle

    ppSignContextMarshal := ppSignContext is VarRef ? "ptr*" : "ptr"

    result := DllCall("CRYPTUI.dll\CryptUIWizDigitalSign", "uint", dwFlags, HWND, hwndParent, "ptr", pwszWizardTitle, CRYPTUI_WIZ_DIGITAL_SIGN_INFO.Ptr, pDigitalSignInfo, ppSignContextMarshal, ppSignContext, BOOL)
    return result
}

/**
 * Frees the CRYPTUI_WIZ_DIGITAL_SIGN_CONTEXT structure allocated by the CryptUIWizDigitalSign function.
 * @param {Pointer<CRYPTUI_WIZ_DIGITAL_SIGN_CONTEXT>} pSignContext A pointer to the   <a href="https://docs.microsoft.com/windows/win32/api/cryptuiapi/ns-cryptuiapi-cryptui_wiz_digital_sign_context">CRYPTUI_WIZ_DIGITAL_SIGN_CONTEXT</a> structure to be freed.
 * @returns {BOOL} If the function succeeds, the function returns nonzero.
 * 
 * If the function fails, it returns zero.
 * @see https://learn.microsoft.com/windows/win32/api/cryptuiapi/nf-cryptuiapi-cryptuiwizfreedigitalsigncontext
 * @since windows5.1.2600
 */
export CryptUIWizFreeDigitalSignContext(pSignContext) {
    result := DllCall("CRYPTUI.dll\CryptUIWizFreeDigitalSignContext", CRYPTUI_WIZ_DIGITAL_SIGN_CONTEXT.Ptr, pSignContext, BOOL)
    return result
}

/**
 * Presents a dialog box that displays a specified certificate. (Unicode)
 * @remarks
 * > [!NOTE]
 * > The cryptuiapi.h header defines CryptUIDlgViewCertificate as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {Pointer<CRYPTUI_VIEWCERTIFICATE_STRUCTW>} pCertViewInfo A pointer to a <a href="https://docs.microsoft.com/windows/win32/api/cryptuiapi/ns-cryptuiapi-cryptui_viewcertificate_structa">CRYPTUI_VIEWCERTIFICATE_STRUCT</a> structure that contains information about the certificate to view.
 * @param {Pointer<BOOL>} pfPropertiesChanged Indicates whether any certificate properties were modified by the caller.
 * @returns {BOOL} If the function succeeds, the return value is nonzero (<b>TRUE</b>).
 * 
 * If the function fails, the return value is zero (<b>FALSE</b>). For extended error information, call the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function.
 * @see https://learn.microsoft.com/windows/win32/api/cryptuiapi/nf-cryptuiapi-cryptuidlgviewcertificatew
 * @since windows5.1.2600
 */
export CryptUIDlgViewCertificateW(pCertViewInfo, pfPropertiesChanged) {
    pfPropertiesChangedMarshal := pfPropertiesChanged is VarRef ? "int*" : "ptr"

    A_LastError := 0

    result := DllCall("CRYPTUI.dll\CryptUIDlgViewCertificateW", CRYPTUI_VIEWCERTIFICATE_STRUCTW.Ptr, pCertViewInfo, pfPropertiesChangedMarshal, pfPropertiesChanged, BOOL)
    if(!result && A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * Presents a dialog box that displays a specified certificate. (ANSI)
 * @remarks
 * > [!NOTE]
 * > The cryptuiapi.h header defines CryptUIDlgViewCertificate as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {Pointer<CRYPTUI_VIEWCERTIFICATE_STRUCTA>} pCertViewInfo A pointer to a <a href="https://docs.microsoft.com/windows/win32/api/cryptuiapi/ns-cryptuiapi-cryptui_viewcertificate_structa">CRYPTUI_VIEWCERTIFICATE_STRUCT</a> structure that contains information about the certificate to view.
 * @param {Pointer<BOOL>} pfPropertiesChanged Indicates whether any certificate properties were modified by the caller.
 * @returns {BOOL} If the function succeeds, the return value is nonzero (<b>TRUE</b>).
 * 
 * If the function fails, the return value is zero (<b>FALSE</b>). For extended error information, call the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function.
 * @see https://learn.microsoft.com/windows/win32/api/cryptuiapi/nf-cryptuiapi-cryptuidlgviewcertificatea
 * @since windows5.1.2600
 */
export CryptUIDlgViewCertificateA(pCertViewInfo, pfPropertiesChanged) {
    pfPropertiesChangedMarshal := pfPropertiesChanged is VarRef ? "int*" : "ptr"

    A_LastError := 0

    result := DllCall("CRYPTUI.dll\CryptUIDlgViewCertificateA", CRYPTUI_VIEWCERTIFICATE_STRUCTA.Ptr, pCertViewInfo, pfPropertiesChangedMarshal, pfPropertiesChanged, BOOL)
    if(!result && A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * Exports a certificate, a certificate trust list (CTL), a certificate revocation list (CRL), or a certificate store to a file.
 * @param {CRYPTUI_WIZ_FLAGS} dwFlags 
 * @param {HWND} hwndParent The handle of the window to use as the parent of the dialog box that this function creates. This parameter is ignored if the <b>CRYPT_WIZ_NO_UI</b> flag is set in <i>dwFlags</i>.
 * @param {PWSTR} pwszWizardTitle A pointer to a null-terminated Unicode string that contains the title to use in the dialog box that this function creates. This parameter is ignored if the <b>CRYPT_WIZ_NO_UI</b> flag is set in <i>dwFlags</i>.
 * @param {Pointer<CRYPTUI_WIZ_EXPORT_INFO>} pExportInfo A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/cryptuiapi/ns-cryptuiapi-cryptui_wiz_export_info">CRYPTUI_WIZ_EXPORT_INFO</a> structure that contains information about producing the export wizard.
 * @param {Pointer<Void>} pvoid If the <b>dwSubjectChoice</b> member of  the <a href="https://docs.microsoft.com/windows/win32/api/cryptuiapi/ns-cryptuiapi-cryptui_wiz_export_certcontext_info">CRYPTUI_WIZ_EXPORT_INFO</a> structure that <i>pExportInfo</i> references is <b>CRYPTUI_WIZ_EXPORT_CERT_CONTEXT</b>, and if the  <b>CRYPTUI_WIZ_NO_UI</b> flag is set in <i>dwFlags</i>, this parameter is a pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/cryptuiapi/ns-cryptuiapi-cryptui_wiz_export_certcontext_info">CRYPTUI_WIZ_EXPORT_CERTCONTEXT_INFO</a> structure. 
 * 
 * If the <b>CRYPTUI_WIZ_NO_UI</b> flag is not set in <i>dwFlags</i>, this parameter is optional and can be <b>NULL</b>. If this parameter is not <b>NULL</b>, the <a href="https://docs.microsoft.com/windows/win32/api/cryptuiapi/ns-cryptuiapi-cryptui_wiz_export_certcontext_info">CRYPTUI_WIZ_EXPORT_CERTCONTEXT_INFO</a> structure contains the values that are displayed to the user as the default choices.
 * @returns {BOOL} If the function succeeds, the function returns nonzero.
 * 
 * If the function fails, it returns zero. For extended error information, call 
 * the <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function.
 * @see https://learn.microsoft.com/windows/win32/api/cryptuiapi/nf-cryptuiapi-cryptuiwizexport
 * @since windows5.1.2600
 */
export CryptUIWizExport(dwFlags, hwndParent, pwszWizardTitle, pExportInfo, pvoid) {
    pwszWizardTitle := pwszWizardTitle is String ? StrPtr(pwszWizardTitle) : pwszWizardTitle

    pvoidMarshal := pvoid is VarRef ? "ptr" : "ptr"

    A_LastError := 0

    result := DllCall("CRYPTUI.dll\CryptUIWizExport", CRYPTUI_WIZ_FLAGS, dwFlags, HWND, hwndParent, "ptr", pwszWizardTitle, CRYPTUI_WIZ_EXPORT_INFO.Ptr, pExportInfo, pvoidMarshal, pvoid, BOOL)
    if(!result && A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * Imports a certificate, a certificate trust list (CTL), a certificate revocation list (CRL), or a certificate store to a certificate store.
 * @remarks
 * If none of following three flags are set in <i>dwFlags</i>, import of any type of content is allowed:
 * 
 * <ul>
 * <li>CRYPTUI_WIZ_IMPORT_ALLOW_CERT</li>
 * <li>CRYPTUI_WIZ_IMPORT_ALLOW_CRL</li>
 * <li>CRYPTUI_WIZ_IMPORT_ALLOW_CTL</li>
 * </ul>
 * The <b>CRYPTUI_WIZ_IMPORT_TO_LOCALMACHINE</b> and <b>CRYPTUI_WIZ_IMPORT_TO_CURRENTUSER</b> flags are used to force the content of a PFX <a href="https://docs.microsoft.com/windows/desktop/SecGloss/b-gly">BLOB</a> into either the local machine store or the current user store.
 * If neither of these flags are set and <i>hDestCertStore</i> is <b>NULL</b>:
 * 
 * <ul>
 * <li>The private key in the PFX <a href="https://docs.microsoft.com/windows/desktop/SecGloss/b-gly">BLOB</a> will be forced to be imported into the current user store.</li>
 * <li>And if <b>CRYPTUI_WIZ_NO_UI</b> is not set, the wizard prompts the user to select a certificate 
 * store from among the current user certificate stores.</li>
 * </ul>
 * @param {CRYPTUI_WIZ_FLAGS} dwFlags 
 * @param {HWND} hwndParent The handle of the window to use as the parent of the dialog box that  this function creates. This parameter is ignored if the <b>CRYPTUI_WIZ_NO_UI</b> flag is set in <i>dwFlags</i>.
 * @param {PWSTR} pwszWizardTitle A pointer to a null-terminated Unicode string that contains the title to use in the dialog box that this function creates. This parameter is ignored if the <b>CRYPTUI_WIZ_NO_UI</b> flag is set in <i>dwFlags</i>.
 * @param {Pointer<CRYPTUI_WIZ_IMPORT_SRC_INFO>} pImportSrc A pointer to a <a href="https://docs.microsoft.com/windows/win32/api/cryptuiapi/ns-cryptuiapi-cryptui_wiz_import_src_info">CRYPTUI_WIZ_IMPORT_SRC_INFO</a> structure that contains information about the object to import. This parameter is required if <b>CRYPTUI_WIZ_NO_UI</b> is set in <i>dwFlags</i> and is optional otherwise.
 * @param {HCERTSTORE} hDestCertStore A handle to the certificate store to import to. If this parameter is <b>NULL</b> and the <b>CRYPTUI_WIZ_NO_UI</b> flag is not set in <i>dwFlags</i>, the wizard will prompt the user to select a certificate store.
 * @returns {BOOL} If the function succeeds, the function returns nonzero.
 * 
 * If the function fails, it returns zero. For extended error information, call 
 * the <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function.
 * @see https://learn.microsoft.com/windows/win32/api/cryptuiapi/nf-cryptuiapi-cryptuiwizimport
 * @since windows5.1.2600
 */
export CryptUIWizImport(dwFlags, hwndParent, pwszWizardTitle, pImportSrc, hDestCertStore) {
    pwszWizardTitle := pwszWizardTitle is String ? StrPtr(pwszWizardTitle) : pwszWizardTitle

    A_LastError := 0

    result := DllCall("CRYPTUI.dll\CryptUIWizImport", CRYPTUI_WIZ_FLAGS, dwFlags, HWND, hwndParent, "ptr", pwszWizardTitle, CRYPTUI_WIZ_IMPORT_SRC_INFO.Ptr, pImportSrc, HCERTSTORE, hDestCertStore, BOOL)
    if(!result && A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

;@endregion Functions
