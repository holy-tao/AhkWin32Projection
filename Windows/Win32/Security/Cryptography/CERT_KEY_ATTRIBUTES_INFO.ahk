#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CRYPT_INTEGER_BLOB.ahk" { CRYPT_INTEGER_BLOB }
#Import ".\CERT_PRIVATE_KEY_VALIDITY.ahk" { CERT_PRIVATE_KEY_VALIDITY }
#Import ".\CRYPT_BIT_BLOB.ahk" { CRYPT_BIT_BLOB }

/**
 * The CERT_KEY_ATTRIBUTES_INFO structure contains optional additional information about the public key being certified.
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-cert_key_attributes_info
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CERT_KEY_ATTRIBUTES_INFO {
    #StructPack 8

    /**
     * A <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa381414(v=vs.85)">CRYPT_DATA_BLOB</a> structure with a unique identifier of a key.
     */
    KeyId : CRYPT_INTEGER_BLOB

    /**
     * <b>CRYPT_BIT_BLOB</b> with it <b>pbData</b> member indicating the intended purpose of the key. For a list of usage bit values, see the <b>RestrictedKeyUsage</b> member of 
     * the <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cert_key_usage_restriction_info">CERT_KEY_USAGE_RESTRICTION_INFO</a> structure. 
     * 
     * 
     * 
     * 
     * This member can be used to find the correct key or certificate of a user who has multiple keys or certificates. Its indication of usage is advisory field, only, and does not imply that usage of the key is restricted to the purpose indicated. The list of intended uses is not necessarily all-inclusive, and the field can be omitted. If a key is to be restricted to a particular use a <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cert_key_usage_restriction_info">CERT_KEY_USAGE_RESTRICTION_INFO</a> extension must be used.
     */
    IntendedKeyUsage : CRYPT_BIT_BLOB

    /**
     * A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cert_private_key_validity">CERT_PRIVATE_KEY_VALIDITY</a> structure that indicates the period of use of the private key corresponding to the certified public key. This member is optional and can be set to <b>NULL</b>.
     */
    pPrivateKeyUsagePeriod : CERT_PRIVATE_KEY_VALIDITY.Ptr

}
