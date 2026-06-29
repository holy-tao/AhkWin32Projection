#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CRL_INFO.ahk" { CRL_INFO }
#Import ".\CERT_QUERY_ENCODING_TYPE.ahk" { CERT_QUERY_ENCODING_TYPE }
#Import ".\HCERTSTORE.ahk" { HCERTSTORE }

/**
 * The CRL_CONTEXT structure contains both the encoded and decoded representations of a certificate revocation list (CRL). CRL contexts returned by any CryptoAPI function must be freed by calling the CertFreeCRLContext function.
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-crl_context
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CRL_CONTEXT {
    #StructPack 8

    /**
     * Type of encoding used. It is always acceptable to specify both the certificate and <a href="https://docs.microsoft.com/windows/desktop/SecGloss/m-gly">message encoding types</a> by combining them with a bitwise-<b>OR</b> operation as shown in the following example:
     * 
     * X509_ASN_ENCODING | PKCS_7_ASN_ENCODING
     * 
     * Currently defined encoding types are:
     * 
     * <ul>
     * <li>X509_ASN_ENCODING</li>
     * <li>PKCS_7_ASN_ENCODING</li>
     * </ul>
     */
    dwCertEncodingType : CERT_QUERY_ENCODING_TYPE

    /**
     * A pointer to the encoded CRL information.
     */
    pbCrlEncoded : IntPtr

    /**
     * The size, in bytes, of the encoded CRL information.
     */
    cbCrlEncoded : UInt32

    /**
     * A pointer to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-crl_info">CRL_INFO</a> structure containing the CRL information.
     */
    pCrlInfo : CRL_INFO.Ptr

    /**
     * A handle to the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">certificate store</a>.
     */
    hCertStore : HCERTSTORE

}
