#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CRYPT_INTEGER_BLOB.ahk" { CRYPT_INTEGER_BLOB }
#Import ".\CRYPT_ALGORITHM_IDENTIFIER.ahk" { CRYPT_ALGORITHM_IDENTIFIER }
#Import ".\CRYPT_BIT_BLOB.ahk" { CRYPT_BIT_BLOB }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * Contains a public key and its algorithm.
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-cert_public_key_info
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CERT_PUBLIC_KEY_INFO {
    #StructPack 8

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-crypt_algorithm_identifier">CRYPT_ALGORITHM_IDENTIFIER</a> structure that contains the public key algorithm type and associated additional parameters.
     */
    Algorithm : CRYPT_ALGORITHM_IDENTIFIER

    /**
     * BLOB containing an encoded public key.
     */
    PublicKey : CRYPT_BIT_BLOB

}
