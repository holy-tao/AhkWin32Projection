#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\CTL_USAGE.ahk
#Include .\CERT_USAGE_MATCH.ahk

/**
 * The CERT_CHAIN_PARA structure establishes the searching and matching criteria to be used in building a certificate chain.
 * @remarks
 * 
 * The following remarks apply when checking for strong signatures.
 * 
 * <ul>
 * <li>
 * Set the <b>pStrongSignPara</b> member to check for strong signatures when using the <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/nf-wincrypt-certgetcertificatechain">CertGetCertificateChain</a> or <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/nf-wincrypt-certselectcertificatechains">CertSelectCertificateChains</a> function.
 * 
 * </li>
 * <li>
 * If a certificate without a strong signature is found in the chain, the <b>CERT_TRUST_HAS_WEAK_SIGNATURE</b> and <b>CERT_TRUST_IS_NOT_SIGNATURE_VALID</b> errors are set in the <b>dwErrorStatus</b> field of the <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cert_trust_status">CERT_TRUST_STATUS</a> structure. The <i>ppChainContext</i> parameter of the <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/nf-wincrypt-certgetcertificatechain">CertGetCertificateChain</a> function and the <i>pprgpSelection</i> parameter of the <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/nf-wincrypt-certselectcertificatechains">CertSelectCertificateChains</a> function point to a <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cert_chain_context">CERT_CHAIN_CONTEXT</a> structure which, in turn, points to the  <b>CERT_TRUST_STATUS</b> structure.
 * 
 * </li>
 * <li>
 * If the chain is strong signed, the public key in the end certificate is checked to determine whether it  satisfies the minimum public key length requirements for a strong signature.  If the condition is not satisfied, the <b>CERT_TRUST_HAS_WEAK_SIGNATURE</b> and <b>CERT_TRUST_IS_NOT_SIGNATURE_VALID</b> errors are set in the <b>dwErrorStatus</b> field of the <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cert_trust_status">CERT_TRUST_STATUS</a> structure. Set the <b>CERT_CHAIN_STRONG_SIGN_DISABLE_END_CHECK_FLAG</b> value in the <b>dwStrongSignFlags</b> member to disable this check.
 * 
 * </li>
 * <li>
 * If the <b>CERT_STRONG_SIGN_ENABLE_CRL_CHECK</b> or <b>CERT_STRONG_SIGN_ENABLE_OCSP_CHECK</b> flags are set in the <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cert_strong_sign_serialized_info">CERT_STRONG_SIGN_SERIALIZED_INFO</a> structure referenced by the <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cert_strong_sign_para">CERT_STRONG_SIGN_PARA</a> structure pointed to by the <b>pStrongSignPara</b> member, and a CRL or OCSP response is found without a strong signature, the CRL or OCSP response will be treated as being offline. That is, the <b>CERT_TRUST_IS_OFFLINE_REVOCATION</b> and <b>CERT_TRUST_REVOCATION_STATUS_UNKNOWN</b> errors are set in the <b>dwErrorStatus</b> field of the <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cert_trust_status">CERT_TRUST_STATUS</a> structure. Also, the <b>dwRevocationResult</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cert_revocation_info">CERT_REVOCATION_INFO</a> structure is set to <b>NTE_BAD_ALGID</b>.  
 * 
 * </li>
 * </ul>
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//wincrypt/ns-wincrypt-cert_chain_para
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class CERT_CHAIN_PARA extends Win32Struct
{
    static sizeof => 96

    static packingSize => 8

    /**
     * The size, in bytes, of this structure.
     * @type {Integer}
     */
    cbSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Structure indicating the kind of matching necessary to find issuer certificates for building a certificate chain. The structure pointed to indicates whether AND or OR logic is to be used in the matching process. The structure also includes an array of OIDs to be matched.
     * @type {CERT_USAGE_MATCH}
     */
    RequestedUsage{
        get {
            if(!this.HasProp("__RequestedUsage"))
                this.__RequestedUsage := CERT_USAGE_MATCH(8, this)
            return this.__RequestedUsage
        }
    }

    /**
     * Optional structure that indicates the kind of issuance policy constraint matching that applies when building a certificate chain. The structure pointed to indicates whether AND or OR logic is to be used in the matching process. The structure also includes an array of OIDs to be matched.
     * 
     * <div class="alert"><b>Note</b>  This member can be used only if <b>CERT_CHAIN_PARA_HAS_EXTRA_FIELDS</b> is defined by using the <b>#define</b> directive before including Wincrypt.h. If this value is defined, the application must zero all unused fields.</div>
     * <div> </div>
     * @type {CERT_USAGE_MATCH}
     */
    RequestedIssuancePolicy{
        get {
            if(!this.HasProp("__RequestedIssuancePolicy"))
                this.__RequestedIssuancePolicy := CERT_USAGE_MATCH(32, this)
            return this.__RequestedIssuancePolicy
        }
    }

    /**
     * Optional time, in milliseconds, before revocation checking times out. This member is optional.
     * 
     * <div class="alert"><b>Note</b>  This member can be used only if <b>CERT_CHAIN_PARA_HAS_EXTRA_FIELDS</b> is defined by using the <b>#define</b> directive before including Wincrypt.h. If this value is defined, the application must zero all unused fields.</div>
     * <div> </div>
     * @type {Integer}
     */
    dwUrlRetrievalTimeout {
        get => NumGet(this, 56, "uint")
        set => NumPut("uint", value, this, 56)
    }

    /**
     * Optional member. When this flag is <b>TRUE</b>, an attempt is made to retrieve a new CRL if this update is greater than or equal to the current system time minus the <b>dwRevocationFreshnessTime</b> value. If this flag is not set, the CRL's next update time is used.
     * 
     * <div class="alert"><b>Note</b>  This member can be used only if <b>CERT_CHAIN_PARA_HAS_EXTRA_FIELDS</b> is defined by using the <b>#define</b> directive before including Wincrypt.h. If this value is defined, the application must zero all unused fields.</div>
     * <div> </div>
     * @type {BOOL}
     */
    fCheckRevocationFreshnessTime {
        get => NumGet(this, 60, "int")
        set => NumPut("int", value, this, 60)
    }

    /**
     * The current time, in seconds, minus the CRL's update time of all elements checked.
     * 
     * <div class="alert"><b>Note</b>  This member can be used only if <b>CERT_CHAIN_PARA_HAS_EXTRA_FIELDS</b> is defined by using the <b>#define</b> directive before including Wincrypt.h. If this value is defined, the application must zero all unused fields.</div>
     * <div> </div>
     * @type {Integer}
     */
    dwRevocationFreshnessTime {
        get => NumGet(this, 64, "uint")
        set => NumPut("uint", value, this, 64)
    }

    /**
     * Optional member. When set to a non-<b>NULL</b>  value, information cached before  the time specified is considered to be not valid and cache resynchronization is performed.
     * 
     * <b>Windows Vista:  </b>Support for this member begins.
     * 
     * <div class="alert"><b>Note</b>  This member can be used only if <b>CERT_CHAIN_PARA_HAS_EXTRA_FIELDS</b> is defined by using the <b>#define</b> directive before including Wincrypt.h. If this value is defined, the application must zero all unused fields.</div>
     * <div> </div>
     * @type {Pointer<FILETIME>}
     */
    pftCacheResync {
        get => NumGet(this, 72, "ptr")
        set => NumPut("ptr", value, this, 72)
    }

    /**
     * Optional. Specify a pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cert_strong_sign_para">CERT_STRONG_SIGN_PARA</a> structure to enable strong signature checking.
     * 
     * <b>Windows 8 and Windows Server 2012:  </b>Support for this member begins.
     * 
     * <div class="alert"><b>Note</b>  This member can be used only if <b>CERT_CHAIN_PARA_HAS_EXTRA_FIELDS</b> is defined by using the <b>#define</b> directive before including Wincrypt.h. If this value is defined, the application must zero all unused fields.</div>
     * <div> </div>
     * @type {Pointer<CERT_STRONG_SIGN_PARA>}
     */
    pStrongSignPara {
        get => NumGet(this, 80, "ptr")
        set => NumPut("ptr", value, this, 80)
    }

    /**
     * Optional flags that modify chain retrieval behavior. This can be zero or the following value.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CERT_CHAIN_STRONG_SIGN_DISABLE_END_CHECK_FLAG"></a><a id="cert_chain_strong_sign_disable_end_check_flag"></a><dl>
     * <dt><b>CERT_CHAIN_STRONG_SIGN_DISABLE_END_CHECK_FLAG</b></dt>
     * <dt>0x00000001</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * If the chain is strong signed, the public key in the end certificate will be checked to verify whether it satisfies the minimum public key length requirements for a strong signature. You can specify <b>CERT_CHAIN_STRONG_SIGN_DISABLE_END_CHECK_FLAG</b> to disable default checking.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * <b>Windows 8 and Windows Server 2012:  </b>Support for this property begins.
     * 
     * <div class="alert"><b>Note</b>  This member can be used only if <b>CERT_CHAIN_PARA_HAS_EXTRA_FIELDS</b> is defined by using the <b>#define</b> directive before including Wincrypt.h. If this value is defined, the application must zero all unused fields.</div>
     * <div> </div>
     * @type {Integer}
     */
    dwStrongSignFlags {
        get => NumGet(this, 88, "uint")
        set => NumPut("uint", value, this, 88)
    }

    __New(ptrOrObj := 0, parent := ""){
        super.__New(ptrOrObj, parent)
        this.cbSize := 96
    }
}
