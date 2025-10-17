#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\HCRYPTPROV_LEGACY.ahk

/**
 * Contains information needed to verify signed messages without a certificate for the signer.
 * @see https://docs.microsoft.com/windows/win32/api//wincrypt/ns-wincrypt-crypt_key_verify_message_para
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class CRYPT_KEY_VERIFY_MESSAGE_PARA extends Win32Struct
{
    static sizeof => 16

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
    dwMsgEncodingType {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * This member is not used and should be set to <b>NULL</b>.
     * 
     * <b>Windows Server 2003 and Windows XP:  </b>A handle to the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">cryptographic service provider</a> (CSP) to be used to verify a signed message. The CSP identified by this handle is used for <a href="https://docs.microsoft.com/windows/desktop/SecGloss/h-gly">hashing</a> and for signature verification.Unless there is a strong reason for using a specific cryptographic provider, set this member to  zero to use the default RSA or DSS provider.
     * 
     * This member's data type is <b>HCRYPTPROV</b>.
     * @type {HCRYPTPROV_LEGACY}
     */
    hCryptProv{
        get {
            if(!this.HasProp("__hCryptProv"))
                this.__hCryptProv := HCRYPTPROV_LEGACY(8, this)
            return this.__hCryptProv
        }
    }

    __New(ptrOrObj := 0, parent := ""){
        super.__New(ptrOrObj, parent)
        this.cbSize := 16
    }
}
