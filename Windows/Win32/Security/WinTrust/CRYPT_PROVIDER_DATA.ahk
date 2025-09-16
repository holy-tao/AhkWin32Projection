#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\FILETIME.ahk

/**
 * Used to pass data between WinVerifyTrust and trust providers.
 * @see https://learn.microsoft.com/windows/win32/api/wintrust/ns-wintrust-crypt_provider_data
 * @namespace Windows.Win32.Security.WinTrust
 * @version v4.0.30319
 */
class CRYPT_PROVIDER_DATA extends Win32Struct
{
    static sizeof => 240

    static packingSize => 8

    /**
     * The size, in bytes, of this structure.
     * @type {Integer}
     */
    cbStruct {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wintrust/ns-wintrust-wintrust_data">WINTRUST_DATA</a> structure that contains the information to verify.
     * @type {Pointer<WINTRUST_DATA>}
     */
    pWintrustData {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * A Boolean value that indicates whether the trust provider opened the file handle, if applicable.
     * @type {Integer}
     */
    fOpenedFile {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }

    /**
     * A handle to the parent window. If not specified, a handle to the desktop  window is used.
     * @type {Pointer<HWND>}
     */
    hWndParent {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * A pointer to a <b>GUID</b> structure that identifies an action and the trust provider that supports that action.
     * @type {Pointer<Guid>}
     */
    pgActionID {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * A handle to the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">cryptographic service provider</a> (CSP). If this parameter is <b>NULL</b>, then the operating system will provide a default CSP.
     * @type {Pointer}
     */
    hProv {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * An error level if a low-level system error was encountered.
     * @type {Integer}
     */
    dwError {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * The registry security settings.
     * @type {Integer}
     */
    dwRegSecuritySettings {
        get => NumGet(this, 52, "uint")
        set => NumPut("uint", value, this, 52)
    }

    /**
     * The registry policy settings.
     * @type {Integer}
     */
    dwRegPolicySettings {
        get => NumGet(this, 56, "uint")
        set => NumPut("uint", value, this, 56)
    }

    /**
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wintrust/ns-wintrust-crypt_provider_functions">CRYPT_PROVIDER_FUNCTIONS</a> structure.
     * @type {Pointer<CRYPT_PROVIDER_FUNCTIONS>}
     */
    psPfns {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
    }

    /**
     * The number of elements in the <b>padwTrustStepErrors</b> array.
     * @type {Integer}
     */
    cdwTrustStepErrors {
        get => NumGet(this, 72, "uint")
        set => NumPut("uint", value, this, 72)
    }

    /**
     * An array of <b>DWORD</b> values that specify trust step errors.
     * @type {Pointer<UInt32>}
     */
    padwTrustStepErrors {
        get => NumGet(this, 80, "ptr")
        set => NumPut("ptr", value, this, 80)
    }

    /**
     * The number of elements in the <b>pahStores</b> array.
     * @type {Integer}
     */
    chStores {
        get => NumGet(this, 88, "uint")
        set => NumPut("uint", value, this, 88)
    }

    /**
     * An array of certificate store handles.
     * @type {Pointer<HCERTSTORE>}
     */
    pahStores {
        get => NumGet(this, 96, "ptr")
        set => NumPut("ptr", value, this, 96)
    }

    /**
     * A value that specifies the encoding type.
     * @type {Integer}
     */
    dwEncoding {
        get => NumGet(this, 104, "uint")
        set => NumPut("uint", value, this, 104)
    }

    /**
     * A  handle to the cryptographic message.
     * @type {Pointer<Void>}
     */
    hMsg {
        get => NumGet(this, 112, "ptr")
        set => NumPut("ptr", value, this, 112)
    }

    /**
     * The number of elements in the <b>pasSigners</b> array.
     * @type {Integer}
     */
    csSigners {
        get => NumGet(this, 120, "uint")
        set => NumPut("uint", value, this, 120)
    }

    /**
     * A pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/wintrust/ns-wintrust-crypt_provider_sgnr">CRYPT_PROVIDER_SGNR</a> structures.
     * @type {Pointer<CRYPT_PROVIDER_SGNR>}
     */
    pasSigners {
        get => NumGet(this, 128, "ptr")
        set => NumPut("ptr", value, this, 128)
    }

    /**
     * The number of elements in the <b>pasProvPrivData</b> array.
     * @type {Integer}
     */
    csProvPrivData {
        get => NumGet(this, 136, "uint")
        set => NumPut("uint", value, this, 136)
    }

    /**
     * A pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/wintrust/ns-wintrust-crypt_provider_privdata">CRYPT_PROVIDER_PRIVDATA</a> structures.
     * @type {Pointer<CRYPT_PROVIDER_PRIVDATA>}
     */
    pasProvPrivData {
        get => NumGet(this, 144, "ptr")
        set => NumPut("ptr", value, this, 144)
    }

    /**
     * A value that specifies the subject choice.
     * @type {Integer}
     */
    dwSubjectChoice {
        get => NumGet(this, 152, "uint")
        set => NumPut("uint", value, this, 152)
    }

    /**
     * @type {Pointer<_Anonymous_e__Union>}
     */
    Anonymous {
        get => NumGet(this, 160, "ptr")
        set => NumPut("ptr", value, this, 160)
    }

    /**
     * A pointer to a null-terminated string that contains the usage <a href="https://docs.microsoft.com/windows/desktop/SecGloss/o-gly">object identifier</a> (OID).
     * @type {Pointer<PSTR>}
     */
    pszUsageOID {
        get => NumGet(this, 168, "ptr")
        set => NumPut("ptr", value, this, 168)
    }

    /**
     * A Boolean value that indicates whether state was maintained for catalog files.
     * @type {Integer}
     */
    fRecallWithState {
        get => NumGet(this, 176, "int")
        set => NumPut("int", value, this, 176)
    }

    /**
     * The system time.
     * @type {FILETIME}
     */
    sftSystemTime{
        get {
            if(!this.HasProp("__sftSystemTime"))
                this.__sftSystemTime := FILETIME(this.ptr + 184)
            return this.__sftSystemTime
        }
    }

    /**
     * A pointer to a null-terminated string that represents the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">certificate trust list</a> (CTL) signer usage OID.
     * @type {Pointer<PSTR>}
     */
    pszCTLSignerUsageOID {
        get => NumGet(this, 192, "ptr")
        set => NumPut("ptr", value, this, 192)
    }

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
     * @type {Integer}
     */
    dwProvFlags {
        get => NumGet(this, 200, "uint")
        set => NumPut("uint", value, this, 200)
    }

    /**
     * A value for the final error.
     * @type {Integer}
     */
    dwFinalError {
        get => NumGet(this, 204, "uint")
        set => NumPut("uint", value, this, 204)
    }

    /**
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cert_usage_match">CERT_USAGE_MATCH</a> structure.
     * @type {Pointer<CERT_USAGE_MATCH>}
     */
    pRequestUsage {
        get => NumGet(this, 208, "ptr")
        set => NumPut("ptr", value, this, 208)
    }

    /**
     * A value for the trust publisher settings.
     * @type {Integer}
     */
    dwTrustPubSettings {
        get => NumGet(this, 216, "uint")
        set => NumPut("uint", value, this, 216)
    }

    /**
     * A <b>DWORD</b> value that specifies state data that is passed between a trust provider and the user interface.
     * 
     * <b>Windows XP with SP1 and Windows XP:  </b>This member is ignored.
     * @type {Integer}
     */
    dwUIStateFlags {
        get => NumGet(this, 220, "uint")
        set => NumPut("uint", value, this, 220)
    }

    /**
     * 
     * @type {Pointer<CRYPT_PROVIDER_SIGSTATE>}
     */
    pSigState {
        get => NumGet(this, 224, "ptr")
        set => NumPut("ptr", value, this, 224)
    }

    /**
     * 
     * @type {Pointer<WINTRUST_SIGNATURE_SETTINGS>}
     */
    pSigSettings {
        get => NumGet(this, 232, "ptr")
        set => NumPut("ptr", value, this, 232)
    }
}
