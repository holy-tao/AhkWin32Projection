#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\Cryptography\CERT_CONTEXT.ahk" { CERT_CONTEXT }
#Import "..\Cryptography\CERT_CHAIN_ELEMENT.ahk" { CERT_CHAIN_ELEMENT }
#Import "..\Cryptography\CTL_CONTEXT.ahk" { CTL_CONTEXT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * Provides information about a provider certificate.
 * @see https://learn.microsoft.com/windows/win32/api/wintrust/ns-wintrust-crypt_provider_cert
 * @namespace Windows.Win32.Security.WinTrust
 */
export default struct CRYPT_PROVIDER_CERT {
    #StructPack 8

    /**
     * The size, in bytes, of this structure.
     */
    cbStruct : UInt32

    /**
     * A pointer to the certificate context.
     */
    pCert : CERT_CONTEXT.Ptr

    /**
     * Boolean value that indicates whether the certificate is a commercial certificate.
     */
    fCommercial : BOOL

    /**
     * Boolean value that indicates whether the certificate is a trusted root certificate.
     */
    fTrustedRoot : BOOL

    /**
     * Boolean value that indicates whether the certificate is self-signed.
     */
    fSelfSigned : BOOL

    /**
     * Boolean value that indicates whether the certificate is a test certificate.
     */
    fTestCert : BOOL

    /**
     * Value that specifies the revocation reason, if applicable.
     */
    dwRevokedReason : UInt32

    /**
     * Bitwise combination of zero or more of the following confidence values.
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CERT_CONFIDENCE_SIG"></a><a id="cert_confidence_sig"></a><dl>
     * <dt><b>CERT_CONFIDENCE_SIG</b></dt>
     * <dt>             0x10000000</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The signature of the certificate is valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CERT_CONFIDENCE_TIME"></a><a id="cert_confidence_time"></a><dl>
     * <dt><b>CERT_CONFIDENCE_TIME</b></dt>
     * <dt>            0x01000000</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The time of the certificate issuer is valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CERT_CONFIDENCE_TIMENEST"></a><a id="cert_confidence_timenest"></a><dl>
     * <dt><b>CERT_CONFIDENCE_TIMENEST</b></dt>
     * <dt>0x00100000</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The time of the certificate is valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CERT_CONFIDENCE_AUTHIDEXT"></a><a id="cert_confidence_authidext"></a><dl>
     * <dt><b>CERT_CONFIDENCE_AUTHIDEXT</b></dt>
     * <dt>0x00010000</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The authority ID extension is valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CERT_CONFIDENCE_HYGIENE"></a><a id="cert_confidence_hygiene"></a><dl>
     * <dt><b>CERT_CONFIDENCE_HYGIENE</b></dt>
     * <dt>0x00001000</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * At a minimum, the signature of the certificate and authority ID extension are valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CERT_CONFIDENCE_HIGHEST"></a><a id="cert_confidence_highest"></a><dl>
     * <dt><b>CERT_CONFIDENCE_HIGHEST</b></dt>
     * <dt>0x11111000</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Combination of all of the other confidence values.
     * 
     * </td>
     * </tr>
     * </table>
     */
    dwConfidence : UInt32

    /**
     * A pointer to a <b>DWORD</b> variable that contains the error value for this certificate, if applicable.
     */
    dwError : UInt32

    /**
     * A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-ctl_context">CTL_CONTEXT</a> that represents the certificate trust list (CTL).
     */
    pTrustListContext : CTL_CONTEXT.Ptr

    /**
     * Boolean value that specifies whether the certificate is a trust list signer certificate.
     */
    fTrustListSignerCert : BOOL

    /**
     * A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-ctl_context">CTL_CONTEXT</a> that represents a CTL that contains a self-signed certificate, if applicable.
     */
    pCtlContext : CTL_CONTEXT.Ptr

    /**
     * A pointer to a <b>DWORD</b> variable that contains the error value for a CTL that contains a self-signed certificate, if applicable.
     */
    dwCtlError : UInt32

    /**
     * Boolean value that indicates whether the certificate trust is cyclical.
     */
    fIsCyclic : BOOL

    /**
     * A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cert_chain_element">CERT_CHAIN_ELEMENT</a> that represents the status of the certificate within a chain.
     */
    pChainElement : CERT_CHAIN_ELEMENT.Ptr

}
