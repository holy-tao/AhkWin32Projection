#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\CRYPT_INTEGER_BLOB.ahk" { CRYPT_INTEGER_BLOB }
#Import "..\CRYPT_ATTRIBUTE_TYPE_VALUE.ahk" { CRYPT_ATTRIBUTE_TYPE_VALUE }
#Import "..\CRYPT_ALGORITHM_IDENTIFIER.ahk" { CRYPT_ALGORITHM_IDENTIFIER }
#Import "..\..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * Contains the digest of the hashed subject information.
 * @see https://learn.microsoft.com/windows/win32/api/mssip/ns-mssip-sip_indirect_data
 * @namespace Windows.Win32.Security.Cryptography.Sip
 */
export default struct SIP_INDIRECT_DATA {
    #StructPack 8

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-crypt_attribute_type_value">CRYPT_ATTRIBUTE_TYPE_VALUE</a> structure used to encode the attribute.
     */
    Data : CRYPT_ATTRIBUTE_TYPE_VALUE

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-crypt_algorithm_identifier">CRYPT_ALGORITHM_IDENTIFIER</a> structure that contains the digest algorithm to use to create the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/h-gly">hash</a>.
     */
    DigestAlgorithm : CRYPT_ALGORITHM_IDENTIFIER

    /**
     * A <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa381414(v=vs.85)">CRYPT_HASH_BLOB</a> structure that contains the hash of the subject. For information about <b>CRYPT_HASH_BLOB</b>, see <b>CRYPT_INTEGER_BLOB</b>.
     */
    Digest : CRYPT_INTEGER_BLOB

}
