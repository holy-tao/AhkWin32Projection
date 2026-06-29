#Requires AutoHotkey >= v2.1-alpha.24+ 64-bit

#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\CRYPT_PROVIDER_DATA.ahk" { CRYPT_PROVIDER_DATA }
#Import ".\CRYPT_PROVIDER_FUNCTIONS.ahk" { CRYPT_PROVIDER_FUNCTIONS }
#Import ".\WINTRUST_DATA.ahk" { WINTRUST_DATA }
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import ".\CRYPT_REGISTER_ACTIONID.ahk" { CRYPT_REGISTER_ACTIONID }
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import ".\CRYPT_PROVIDER_CERT.ahk" { CRYPT_PROVIDER_CERT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\CRYPT_PROVIDER_REGDEFUSAGE.ahk" { CRYPT_PROVIDER_REGDEFUSAGE }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }
#Import ".\CRYPT_PROVIDER_DEFUSAGE.ahk" { CRYPT_PROVIDER_DEFUSAGE }
#Import ".\WINTRUST_POLICY_FLAGS.ahk" { WINTRUST_POLICY_FLAGS }
#Import ".\CRYPT_PROVIDER_PRIVDATA.ahk" { CRYPT_PROVIDER_PRIVDATA }
#Import ".\CRYPT_PROVIDER_SGNR.ahk" { CRYPT_PROVIDER_SGNR }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\Cryptography\CERT_INFO.ahk" { CERT_INFO }
#Import ".\WINTRUST_GET_DEFAULT_FOR_USAGE_ACTION.ahk" { WINTRUST_GET_DEFAULT_FOR_USAGE_ACTION }

/**
 * @namespace Windows.Win32.Security.WinTrust
 */

;@region Functions
/**
 * Performs a trust verification action on a specified object.
 * @remarks
 * The <b>WinVerifyTrust</b> function enables applications to invoke a <a href="https://docs.microsoft.com/windows/desktop/SecGloss/t-gly">trust provider</a> to verify that a specified object satisfies the criteria of a specified verification operation. The <i>pgActionID</i> parameter identifies the verification operation, and the <i>pWinTrustData</i> parameter identifies the object whose trust is to be verified. A trust provider is a DLL registered with the operating system. A call to <b>WinVerifyTrust</b> forwards that call to the registered trust provider, if there is one, that supports that specified action identifier.
 * 
 * For example, the Software Publisher Trust Provider can verify that an executable image file comes from a trusted software publisher and that the file has not been modified since it was published. In this case, the <i>pWinTrustData</i> parameter specifies the name of the file and the type of file, such as a Microsoft <a href="https://docs.microsoft.com/windows/desktop/SecGloss/p-gly">Portable Executable</a> image file.
 * 
 * Each trust provider supports a specific set of actions that it can evaluate. Each action has a GUID that identifies it. A trust provider can support any number of action identifiers, but two trust providers cannot support the same action identifier.
 * 
 * For an example that demonstrates how to use this function to verify the signature of a portable executable (PE) file, see <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/example-c-program--verifying-the-signature-of-a-pe-file">Example C Program: Verifying the Signature of a PE File</a>.
 * @param {HWND} _hwnd Optional handle to a caller window. A trust provider can use this value to determine whether it can interact with the user. However, trust providers typically perform verification actions without input from the user.
 * @param {Pointer<Guid>} pgActionID A pointer to a <b>GUID</b> structure that identifies an action and the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/t-gly">trust provider</a> that supports that action. This value indicates the type of verification action to be performed on the structure pointed to by <i>pWinTrustData</i>.
 * 
 * The WinTrust service is designed to work with trust providers implemented by third parties. Each trust provider provides its own unique set of action identifiers. For information about the action identifiers supported by a trust provider, see the documentation for that trust provider.
 * 
 * For example, Microsoft provides a Software Publisher Trust Provider that can establish the trustworthiness of software being downloaded from the Internet or some other public network. The Software Publisher Trust Provider supports the following action identifiers. These constants are defined in Softpub.h.
 * 
 * <table>
 * <tr>
 * <th>Value</th>
 * <th>Meaning</th>
 * </tr>
 * <tr>
 * <td width="40%"><a id="DRIVER_ACTION_VERIFY"></a><a id="driver_action_verify"></a><dl>
 * <dt><b>DRIVER_ACTION_VERIFY</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Verify the
 * authenticity of a Windows Hardware Quality Labs (WHQL) signed driver.  This is an Authenticode add-on
 * policy provider.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="HTTPSPROV_ACTION"></a><a id="httpsprov_action"></a><dl>
 * <dt><b>HTTPSPROV_ACTION</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Verify an SSL/TLS connection through Internet Explorer.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="OFFICESIGN_ACTION_VERIFY"></a><a id="officesign_action_verify"></a><dl>
 * <dt><b>OFFICESIGN_ACTION_VERIFY</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 *  This Action ID is not supported. Verify the
 * authenticity of a structured storage file by using the Microsoft Office
 * Authenticode add-on policy provider.
 * 
 * <b>Windows Server 2003 and Windows XP:  </b>This Action ID is supported.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="WINTRUST_ACTION_GENERIC_CHAIN_VERIFY"></a><a id="wintrust_action_generic_chain_verify"></a><dl>
 * <dt><b>WINTRUST_ACTION_GENERIC_CHAIN_VERIFY</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Verify
 * certificate chains created from any object type.
 * A callback is provided to implement the final chain policy by using
 * the chain context for each signer and counter signer.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="WINTRUST_ACTION_GENERIC_VERIFY_V2"></a><a id="wintrust_action_generic_verify_v2"></a><dl>
 * <dt><b>WINTRUST_ACTION_GENERIC_VERIFY_V2</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Verify a file or object using the Authenticode policy provider.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="WINTRUST_ACTION_TRUSTPROVIDER_TEST"></a><a id="wintrust_action_trustprovider_test"></a><dl>
 * <dt><b>WINTRUST_ACTION_TRUSTPROVIDER_TEST</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Write
 * the <a href="https://docs.microsoft.com/windows/desktop/api/wintrust/ns-wintrust-crypt_provider_data">CRYPT_PROVIDER_DATA</a> structure to a file after calling the
 * Authenticode policy provider.
 * 
 * </td>
 * </tr>
 * </table>
 * @param {Pointer<Void>} pWVTData A pointer that, when cast as a 
 * <a href="https://docs.microsoft.com/windows/desktop/api/wintrust/ns-wintrust-wintrust_data">WINTRUST_DATA</a> structure, contains information that the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/t-gly">trust provider</a> needs to process the specified action identifier. Typically, the structure includes information that identifies the object that the trust provider must evaluate.
 * 
 * The format of the structure depends on the action identifier. For information about the data required for a specific action identifier, see the documentation for the trust provider that supports that action.
 * @returns {Integer} If the trust provider verifies that the subject is trusted for the specified action, the return value is zero.  No other value besides zero should be considered a successful return.
 * 
 * If the trust provider does not verify that the subject is trusted for the specified action, the function returns a status code from the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/t-gly">trust provider</a>.<div class="alert"><b>Note</b>  The return value is a <b>LONG</b>, not an <b>HRESULT</b> as previously documented. Do not use <b>HRESULT</b> macros such as <b>SUCCEEDED</b> to determine whether the function succeeded. Instead, check the return value for equality to zero.</div>
 * <div> </div>
 * 
 * 
 * For example, a trust provider might indicate that the subject is not trusted, or is trusted but with limitations or warnings. The return value can be a trust-provider-specific value described in the documentation for an individual trust provider, or it can be one of the following error codes.
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>TRUST_E_SUBJECT_NOT_TRUSTED</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The subject failed the specified verification action. Most trust providers return a more detailed error code that describes the reason for the failure.
 * 
 * <div class="alert"><b>Note</b>  <p class="note">The <b>TRUST_E_SUBJECT_NOT_TRUSTED</b> return code may be returned depending on the value of the <b>EnableCertPaddingCheck</b> registry key under <b>HKLM\Software\Microsoft\Cryptography\Wintrust\Config</b>. If <b>EnableCertPaddingCheck</b> is set to "1", then an additional check is performed to verify that the <b>WIN_CERTIFICATE</b> structure does not contain extraneous information. The check validates that there is no non-zero data beyond the PKCS #7 structure. The <b>EnableCertPaddingCheck</b> key will be set to "1" by default on June 10, 2014. For more information, please refer to the following security advisory: <a href="https://docs.microsoft.com/security-updates/SecurityAdvisories/2014/2915720">http://technet.microsoft.com/security/advisory/2915720#section1</a>.
 * 
 * </div>
 * <div> </div>
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>TRUST_E_PROVIDER_UNKNOWN</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The trust provider is not recognized on this system.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>TRUST_E_ACTION_UNKNOWN</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The trust provider does not support the specified action.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>TRUST_E_SUBJECT_FORM_UNKNOWN</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The trust provider does not support the form specified for the subject.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/wintrust/nf-wintrust-winverifytrust
 * @since windows5.1.2600
 */
export WinVerifyTrust(_hwnd, pgActionID, pWVTData) {
    pWVTDataMarshal := pWVTData is VarRef ? "ptr" : "ptr"

    result := DllCall("WINTRUST.dll\WinVerifyTrust", HWND, _hwnd, Guid.Ptr, pgActionID, pWVTDataMarshal, pWVTData, Int32)
    return result
}

/**
 * Performs a trust verification action on a specified object and takes a pointer to a WINTRUST_DATA structure.
 * @param {HWND} _hwnd Optional handle to a caller window. A trust provider can use this value to determine whether it can interact with the user. However, trust providers typically perform verification actions without input from the user.
 * @param {Pointer<Guid>} pgActionID A pointer to a <b>GUID</b> structure that identifies an action and the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/t-gly">trust provider</a> that supports that action. This value indicates the type of verification action to be performed on the structure pointed to by <i>pWinTrustData</i>.
 * 
 * The WinTrust service is designed to work with trust providers implemented by third parties. Each trust provider provides its own unique set of action identifiers. For information about the action identifiers supported by a trust provider, see the documentation for that trust provider.
 * 
 * For example, Microsoft provides a Software Publisher Trust Provider that can establish the trustworthiness of software being downloaded from the Internet or some other public network. The Software Publisher Trust Provider supports the following action identifiers. These constants are defined in Softpub.h.
 * 
 * <table>
 * <tr>
 * <th>Value</th>
 * <th>Meaning</th>
 * </tr>
 * <tr>
 * <td width="40%"><a id="DRIVER_ACTION_VERIFY"></a><a id="driver_action_verify"></a><dl>
 * <dt><b>DRIVER_ACTION_VERIFY</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Verify the
 * authenticity of a Windows Hardware Quality Labs (WHQL) signed driver.  This is an Authenticode add-on
 * policy provider.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="HTTPSPROV_ACTION"></a><a id="httpsprov_action"></a><dl>
 * <dt><b>HTTPSPROV_ACTION</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Verify an SSL/TLS connection through Internet Explorer.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="OFFICESIGN_ACTION_VERIFY"></a><a id="officesign_action_verify"></a><dl>
 * <dt><b>OFFICESIGN_ACTION_VERIFY</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 *  This Action ID is not supported. Verify the
 * authenticity of a structured storage file by using the Microsoft Office
 * Authenticode add-on policy provider.
 * 
 * <b>Windows Server 2003 and Windows XP:  </b>This Action ID is supported.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="WINTRUST_ACTION_GENERIC_CERT_VERIFY"></a><a id="wintrust_action_generic_cert_verify"></a><dl>
 * <dt><b>WINTRUST_ACTION_GENERIC_CERT_VERIFY</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Verify
 * a certificate chain only.  This is only valid when passing in a
 * certificate context in the <a href="https://docs.microsoft.com/windows/desktop/api/wintrust/nf-wintrust-winverifytrust">WinVerifyTrust</a> input structures.
 * 
 * <div class="alert"><b>Note</b>  We do not recommend  using this function to perform certificate verification. To perform certificate verification, use the <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/nf-wincrypt-certgetcertificatechain">CertGetCertificateChain</a> and <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/nf-wincrypt-certverifycertificatechainpolicy">CertVerifyCertificateChainPolicy</a> functions.</div>
 * <div> </div>
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="WINTRUST_ACTION_GENERIC_CHAIN_VERIFY"></a><a id="wintrust_action_generic_chain_verify"></a><dl>
 * <dt><b>WINTRUST_ACTION_GENERIC_CHAIN_VERIFY</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Verify
 * certificate chains created from any object type.
 * A callback is provided to implement the final chain policy by using
 * the chain context for each signer and counter signer.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="WINTRUST_ACTION_GENERIC_VERIFY_V2"></a><a id="wintrust_action_generic_verify_v2"></a><dl>
 * <dt><b>WINTRUST_ACTION_GENERIC_VERIFY_V2</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Verify a file or object using the Authenticode policy provider.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="WINTRUST_ACTION_TRUSTPROVIDER_TEST"></a><a id="wintrust_action_trustprovider_test"></a><dl>
 * <dt><b>WINTRUST_ACTION_TRUSTPROVIDER_TEST</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Write
 * the <a href="https://docs.microsoft.com/windows/desktop/api/wintrust/ns-wintrust-crypt_provider_data">CRYPT_PROVIDER_DATA</a> structure to a file after calling the
 * Authenticode policy provider.
 * 
 * </td>
 * </tr>
 * </table>
 * @param {Pointer<WINTRUST_DATA>} pWinTrustData A pointer to a 
 * <a href="https://docs.microsoft.com/windows/desktop/api/wintrust/ns-wintrust-wintrust_data">WINTRUST_DATA</a> structure that contains information that the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/t-gly">trust provider</a> needs to process the specified action identifier. Typically, the structure includes information that identifies the object that the trust provider must evaluate.
 * 
 * The format of the structure depends on the action identifier. For information about the data required for a specific action identifier, see the documentation for the trust provider that supports that action.
 * @returns {Integer} Note, while the return type is declared as HRESULT this API returns Win32 error codes, do not use SUCCEEDED() or FAILED() to test the result.
 * 
 * If the trust provider verifies that the subject is trusted for the specified action, the return value is ERROR_SUCCESS. Otherwise, the function returns a status code from the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/t-gly">trust provider</a>.
 * 
 * For example, a trust provider might indicate that the subject is not trusted, or is trusted but with limitations or warnings. The return value can be a trust provider–specific value described in the documentation for an individual trust provider, or it can be one of the following error codes.
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>TRUST_E_SUBJECT_NOT_TRUSTED</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The subject failed the specified verification action. Most trust providers return a more detailed error code that describes the reason for the failure.
 * 
 * <div class="alert"><b>Note</b>  <p class="note">The <b>TRUST_E_SUBJECT_NOT_TRUSTED</b> return code may be returned depending on the value of the <b>EnableCertPaddingCheck</b> registry key under <b>HKLM\Software\Microsoft\Cryptography\Wintrust\Config</b>. If <b>EnableCertPaddingCheck</b> is set to "1", then an additional check is performed to verify that the <b>WIN_CERTIFICATE</b> structure does not contain extraneous information. The check validates that there is no non-zero data beyond the PKCS #7 structure. The <b>EnableCertPaddingCheck</b> key will be set to "1" by default on June 10, 2014. For more information, please refer to the following security advisory: <a href="https://docs.microsoft.com/security-updates/SecurityAdvisories/2014/2915720">http://technet.microsoft.com/security/advisory/2915720#section1</a>.
 * 
 * </div>
 * <div> </div>
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>TRUST_E_PROVIDER_UNKNOWN</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The trust provider is not recognized on this system.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>TRUST_E_ACTION_UNKNOWN</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The trust provider does not support the specified action.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>TRUST_E_SUBJECT_FORM_UNKNOWN</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The trust provider does not support the form specified for the subject.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/wintrust/nf-wintrust-winverifytrustex
 * @since windows5.1.2600
 */
export WinVerifyTrustEx(_hwnd, pgActionID, pWinTrustData) {
    result := DllCall("WINTRUST.dll\WinVerifyTrustEx", HWND, _hwnd, Guid.Ptr, pgActionID, WINTRUST_DATA.Ptr, pWinTrustData, Int32)
    return result
}

/**
 * Retrieves policy flags for a policy provider.
 * @param {Pointer<WINTRUST_POLICY_FLAGS>} pdwPolicyFlags 
 * @returns {String} Nothing - always returns an empty string
 * @see https://learn.microsoft.com/windows/win32/api/wintrust/nf-wintrust-wintrustgetregpolicyflags
 * @since windows5.1.2600
 */
export WintrustGetRegPolicyFlags(pdwPolicyFlags) {
    pdwPolicyFlagsMarshal := pdwPolicyFlags is VarRef ? "uint*" : "ptr"

    DllCall("WINTRUST.dll\WintrustGetRegPolicyFlags", pdwPolicyFlagsMarshal, pdwPolicyFlags)
}

/**
 * Sets policy flags for a policy provider.
 * @param {WINTRUST_POLICY_FLAGS} dwPolicyFlags 
 * @returns {BOOL} Returns nonzero if the policy flags were set successfully or zero otherwise.
 * @see https://learn.microsoft.com/windows/win32/api/wintrust/nf-wintrust-wintrustsetregpolicyflags
 * @since windows5.1.2600
 */
export WintrustSetRegPolicyFlags(dwPolicyFlags) {
    result := DllCall("WINTRUST.dll\WintrustSetRegPolicyFlags", WINTRUST_POLICY_FLAGS, dwPolicyFlags, BOOL)
    return result
}

/**
 * Adds a trust provider action to the user's system.
 * @remarks
 * To remove an action that has been added by this function, call the  <a href="https://docs.microsoft.com/windows/desktop/api/wintrust/nf-wintrust-wintrustremoveactionid">WintrustRemoveActionID</a> function.
 * @param {Pointer<Guid>} pgActionID A pointer to a <b>GUID</b> structure that identifies the action to add  and the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/t-gly">trust provider</a> that supports that action.
 * 
 * The WinTrust service is designed to work with trust providers implemented by third parties. Each trust provider provides its own unique set of action identifiers. For information about the action identifiers supported by a trust provider, see the documentation for that trust provider.
 * 
 * For example, Microsoft provides a Software Publisher Trust Provider that can establish the trustworthiness of software being downloaded from the Internet or some other public network. The Software Publisher Trust Provider supports the following action identifiers. These constants are defined in Softpub.h.
 * 
 * <table>
 * <tr>
 * <th>Value</th>
 * <th>Meaning</th>
 * </tr>
 * <tr>
 * <td width="40%"><a id="WINTRUST_ACTION_GENERIC_VERIFY"></a><a id="wintrust_action_generic_verify"></a><dl>
 * <dt><b>WINTRUST_ACTION_GENERIC_VERIFY</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Verify a certificate chain only.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="WINTRUST_ACTION_GENERIC_VERIFY_V2"></a><a id="wintrust_action_generic_verify_v2"></a><dl>
 * <dt><b>WINTRUST_ACTION_GENERIC_VERIFY_V2</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Verify a file or object using the Authenticode policy provider.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="HTTPSPROV_ACTION"></a><a id="httpsprov_action"></a><dl>
 * <dt><b>HTTPSPROV_ACTION</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Verify an SSL/PCT connection through Internet Explorer.
 * 
 * </td>
 * </tr>
 * </table>
 * @param {Integer} fdwFlags a value that determines whether registry errors are reported by this function. If <i>fdwFlags</i> is zero and this function experiences a registry error, the registry error will not be propagated to the <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>  function. If <i>fdwFlags</i> is WT_ADD_ACTION_ID_RET_RESULT_FLAG (0x1) and this function experiences a registry error, the registry error will be propagated to the <b>GetLastError</b>  function.
 * @param {Pointer<CRYPT_REGISTER_ACTIONID>} psProvInfo A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/wintrust/ns-wintrust-crypt_register_actionid">CRYPT_REGISTER_ACTIONID</a> structure that defines the information for the trust provider.
 * @returns {BOOL} The return value is <b>TRUE</b> if the function succeeds; <b>FALSE</b>  if the function fails.   If the function fails, call the <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function  to determine the reason for failure.  For information about any registry errors that this function may encounter, see the description for <i>fdwFlags</i>.
 * @see https://learn.microsoft.com/windows/win32/api/wintrust/nf-wintrust-wintrustaddactionid
 * @since windows5.1.2600
 */
export WintrustAddActionID(pgActionID, fdwFlags, psProvInfo) {
    A_LastError := 0

    result := DllCall("WINTRUST.dll\WintrustAddActionID", Guid.Ptr, pgActionID, "uint", fdwFlags, CRYPT_REGISTER_ACTIONID.Ptr, psProvInfo, BOOL)
    if(!result && A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * Removes an action added by the WintrustAddActionID function. This function has no associated import library.
 * @param {Pointer<Guid>} pgActionID A pointer to a <b>GUID</b> structure that identifies the action to remove and the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/t-gly">trust provider</a> that supports that action.
 * 
 * The WinTrust service is designed to work with trust providers implemented by third parties. Each trust provider provides its own unique set of action identifiers. For information about the action identifiers supported by a trust provider, see the documentation for that trust provider.
 * 
 * For example, Microsoft provides a Software Publisher Trust Provider that can establish the trustworthiness of software being downloaded from the Internet or some other public network. The Software Publisher Trust Provider supports the following action identifiers. These constants are defined in Softpub.h.
 * 
 * <table>
 * <tr>
 * <th>Value</th>
 * <th>Meaning</th>
 * </tr>
 * <tr>
 * <td width="40%"><a id="WINTRUST_ACTION_GENERIC_VERIFY"></a><a id="wintrust_action_generic_verify"></a><dl>
 * <dt><b>WINTRUST_ACTION_GENERIC_VERIFY</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Verify a certificate chain only.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="WINTRUST_ACTION_GENERIC_VERIFY_V2"></a><a id="wintrust_action_generic_verify_v2"></a><dl>
 * <dt><b>WINTRUST_ACTION_GENERIC_VERIFY_V2</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Verify a file or object using the Authenticode policy provider.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="HTTPSPROV_ACTION"></a><a id="httpsprov_action"></a><dl>
 * <dt><b>HTTPSPROV_ACTION</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Verify an SSL/PCT connection through Internet Explorer.
 * 
 * </td>
 * </tr>
 * </table>
 * @returns {BOOL} The return value is <b>TRUE</b> if the function succeeds; <b>FALSE</b> if the function fails.
 * @see https://learn.microsoft.com/windows/win32/api/wintrust/nf-wintrust-wintrustremoveactionid
 * @since windows5.1.2600
 */
export WintrustRemoveActionID(pgActionID) {
    result := DllCall("WINTRUST.dll\WintrustRemoveActionID", Guid.Ptr, pgActionID, BOOL)
    return result
}

/**
 * Loads function entry points for a specified action GUID. This function has no associated import library.
 * @param {Pointer<Guid>} pgActionID A pointer to a <b>GUID</b> structure that identifies the action whose function pointers are being loaded and the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/t-gly">trust provider</a> that supports that action.
 * 
 * The WinTrust service is designed to work with trust providers implemented by third parties. Each trust provider provides its own unique set of action identifiers. For information about the action identifiers supported by a trust provider, see the documentation for that trust provider.
 * 
 * For example, Microsoft provides a Software Publisher Trust Provider that can establish the trustworthiness of software being downloaded from the Internet or some other public network. The Software Publisher Trust Provider supports the following action identifiers. These constants are defined in Softpub.h.
 * 
 * <table>
 * <tr>
 * <th>Value</th>
 * <th>Meaning</th>
 * </tr>
 * <tr>
 * <td width="40%"><a id="WINTRUST_ACTION_GENERIC_VERIFY"></a><a id="wintrust_action_generic_verify"></a><dl>
 * <dt><b>WINTRUST_ACTION_GENERIC_VERIFY</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Verify a certificate chain only.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="WINTRUST_ACTION_GENERIC_VERIFY_V2"></a><a id="wintrust_action_generic_verify_v2"></a><dl>
 * <dt><b>WINTRUST_ACTION_GENERIC_VERIFY_V2</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Verify a file or object using the Authenticode policy provider.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="HTTPSPROV_ACTION"></a><a id="httpsprov_action"></a><dl>
 * <dt><b>HTTPSPROV_ACTION</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Verify an SSL/PCT connection through Internet Explorer.
 * 
 * </td>
 * </tr>
 * </table>
 * @param {Pointer<CRYPT_PROVIDER_FUNCTIONS>} pPfns A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/wintrust/ns-wintrust-crypt_provider_functions">CRYPT_PROVIDER_FUNCTIONS</a> structure that receives the addresses of the function pointers.
 * @returns {BOOL} The return value is <b>TRUE</b> if the function succeeds; <b>FALSE</b> if the function fails.
 * @see https://learn.microsoft.com/windows/win32/api/wintrust/nf-wintrust-wintrustloadfunctionpointers
 * @since windows5.1.2600
 */
export WintrustLoadFunctionPointers(pgActionID, pPfns) {
    result := DllCall("WINTRUST.dll\WintrustLoadFunctionPointers", Guid.Ptr, pgActionID, CRYPT_PROVIDER_FUNCTIONS.Ptr, pPfns, BOOL)
    return result
}

/**
 * Specifies the default usage identifier and callback information for a provider.
 * @remarks
 * If the provider uses this function and requires any of the callback data, the provider must completely fill out the <a href="https://docs.microsoft.com/windows/desktop/api/wintrust/ns-wintrust-crypt_provider_regdefusage">CRYPT_PROVIDER_REGDEFUSAGE</a> structure.
 * 
 * The usage and callback information can be retrieved by calling the <a href="https://docs.microsoft.com/windows/desktop/api/wintrust/nf-wintrust-wintrustgetdefaultforusage">WintrustGetDefaultForUsage</a> function.
 * @param {PSTR} pszUsageOID Pointer to a string that contains the identifier.
 * @param {Pointer<CRYPT_PROVIDER_REGDEFUSAGE>} psDefUsage Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wintrust/ns-wintrust-crypt_provider_regdefusage">CRYPT_PROVIDER_REGDEFUSAGE</a> structure that contains callback information.
 * @returns {BOOL} The return value is <b>TRUE</b> if the function succeeds; <b>FALSE</b>  if the function fails.   If the function fails, call the <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function  to determine the reason for failure.
 * @see https://learn.microsoft.com/windows/win32/api/wintrust/nf-wintrust-wintrustadddefaultforusage
 * @since windows5.1.2600
 */
export WintrustAddDefaultForUsage(pszUsageOID, psDefUsage) {
    pszUsageOID := pszUsageOID is String ? StrPtr(pszUsageOID) : pszUsageOID

    A_LastError := 0

    result := DllCall("WINTRUST.dll\WintrustAddDefaultForUsage", "ptr", pszUsageOID, CRYPT_PROVIDER_REGDEFUSAGE.Ptr, psDefUsage, BOOL)
    if(!result && A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * Retrieves the default usage identifier and callback information.
 * @remarks
 * Call this function once with the <i>dwAction</i> parameter set to <b>DWACTION_ALLOCANDFILL</b> to allocate memory and fill a <a href="https://docs.microsoft.com/windows/desktop/api/wintrust/ns-wintrust-crypt_provider_defusage">CRYPT_PROVIDER_DEFUSAGE</a> structure with information. Call this function again with the <i>dwAction</i> parameter set to <b>DWACTION_FREE</b> to free the allocated memory.
 * 
 * The default usage and callback information for a provider is registered by calling the <a href="https://docs.microsoft.com/windows/desktop/api/wintrust/nf-wintrust-wintrustadddefaultforusage">WintrustAddDefaultForUsage</a> function.
 * @param {WINTRUST_GET_DEFAULT_FOR_USAGE_ACTION} dwAction 
 * @param {PSTR} pszUsageOID Pointer to a string that contains the identifier.
 * @param {Pointer<CRYPT_PROVIDER_DEFUSAGE>} psUsage Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wintrust/ns-wintrust-crypt_provider_defusage">CRYPT_PROVIDER_DEFUSAGE</a> structure that contains callback information to be retrieved.
 * @returns {BOOL} The return value is <b>TRUE</b> if the function succeeds; <b>FALSE</b>  if the function fails.   If the function fails, call the <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function  to determine the reason for failure.
 * @see https://learn.microsoft.com/windows/win32/api/wintrust/nf-wintrust-wintrustgetdefaultforusage
 * @since windows5.1.2600
 */
export WintrustGetDefaultForUsage(dwAction, pszUsageOID, psUsage) {
    pszUsageOID := pszUsageOID is String ? StrPtr(pszUsageOID) : pszUsageOID

    A_LastError := 0

    result := DllCall("WINTRUST.dll\WintrustGetDefaultForUsage", WINTRUST_GET_DEFAULT_FOR_USAGE_ACTION, dwAction, "ptr", pszUsageOID, CRYPT_PROVIDER_DEFUSAGE.Ptr, psUsage, BOOL)
    if(!result && A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * Retrieves a signer or countersigner by index from the chain.
 * @param {Pointer<CRYPT_PROVIDER_DATA>} pProvData A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/wintrust/ns-wintrust-crypt_provider_data">CRYPT_PROVIDER_DATA</a> structure that contains the signer and countersigner information.
 * @param {Integer} idxSigner The index of the signer. The index is zero based.
 * @param {BOOL} fCounterSigner If <b>TRUE</b>, the countersigner, as specified by <i>idxCounterSigner</i>, is retrieved by this function; the signer that contains the countersigner is identified by  <i>idxSigner</i>. If <b>FALSE</b>, the signer, as specified by <i>idxSigner</i>, is retrieved by this function.
 * @param {Integer} idxCounterSigner The index of the countersigner. The index is zero based. The countersigner applies to the signer identified by <i>idxSigner</i>.
 * @returns {Pointer<CRYPT_PROVIDER_SGNR>} If the function succeeds, the function returns a pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wintrust/ns-wintrust-crypt_provider_sgnr">CRYPT_PROVIDER_SGNR</a> structure for the requested signer or countersigner.
 * 
 * If the function fails, it returns <b>NULL</b>.
 * @see https://learn.microsoft.com/windows/win32/api/wintrust/nf-wintrust-wthelpergetprovsignerfromchain
 * @since windows5.1.2600
 */
export WTHelperGetProvSignerFromChain(pProvData, idxSigner, fCounterSigner, idxCounterSigner) {
    result := DllCall("WINTRUST.dll\WTHelperGetProvSignerFromChain", CRYPT_PROVIDER_DATA.Ptr, pProvData, "uint", idxSigner, BOOL, fCounterSigner, "uint", idxCounterSigner, CRYPT_PROVIDER_SGNR.Ptr)
    return result
}

/**
 * Retrieves a trust provider certificate from the certificate chain.
 * @param {Pointer<CRYPT_PROVIDER_SGNR>} pSgnr A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wintrust/ns-wintrust-crypt_provider_sgnr">CRYPT_PROVIDER_SGNR</a> structure that represents the signers. This pointer is retrieved by the <a href="https://docs.microsoft.com/windows/desktop/api/wintrust/nf-wintrust-wthelpergetprovsignerfromchain">WTHelperGetProvSignerFromChain</a> function.
 * @param {Integer} idxCert The index of the certificate. The index is zero based.
 * @returns {Pointer<CRYPT_PROVIDER_CERT>} If the function succeeds, the function returns a pointer to a  <a href="https://docs.microsoft.com/windows/desktop/api/wintrust/ns-wintrust-crypt_provider_cert">CRYPT_PROVIDER_CERT</a> structure that represents the trust provider certificate.
 * 
 * If the function fails, it returns <b>NULL</b>.
 * @see https://learn.microsoft.com/windows/win32/api/wintrust/nf-wintrust-wthelpergetprovcertfromchain
 * @since windows5.1.2600
 */
export WTHelperGetProvCertFromChain(pSgnr, idxCert) {
    result := DllCall("WINTRUST.dll\WTHelperGetProvCertFromChain", CRYPT_PROVIDER_SGNR.Ptr, pSgnr, "uint", idxCert, CRYPT_PROVIDER_CERT.Ptr)
    return result
}

/**
 * Retrieves trust provider information from a specified handle.
 * @param {HANDLE} hStateData A handle previously set by the <a href="https://docs.microsoft.com/windows/desktop/api/wintrust/nf-wintrust-winverifytrustex">WinVerifyTrustEx</a> function as the <b>hWVTStateData</b>	 member of the <a href="https://docs.microsoft.com/windows/desktop/api/wintrust/ns-wintrust-wintrust_data">WINTRUST_DATA</a> structure.
 * @returns {Pointer<CRYPT_PROVIDER_DATA>} If the function succeeds, the function returns a pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wintrust/ns-wintrust-crypt_provider_data">CRYPT_PROVIDER_DATA</a> structure. The returned pointer can be used by the <a href="https://docs.microsoft.com/windows/desktop/api/wintrust/nf-wintrust-wthelpergetprovsignerfromchain">WTHelperGetProvSignerFromChain</a>   function.
 * 
 * If the function fails, it returns <b>NULL</b>.
 * @see https://learn.microsoft.com/windows/win32/api/wintrust/nf-wintrust-wthelperprovdatafromstatedata
 * @since windows5.1.2600
 */
export WTHelperProvDataFromStateData(hStateData) {
    result := DllCall("WINTRUST.dll\WTHelperProvDataFromStateData", HANDLE, hStateData, CRYPT_PROVIDER_DATA.Ptr)
    return result
}

/**
 * Receives a CRYPT_PROVIDER_PRIVDATA structure from the chain by using the provider ID.
 * @param {Pointer<CRYPT_PROVIDER_DATA>} pProvData A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wintrust/ns-wintrust-crypt_provider_data">CRYPT_PROVIDER_DATA</a> structure that contains the provider's private information.
 * @param {Pointer<Guid>} pgProviderID A pointer to a <a href="https://docs.microsoft.com/windows/win32/api/guiddef/ns-guiddef-guid">GUID</a> structure that identifies the provider.
 * @returns {Pointer<CRYPT_PROVIDER_PRIVDATA>} If the function succeeds, the function returns a pointer to a  <a href="https://docs.microsoft.com/windows/desktop/api/wintrust/ns-wintrust-crypt_provider_privdata">CRYPT_PROVIDER_PRIVDATA</a> structure that represents the trust provider's private information.
 * 
 * If the function fails, the return value is <b>NULL</b>.
 * @see https://learn.microsoft.com/windows/win32/api/wintrust/nf-wintrust-wthelpergetprovprivatedatafromchain
 * @since windows5.1.2600
 */
export WTHelperGetProvPrivateDataFromChain(pProvData, pgProviderID) {
    result := DllCall("WINTRUST.dll\WTHelperGetProvPrivateDataFromChain", CRYPT_PROVIDER_DATA.Ptr, pProvData, Guid.Ptr, pgProviderID, CRYPT_PROVIDER_PRIVDATA.Ptr)
    return result
}

/**
 * Checks whether a certificate is self-signed.
 * @param {Integer} dwEncoding A <b>DWORD</b> value that specifies the encoding types of the certificate to check. For information about possible encoding types, see <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/certificate-and-message-encoding-types">Certificate and Message Encoding Types</a>.
 * @param {Pointer<CERT_INFO>} pCert A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cert_info">CERT_INFO</a> structure that contains information about  the certificate to check.
 * @returns {BOOL} If the function succeeds, the function returns <b>TRUE</b>.
 * 
 * If the function fails, it returns <b>FALSE</b>.
 * @see https://learn.microsoft.com/windows/win32/api/wintrust/nf-wintrust-wthelpercertisselfsigned
 * @since windows5.1.2600
 */
export WTHelperCertIsSelfSigned(dwEncoding, pCert) {
    result := DllCall("WINTRUST.dll\WTHelperCertIsSelfSigned", "uint", dwEncoding, CERT_INFO.Ptr, pCert, BOOL)
    return result
}

/**
 * Checks whether a signature is valid.
 * @param {Pointer<CRYPT_PROVIDER_DATA>} pProvData A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/wintrust/ns-wintrust-crypt_provider_data">CRYPT_PROVIDER_DATA</a> structure that contains the signer and countersigner information.
 * @returns {HRESULT} If the function succeeds, the function returns S_OK.
 * 
 * If the function fails, it returns an <b>HRESULT</b> value that indicates the error. For a list of possible error values, see <a href="https://docs.microsoft.com/windows/desktop/api/wintrust/nf-wintrust-winverifytrust">WinVerifyTrust</a>.
 * @see https://learn.microsoft.com/windows/win32/api/wintrust/nf-wintrust-wthelpercertcheckvalidsignature
 * @since windows6.0.6000
 */
export WTHelperCertCheckValidSignature(pProvData) {
    result := DllCall("WINTRUST.dll\WTHelperCertCheckValidSignature", CRYPT_PROVIDER_DATA.Ptr, pProvData, "HRESULT")
    return result
}

/**
 * Displays the Certificates dialog box. (OpenPersonalTrustDBDialogEx)
 * @param {HWND} hwndParent The handle of the parent window for the dialog box. If this parameter is <b>NULL</b>, the dialog box has no parent.
 * @param {Integer} dwFlags A set of flags that modify the behavior of this function. This can be zero or the following value.
 * 
 * <table>
 * <tr>
 * <th>Value</th>
 * <th>Meaning</th>
 * </tr>
 * <tr>
 * <td width="40%"><a id="WT_TRUSTDBDIALOG_ONLY_PUB_TAB_FLAG"></a><a id="wt_trustdbdialog_only_pub_tab_flag"></a><dl>
 * <dt><b>WT_TRUSTDBDIALOG_ONLY_PUB_TAB_FLAG</b></dt>
 * <dt>2 (0x2)</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Only display the          <b>Trusted Publisher</b> tab. By default, all of the user interface tabs are displayed and the <b>Trusted Publisher</b> tab is initially selected.
 * 
 * </td>
 * </tr>
 * </table>
 * @param {Pointer<Pointer<Void>>} pvReserved Not used. Must be <b>NULL</b>.
 * @returns {BOOL} Returns nonzero if the dialog box was opened successfully or zero otherwise.
 * @see https://learn.microsoft.com/windows/win32/api/wintrust/nf-wintrust-openpersonaltrustdbdialogex
 * @since windows5.1.2600
 */
export OpenPersonalTrustDBDialogEx(hwndParent, dwFlags, pvReserved) {
    pvReservedMarshal := pvReserved is VarRef ? "ptr*" : "ptr"

    result := DllCall("WINTRUST.dll\OpenPersonalTrustDBDialogEx", HWND, hwndParent, "uint", dwFlags, pvReservedMarshal, pvReserved, BOOL)
    return result
}

/**
 * Displays the Certificates dialog box. (OpenPersonalTrustDBDialog)
 * @param {HWND} hwndParent The handle of the parent window for the dialog box. If this parameter is <b>NULL</b>, the dialog box has no parent.
 * @returns {BOOL} Returns nonzero if the dialog box was opened successfully or zero otherwise.
 * @see https://learn.microsoft.com/windows/win32/api/wintrust/nf-wintrust-openpersonaltrustdbdialog
 * @since windows5.1.2600
 */
export OpenPersonalTrustDBDialog(hwndParent) {
    result := DllCall("WINTRUST.dll\OpenPersonalTrustDBDialog", HWND, hwndParent, BOOL)
    return result
}

/**
 * Sets the default setting that determines whether page hashes are included when creating subject interface package (SIP) indirect data for PE files.
 * @remarks
 * This setting applies to each instance of Wintrust.dll.
 * @param {BOOL} fIncludePEPageHashes Determines whether page hashes are included when creating SIP indirect data for PE files. If this parameter is nonzero, page hashes are included. If this parameter is zero, page hashes are not included. The value is zero by default.
 * @returns {String} Nothing - always returns an empty string
 * @see https://learn.microsoft.com/windows/win32/api/wintrust/nf-wintrust-wintrustsetdefaultincludepepagehashes
 * @since windows6.0.6000
 */
export WintrustSetDefaultIncludePEPageHashes(fIncludePEPageHashes) {
    DllCall("WINTRUST.dll\WintrustSetDefaultIncludePEPageHashes", BOOL, fIncludePEPageHashes)
}

;@endregion Functions
