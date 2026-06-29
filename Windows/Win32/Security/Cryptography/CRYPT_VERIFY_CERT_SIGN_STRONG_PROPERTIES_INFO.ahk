#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CRYPT_INTEGER_BLOB.ahk" { CRYPT_INTEGER_BLOB }

/**
 * Contains the length, in bits, of the public key and the names of the signing and hashing algorithms used for strong signing.
 * @remarks
 * This structure is returned by the <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/nf-wincrypt-cryptverifycertificatesignatureex">CryptVerifyCertificateSignatureEx</a> function when the <i>dwFlags</i> parameter is set to <b>CRYPT_VERIFY_CERT_SIGN_RETURN_STRONG_PROPERTIES_FLAG</b>.
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-crypt_verify_cert_sign_strong_properties_info
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CRYPT_VERIFY_CERT_SIGN_STRONG_PROPERTIES_INFO {
    #StructPack 8

    /**
     * The buffer contains a Unicode string that denotes the signing algorithm / hashing algorithm pair used, for example "RSA/SHA256".
     */
    CertSignHashCNGAlgPropData : CRYPT_INTEGER_BLOB

    /**
     * The buffer contains the length, in bits, of the asymmetric key used for signing.
     */
    CertIssuerPubKeyBitLengthPropData : CRYPT_INTEGER_BLOB

}
