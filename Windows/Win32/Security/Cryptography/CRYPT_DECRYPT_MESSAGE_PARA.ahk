#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\HCERTSTORE.ahk" { HCERTSTORE }

/**
 * The CRYPT_DECRYPT_MESSAGE_PARA structure contains information for decrypting messages.
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-crypt_decrypt_message_para
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CRYPT_DECRYPT_MESSAGE_PARA {
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
     * Number of elements in the <b>rghCertStore</b> array.
     */
    cCertStore : UInt32

    /**
     * Array of <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">certificate store</a> handles. 
     * 
     * 
     * 
     * 
     * These certificate store handles are used to obtain the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">certificate context</a> to use for decrypting a message. For more information, see the decryption functions 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/nf-wincrypt-cryptdecryptmessage">CryptDecryptMessage</a>, and 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/nf-wincrypt-cryptdecryptandverifymessagesignature">CryptDecryptAndVerifyMessageSignature</a>. An encrypted message can have one or more recipients. The recipients are identified by a unique certificate identifier, often the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/h-gly">hash</a> of the certificate issuer and serial number. The certificate stores are searched to find a certificate context corresponding to the unique identifier.
     * 
     * Recipients can also be identified by their KeyId. Both Key Agreement (Diffie-Hellman) and Key Transport (RSA) recipients are supported.
     * 
     * Only certificate contexts in the store with one of the following properties, CERT_KEY_PROV_INFO_PROP_ID, or CERT_KEY_CONTEXT_PROP_ID can be used. These properties specify the location of a needed private exchange key.
     */
    rghCertStore : HCERTSTORE.Ptr

}
