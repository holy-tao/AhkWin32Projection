#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CRYPT_INTEGER_BLOB.ahk" { CRYPT_INTEGER_BLOB }
#Import ".\CRYPT_ALGORITHM_IDENTIFIER.ahk" { CRYPT_ALGORITHM_IDENTIFIER }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * Contains the information in a PKCS
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-crypt_encrypted_private_key_info
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CRYPT_ENCRYPTED_PRIVATE_KEY_INFO {
    #StructPack 8

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-crypt_algorithm_identifier">CRYPT_ALGORITHM_IDENTIFIER</a> structure that indicates the algorithm used for encryption.
     */
    EncryptionAlgorithm : CRYPT_ALGORITHM_IDENTIFIER

    /**
     * A <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa381414(v=vs.85)">CRYPT_DATA_BLOB</a> structure that contains the encrypted private key data.
     */
    EncryptedPrivateKey : CRYPT_INTEGER_BLOB

}
