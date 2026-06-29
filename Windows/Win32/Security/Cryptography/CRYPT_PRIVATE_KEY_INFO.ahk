#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CRYPT_ATTRIBUTES.ahk" { CRYPT_ATTRIBUTES }
#Import ".\CRYPT_INTEGER_BLOB.ahk" { CRYPT_INTEGER_BLOB }
#Import ".\CRYPT_ALGORITHM_IDENTIFIER.ahk" { CRYPT_ALGORITHM_IDENTIFIER }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * Contains a clear-text private key in the PrivateKey field (DER encoded). CRYPT_PRIVATE_KEY_INFO contains the information in a PKCS
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-crypt_private_key_info
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CRYPT_PRIVATE_KEY_INFO {
    #StructPack 8

    /**
     * A <b>DWORD</b>  value that identifies the PKCS #8 version.
     */
    Version : UInt32

    /**
     * A  <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-crypt_algorithm_identifier">CRYPT_ALGORITHM_IDENTIFIER</a>  structure that indicates the algorithm in which the private key (RSA or DSA) is to be used.
     */
    Algorithm : CRYPT_ALGORITHM_IDENTIFIER

    /**
     * A <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa381414(v=vs.85)">CRYPT_DER_BLOB</a> structure that contains the key data.
     */
    PrivateKey : CRYPT_INTEGER_BLOB

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-crypt_attributes">CRYPT_ATTRIBUTES</a>  structure that identifies the PKCS #8 attributes.
     */
    pAttributes : CRYPT_ATTRIBUTES.Ptr

}
