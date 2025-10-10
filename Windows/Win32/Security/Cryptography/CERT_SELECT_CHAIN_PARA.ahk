#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains the parameters used for building and selecting chains.
 * @remarks
 * 
  * Trust in a particular certificate being a trusted root is based on the current state of the root store and not the state of the root store at a time passed in by this parameter. For revocation, a certificate revocation list (CRL), itself, must be valid at the current time. The value of this parameter is used to determine whether a certificate listed in a CRL has been revoked.
  * 
  * The following remarks apply to strong signature checking:
  * 
  * <ul>
  * <li>You can enable strong signature checking by using the <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cert_chain_para">CERT_CHAIN_PARA</a> structure referenced by the <b>pChainPara</b> member. The <b>pStrongSignPara</b> member of the <b>CERT_CHAIN_PARA</b> structure points to a <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cert_strong_sign_para">CERT_STRONG_SIGN_PARA</a> structure that can be used to determine signature strength.</li>
  * <li>When you enable strong checking and a weak signature is encountered, the <b>CERT_TRUST_IS_NOT_SIGNATURE_VALID</b> and <b>CERT_TRUST_HAS_WEAK_SIGNATURE</b> errors are set in the <b>dwErrorStatus</b> field of the <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cert_trust_status">CERT_TRUST_STATUS</a> structure.</li>
  * </ul>
  * 
 * @see https://docs.microsoft.com/windows/win32/api//wincrypt/ns-wincrypt-cert_select_chain_para
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class CERT_SELECT_CHAIN_PARA extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * The handle of the chain engine to use to build the chain. If the value of the <i>hChainEngine</i> parameter is <b>NULL</b>, the default chain engine, <b>HCCE_CURRENT_USER</b>, is used.
     * @type {Pointer<Void>}
     */
    hChainEngine {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a> structure that contains the time for which the chain is to be validated. If the  value of the <i>pTime</i> parameter is <b>NULL</b>, the current system time is passed to this parameter. 
     * 
     * <div class="alert"><b>Note</b>  The time does not affect trust list, revocation, or root store checking.</div>
     * <div> </div>
     * @type {Pointer<FILETIME>}
     */
    pTime {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * The handle of any additional store to search for supporting certificates and certificate trust lists (CTLs). This parameter can be <b>NULL</b> if no additional store is to be searched.
     * @type {Pointer<Void>}
     */
    hAdditionalStore {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cert_chain_para">CERT_CHAIN_PARA</a> structure that includes chain-building parameters.
     * @type {Pointer<CERT_CHAIN_PARA>}
     */
    pChainPara {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * Flag values that indicate special processing during chain build. 
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CERT_CHAIN_REVOCATION_CHECK_CACHE_ONLY"></a><a id="cert_chain_revocation_check_cache_only"></a><dl>
     * <dt><b>CERT_CHAIN_REVOCATION_CHECK_CACHE_ONLY</b></dt>
     * <dt>0x00000004</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Revocation checking only accesses cached URLs.
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CERT_CHAIN_CACHE_ONLY_URL_RETRIEVAL"></a><a id="cert_chain_cache_only_url_retrieval"></a><dl>
     * <dt><b>CERT_CHAIN_CACHE_ONLY_URL_RETRIEVAL</b></dt>
     * <dt>0x80000000</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Use only cached URLs in building a certificate chain. The Internet and intranet are not searched for URL-based objects.
     * 
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }
}
