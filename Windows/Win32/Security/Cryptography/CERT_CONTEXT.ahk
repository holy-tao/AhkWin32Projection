#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CERT_QUERY_ENCODING_TYPE.ahk" { CERT_QUERY_ENCODING_TYPE }
#Import ".\HCERTSTORE.ahk" { HCERTSTORE }
#Import ".\CERT_INFO.ahk" { CERT_INFO }

/**
 * Contains both the encoded and decoded representations of a certificate.
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-cert_context
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CERT_CONTEXT {
    #StructPack 8

    /**
     * Type of encoding used. It is always acceptable to specify both the certificate and <a href="https://docs.microsoft.com/windows/desktop/SecGloss/m-gly">message encoding types</a> by combining them with a bitwise-<b>OR</b> operation as shown in the following example:
     * 
     * X509_ASN_ENCODING | PKCS_7_ASN_ENCODING Currently defined encoding types are:
     * 
     * <ul>
     * <li>X509_ASN_ENCODING</li>
     * <li>PKCS_7_ASN_ENCODING</li>
     * </ul>
     */
    dwCertEncodingType : CERT_QUERY_ENCODING_TYPE

    /**
     * A pointer to a buffer that contains the encoded certificate.
     */
    pbCertEncoded : IntPtr

    /**
     * The size, in bytes, of the encoded certificate.
     */
    cbCertEncoded : UInt32

    /**
     * The address of a <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cert_info">CERT_INFO</a> structure that contains the certificate information.
     */
    pCertInfo : CERT_INFO.Ptr

    /**
     * A handle to the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">certificate store</a> that contains the certificate <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">context</a>.
     */
    hCertStore : HCERTSTORE

}
