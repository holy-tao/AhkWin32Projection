#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\HCERTCHAINENGINE.ahk" { HCERTCHAINENGINE }
#Import "..\..\Foundation\FILETIME.ahk" { FILETIME }
#Import ".\HCERTSTORE.ahk" { HCERTSTORE }

/**
 * Contains parameters used for building a chain for an independent online certificate status protocol (OCSP) response signer certificate.
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-cert_revocation_chain_para
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CERT_REVOCATION_CHAIN_PARA {
    #StructPack 8

    /**
     * The size, in bytes, of this structure.
     */
    cbSize : UInt32 := this.Size

    /**
     * A handle to the chain engine used by the caller.
     */
    hChainEngine : HCERTCHAINENGINE

    /**
     * A handle to a store that contains the certificates used to build the original chain. The handle can be <b>NULL</b>.
     */
    hAdditionalStore : HCERTSTORE

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
     */
    dwChainFlags : UInt32

    /**
     * A value that contains the time-out limit, in milliseconds. If zero, the revocation handler's default time-out is used.
     */
    dwUrlRetrievalTimeout : UInt32

    /**
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a> structure used in the freshness time check. If this pointer is <b>NULL</b>, the revocation handler uses the current time.
     */
    pftCurrentTime : FILETIME.Ptr

    /**
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a> structure that governs the use of cached information. Any information cached  before this time is considered invalid and new information is retrieved. When set, this value overrides
     *     the registry configuration CacheResync time.
     */
    pftCacheResync : FILETIME.Ptr

    /**
     * A <b>DWORD</b> value that specifies the maximum number of bytes to download from the URL object. A value of 0 specifies no limit.
     * 
     * <b>Windows Server 2008, Windows Vista, Windows Server 2003 and Windows XP:  </b>This member is not supported.
     */
    cbMaxUrlRetrievalByteCount : UInt32

}
