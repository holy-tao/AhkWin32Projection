#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\CRYPT_INTEGER_BLOB.ahk

/**
 * Contains the length, in bits, of the public key and the names of the signing and hashing algorithms used for strong signing.
 * @remarks
 * This structure is returned by the <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/nf-wincrypt-cryptverifycertificatesignatureex">CryptVerifyCertificateSignatureEx</a> function when the <i>dwFlags</i> parameter is set to <b>CRYPT_VERIFY_CERT_SIGN_RETURN_STRONG_PROPERTIES_FLAG</b>.
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-crypt_verify_cert_sign_strong_properties_info
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class CRYPT_VERIFY_CERT_SIGN_STRONG_PROPERTIES_INFO extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * The buffer contains a Unicode string that denotes the signing algorithm / hashing algorithm pair used, for example "RSA/SHA256".
     * @type {CRYPT_INTEGER_BLOB}
     */
    CertSignHashCNGAlgPropData{
        get {
            if(!this.HasProp("__CertSignHashCNGAlgPropData"))
                this.__CertSignHashCNGAlgPropData := CRYPT_INTEGER_BLOB(0, this)
            return this.__CertSignHashCNGAlgPropData
        }
    }

    /**
     * The buffer contains the length, in bits, of the asymmetric key used for signing.
     * @type {CRYPT_INTEGER_BLOB}
     */
    CertIssuerPubKeyBitLengthPropData{
        get {
            if(!this.HasProp("__CertIssuerPubKeyBitLengthPropData"))
                this.__CertIssuerPubKeyBitLengthPropData := CRYPT_INTEGER_BLOB(16, this)
            return this.__CertIssuerPubKeyBitLengthPropData
        }
    }
}
