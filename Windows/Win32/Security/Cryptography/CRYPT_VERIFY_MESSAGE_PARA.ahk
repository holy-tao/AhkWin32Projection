#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\HCRYPTPROV_LEGACY.ahk" { HCRYPTPROV_LEGACY }

/**
 * The CRYPT_VERIFY_MESSAGE_PARA structure contains information needed to verify signed messages.
 * @remarks
 * This structure is passed to the following functions:
 * 
 * <ul>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/nf-wincrypt-cryptdecodemessage">CryptDecodeMessage</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/nf-wincrypt-cryptdecryptandverifymessagesignature">CryptDecryptAndVerifyMessageSignature</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/nf-wincrypt-cryptverifydetachedmessagesignature">CryptVerifyDetachedMessageSignature</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/nf-wincrypt-cryptverifymessagesignature">CryptVerifyMessageSignature</a>
 * </li>
 * </ul>
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-crypt_verify_message_para
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CRYPT_VERIFY_MESSAGE_PARA {
    #StructPack 8

    /**
     * Size of this structure in bytes.
     */
    cbSize : UInt32 := this.Size

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
    dwMsgAndCertEncodingType : UInt32

    /**
     * This member is not used and should be set to <b>NULL</b>.
     * 
     * <b>Windows Server 2003 and Windows XP:  </b>A handle to the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">cryptographic service provider</a> to be used to verify a signed message. The CSP identified by this handle is used for <a href="https://docs.microsoft.com/windows/desktop/SecGloss/h-gly">hashing</a> and for signature verification.Unless there is a strong reason for using a specific cryptographic provider, set to  zero to use the default RSA or DSS provider.
     * 
     * This member's data type is <b>HCRYPTPROV</b>.
     */
    hCryptProv : HCRYPTPROV_LEGACY

    /**
     * A pointer to the callback function used to get the signer's certificate <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">context</a>. If <b>NULL</b>, the default callback is used. The default callback tries to get the signer <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">certificate context</a> from the message's <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">certificate store</a>.
     * 
     * An application defined–callback function that gets the signer's certificate can be used in place of the default. It is passed the certificate identifier of the signer (its issuer and serial number) and a handle to its cryptographic signed message's certificate store.
     * 
     * See <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/nc-wincrypt-pfn_crypt_get_signer_certificate">CryptGetSignerCertificateCallback</a> for the callback functions signature and arguments.
     */
    pfnGetSignerCertificate : IntPtr

    /**
     * Argument to pass to the callback function. Typically, this gets and verifies the message signer's certificate.
     */
    pvGetArg : IntPtr

}
