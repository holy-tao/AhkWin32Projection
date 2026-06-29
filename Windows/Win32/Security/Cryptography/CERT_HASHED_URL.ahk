#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\CRYPT_INTEGER_BLOB.ahk" { CRYPT_INTEGER_BLOB }
#Import ".\CRYPT_ALGORITHM_IDENTIFIER.ahk" { CRYPT_ALGORITHM_IDENTIFIER }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * Contains a hashed URL.
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-cert_hashed_url
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CERT_HASHED_URL {
    #StructPack 8

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-crypt_algorithm_identifier">CRYPT_ALGORITHM_IDENTIFIER</a> structure that specifies the hash algorithm used to create the URL hash.
     */
    HashAlgorithm : CRYPT_ALGORITHM_IDENTIFIER

    /**
     * A <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa381414(v=vs.85)">CRYPT_HASH_BLOB</a> structure that contains the hash value.
     */
    Hash : CRYPT_INTEGER_BLOB

    /**
     * The address of a null-terminated Unicode string that contains the URL. This member is optional for biometric data and may be <b>NULL</b>.
     */
    pwszUrl : PWSTR

}
