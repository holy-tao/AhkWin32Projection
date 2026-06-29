#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CRYPT_INTEGER_BLOB.ahk" { CRYPT_INTEGER_BLOB }
#Import ".\CRYPT_ATTRIBUTE_TYPE_VALUE.ahk" { CRYPT_ATTRIBUTE_TYPE_VALUE }
#Import "..\..\Foundation\FILETIME.ahk" { FILETIME }
#Import ".\CRYPT_ALGORITHM_IDENTIFIER.ahk" { CRYPT_ALGORITHM_IDENTIFIER }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * Contains information used for previously distributed symmetric key-encryption keys (KEK).
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-cmsg_mail_list_recipient_info
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CMSG_MAIL_LIST_RECIPIENT_INFO {
    #StructPack 8

    /**
     * Indicates the version of the structure. This member is always four.
     */
    dwVersion : UInt32

    /**
     * A <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa381414(v=vs.85)">CRYPT_DATA_BLOB</a> structure that identifies a <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">symmetric key</a>-encryption key previously distributed to the sender and one or more recipients.
     */
    KeyId : CRYPT_INTEGER_BLOB

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-crypt_algorithm_identifier">CRYPT_ALGORITHM_IDENTIFIER</a> that identifies the key-encryption algorithm and any associated parameters used to encrypt the content encryption key.
     */
    KeyEncryptionAlgorithm : CRYPT_ALGORITHM_IDENTIFIER

    /**
     * A <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa381414(v=vs.85)">CRYPT_DATA_BLOB</a> structure that contains the encrypted content encryption key.
     */
    EncryptedKey : CRYPT_INTEGER_BLOB

    /**
     * Optional. When present, this member specifies a single key-encryption key from a previously distributed set.
     */
    Date : FILETIME

    /**
     * Optional pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-crypt_attribute_type_value">CRYPT_ATTRIBUTE_TYPE_VALUE</a> structure containing additional information.
     */
    pOtherAttr : CRYPT_ATTRIBUTE_TYPE_VALUE.Ptr

}
