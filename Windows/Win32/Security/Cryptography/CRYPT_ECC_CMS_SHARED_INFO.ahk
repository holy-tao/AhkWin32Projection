#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CRYPT_INTEGER_BLOB.ahk" { CRYPT_INTEGER_BLOB }
#Import ".\CRYPT_ALGORITHM_IDENTIFIER.ahk" { CRYPT_ALGORITHM_IDENTIFIER }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * Represents key-encryption key information when using Elliptic Curve Cryptography (ECC) in the Cryptographic Message Syntax (CMS) EnvelopedData content type.
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-crypt_ecc_cms_shared_info
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CRYPT_ECC_CMS_SHARED_INFO {
    #StructPack 8

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-crypt_algorithm_identifier">CRYPT_ALGORITHM_IDENTIFIER</a> structure that contains the object identifier of the key-encryption algorithm used to wrap the content-encryption key.
     */
    Algorithm : CRYPT_ALGORITHM_IDENTIFIER

    /**
     * An optional member that contains additional user keying material as an octet string supplied by the sending agent.
     */
    EntityUInfo : CRYPT_INTEGER_BLOB

    /**
     * An array of four bytes that represent the length, in bits, of the key-encryption key. The byte array is in <a href="https://docs.microsoft.com/windows/desktop/SecGloss/l-gly">little-endian</a> order.
     * 
     * 
     * The following table contains the definition of the array dimension.
     */
    rgbSuppPubInfo : Int8[4]

}
