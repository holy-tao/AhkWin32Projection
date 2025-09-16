#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains parameters used for building a chain for an independent online certificate status protocol (OCSP) response signer certificate.
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-cert_revocation_chain_para
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class CERT_REVOCATION_CHAIN_PARA extends Win32Struct
{
    static sizeof => 56

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
     * A handle to the chain engine used by the caller.
     * @type {Pointer<HCERTCHAINENGINE>}
     */
    hChainEngine {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * A handle to a store that contains the certificates used to build the original chain. The handle can be <b>NULL</b>.
     * @type {Pointer<HCERTSTORE>}
     */
    hAdditionalStore {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * A value for the <i>dwFlags</i> parameter passed to the <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/nf-wincrypt-certgetcertificatechain">CertGetCertificateChain</a> function.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CERT_CHAIN_REVOCATION_CHECK_OCSP_CERT"></a><a id="cert_chain_revocation_check_ocsp_cert"></a><dl>
     * <dt><b>CERT_CHAIN_REVOCATION_CHECK_OCSP_CERT</b></dt>
     * <dt>0x04000000</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This flag will be set by the <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/nf-wincrypt-certverifyrevocation">CertVerifyRevocation</a> provider when it
     * calls <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/nf-wincrypt-certgetcertificatechain">CertGetCertificateChain</a> with an independent OCSP signer certificate.
     * When set, <b>CertGetCertificateChain</b> will call <b>CertVerifyRevocation</b> without
     * setting the pointer to the above <b>CERT_REVOCATION_CHAIN_PARA</b> data structure; this helps to prevent circular revocation checking.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    dwChainFlags {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * A value that contains the time-out limit, in milliseconds. If zero, the revocation handler's default time-out is used.
     * @type {Integer}
     */
    dwUrlRetrievalTimeout {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a> structure used in the freshness time check. If this pointer is <b>NULL</b>, the revocation handler uses the current time.
     * @type {Pointer<FILETIME>}
     */
    pftCurrentTime {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a> structure that governs the use of cached information. Any information cached  before this time is considered invalid and new information is retrieved. When set, this value overrides
     *     the registry configuration CacheResync time.
     * @type {Pointer<FILETIME>}
     */
    pftCacheResync {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * A <b>DWORD</b> value that specifies the maximum number of bytes to download from the URL object. A value of 0 specifies no limit.
     * 
     * <b>Windows Server 2008, Windows Vista, Windows Server 2003 and Windows XP:  </b>This member is not supported.
     * @type {Integer}
     */
    cbMaxUrlRetrievalByteCount {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * Initializes the struct. `cbSize` must always contain the size of the struct.
     * @param {Integer} ptr The location at which to create the struct, or 0 to create a new `Buffer`
     */
    __New(ptr := 0){
        super.__New(ptr)
        this.cbSize := 56
    }
}
