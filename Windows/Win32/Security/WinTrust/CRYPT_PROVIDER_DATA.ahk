#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CRYPT_PROVIDER_SIGSTATE.ahk" { CRYPT_PROVIDER_SIGSTATE }
#Import ".\WINTRUST_DATA.ahk" { WINTRUST_DATA }
#Import ".\CRYPT_PROVIDER_PRIVDATA.ahk" { CRYPT_PROVIDER_PRIVDATA }
#Import ".\CRYPT_PROVIDER_FUNCTIONS.ahk" { CRYPT_PROVIDER_FUNCTIONS }
#Import ".\PROVDATA_SIP.ahk" { PROVDATA_SIP }
#Import "..\Cryptography\CERT_USAGE_MATCH.ahk" { CERT_USAGE_MATCH }
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import ".\CRYPT_PROVIDER_SGNR.ahk" { CRYPT_PROVIDER_SGNR }
#Import "..\..\Foundation\FILETIME.ahk" { FILETIME }
#Import "..\Cryptography\HCERTSTORE.ahk" { HCERTSTORE }
#Import ".\WINTRUST_SIGNATURE_SETTINGS.ahk" { WINTRUST_SIGNATURE_SETTINGS }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * Used to pass data between WinVerifyTrust and trust providers.
 * @see https://learn.microsoft.com/windows/win32/api/wintrust/ns-wintrust-crypt_provider_data
 * @namespace Windows.Win32.Security.WinTrust
 */
export default struct CRYPT_PROVIDER_DATA {
    #StructPack 8

    /**
     * The size, in bytes, of this structure.
     */
    cbStruct : UInt32

    /**
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wintrust/ns-wintrust-wintrust_data">WINTRUST_DATA</a> structure that contains the information to verify.
     */
    pWintrustData : WINTRUST_DATA.Ptr

    /**
     * A Boolean value that indicates whether the trust provider opened the file handle, if applicable.
     */
    fOpenedFile : BOOL

    /**
     * A handle to the parent window. If not specified, a handle to the desktop  window is used.
     */
    hWndParent : HWND

    /**
     * A pointer to a <b>GUID</b> structure that identifies an action and the trust provider that supports that action.
     */
    pgActionID : Guid.Ptr

    /**
     * A handle to the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">cryptographic service provider</a> (CSP). If this parameter is <b>NULL</b>, then the operating system will provide a default CSP.
     */
    hProv : IntPtr

    /**
     * An error level if a low-level system error was encountered.
     */
    dwError : UInt32

    /**
     * The registry security settings.
     */
    dwRegSecuritySettings : UInt32

    /**
     * The registry policy settings.
     */
    dwRegPolicySettings : UInt32

    /**
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wintrust/ns-wintrust-crypt_provider_functions">CRYPT_PROVIDER_FUNCTIONS</a> structure.
     */
    psPfns : CRYPT_PROVIDER_FUNCTIONS.Ptr

    /**
     * The number of elements in the <b>padwTrustStepErrors</b> array.
     */
    cdwTrustStepErrors : UInt32

    /**
     * An array of <b>DWORD</b> values that specify trust step errors.
     */
    padwTrustStepErrors : IntPtr

    /**
     * The number of elements in the <b>pahStores</b> array.
     */
    chStores : UInt32

    /**
     * An array of certificate store handles.
     */
    pahStores : HCERTSTORE.Ptr

    /**
     * A value that specifies the encoding type.
     */
    dwEncoding : UInt32

    /**
     * A  handle to the cryptographic message.
     */
    hMsg : IntPtr

    /**
     * The number of elements in the <b>pasSigners</b> array.
     */
    csSigners : UInt32

    /**
     * A pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/wintrust/ns-wintrust-crypt_provider_sgnr">CRYPT_PROVIDER_SGNR</a> structures.
     */
    pasSigners : CRYPT_PROVIDER_SGNR.Ptr

    /**
     * The number of elements in the <b>pasProvPrivData</b> array.
     */
    csProvPrivData : UInt32

    /**
     * A pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/wintrust/ns-wintrust-crypt_provider_privdata">CRYPT_PROVIDER_PRIVDATA</a> structures.
     */
    pasProvPrivData : CRYPT_PROVIDER_PRIVDATA.Ptr

    /**
     * A value that specifies the subject choice.
     */
    dwSubjectChoice : UInt32

    pPDSip : PROVDATA_SIP.Ptr

    /**
     * A pointer to a null-terminated string that contains the usage <a href="https://docs.microsoft.com/windows/desktop/SecGloss/o-gly">object identifier</a> (OID).
     */
    pszUsageOID : PSTR

    /**
     * A Boolean value that indicates whether state was maintained for catalog files.
     */
    fRecallWithState : BOOL

    /**
     * The system time.
     */
    sftSystemTime : FILETIME

    /**
     * A pointer to a null-terminated string that represents the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">certificate trust list</a> (CTL) signer usage OID.
     */
    pszCTLSignerUsageOID : PSTR

    /**
     * A bitwise combination of one or more of the following flags.
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CPD_USE_NT5_CHAIN_FLAG"></a><a id="cpd_use_nt5_chain_flag"></a><dl>
     * <dt><b>CPD_USE_NT5_CHAIN_FLAG</b></dt>
     * <dt>0x80000000</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Use Windows 2000 chaining.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CPD_REVOCATION_CHECK_NONE"></a><a id="cpd_revocation_check_none"></a><dl>
     * <dt><b>CPD_REVOCATION_CHECK_NONE</b></dt>
     * <dt>0x00010000</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No revocation checking is performed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CPD_REVOCATION_CHECK_END_CERT"></a><a id="cpd_revocation_check_end_cert"></a><dl>
     * <dt><b>CPD_REVOCATION_CHECK_END_CERT</b></dt>
     * <dt>0x00020000</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Revocation checking for the end certificate is performed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CPD_REVOCATION_CHECK_CHAIN"></a><a id="cpd_revocation_check_chain"></a><dl>
     * <dt><b>CPD_REVOCATION_CHECK_CHAIN</b></dt>
     * <dt>0x00040000</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Revocation checking for the  certificate chain is performed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CPD_REVOCATION_CHECK_CHAIN_EXCLUDE_ROOT"></a><a id="cpd_revocation_check_chain_exclude_root"></a><dl>
     * <dt><b>CPD_REVOCATION_CHECK_CHAIN_EXCLUDE_ROOT</b></dt>
     * <dt>0x00080000</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Revocation checking for the  certificate chain, excluding the root certificate,  is performed.
     * 
     * </td>
     * </tr>
     * </table>
     */
    dwProvFlags : UInt32

    /**
     * A value for the final error.
     */
    dwFinalError : UInt32

    /**
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cert_usage_match">CERT_USAGE_MATCH</a> structure.
     */
    pRequestUsage : CERT_USAGE_MATCH.Ptr

    /**
     * A value for the trust publisher settings.
     */
    dwTrustPubSettings : UInt32

    /**
     * A <b>DWORD</b> value that specifies state data that is passed between a trust provider and the user interface.
     * 
     * <b>Windows XP with SP1 and Windows XP:  </b>This member is ignored.
     */
    dwUIStateFlags : UInt32

    pSigState : CRYPT_PROVIDER_SIGSTATE.Ptr

    pSigSettings : WINTRUST_SIGNATURE_SETTINGS.Ptr

}
