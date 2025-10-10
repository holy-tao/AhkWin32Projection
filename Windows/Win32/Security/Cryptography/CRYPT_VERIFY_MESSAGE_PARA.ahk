#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The CRYPT_VERIFY_MESSAGE_PARA structure contains information needed to verify signed messages.
 * @remarks
 * 
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
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//wincrypt/ns-wincrypt-crypt_verify_message_para
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class CRYPT_VERIFY_MESSAGE_PARA extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * Size of this structure in bytes.
     * @type {Integer}
     */
    cbSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

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
     * @type {Integer}
     */
    dwMsgAndCertEncodingType {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * This member is not used and should be set to <b>NULL</b>.
     * 
     * <b>Windows Server 2003 and Windows XP:  </b>A handle to the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">cryptographic service provider</a> to be used to verify a signed message. The CSP identified by this handle is used for <a href="https://docs.microsoft.com/windows/desktop/SecGloss/h-gly">hashing</a> and for signature verification.Unless there is a strong reason for using a specific cryptographic provider, set to  zero to use the default RSA or DSS provider.
     * 
     * This member's data type is <b>HCRYPTPROV</b>.
     * @type {Pointer}
     */
    hCryptProv {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * A pointer to the callback function used to get the signer's certificate <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">context</a>. If <b>NULL</b>, the default callback is used. The default callback tries to get the signer <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">certificate context</a> from the message's <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">certificate store</a>.
     * 
     * An application defined–callback function that gets the signer's certificate can be used in place of the default. It is passed the certificate identifier of the signer (its issuer and serial number) and a handle to its cryptographic signed message's certificate store.
     * 
     * See <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/nc-wincrypt-pfn_crypt_get_signer_certificate">CryptGetSignerCertificateCallback</a> for the callback functions signature and arguments.
     * @type {Pointer<PFN_CRYPT_GET_SIGNER_CERTIFICATE>}
     */
    pfnGetSignerCertificate {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Argument to pass to the callback function. Typically, this gets and verifies the message signer's certificate.
     * @type {Pointer<Void>}
     */
    pvGetArg {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * Initializes the struct. `cbSize` must always contain the size of the struct.
     * @param {Integer} ptr The location at which to create the struct, or 0 to create a new `Buffer`
     */
    __New(ptr := 0){
        super.__New(ptr)
        this.cbSize := 32
    }
}
