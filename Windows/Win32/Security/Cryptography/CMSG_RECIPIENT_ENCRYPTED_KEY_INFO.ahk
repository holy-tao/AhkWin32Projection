#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CERT_ID_OPTION.ahk" { CERT_ID_OPTION }
#Import ".\CRYPT_INTEGER_BLOB.ahk" { CRYPT_INTEGER_BLOB }
#Import ".\CRYPT_ATTRIBUTE_TYPE_VALUE.ahk" { CRYPT_ATTRIBUTE_TYPE_VALUE }
#Import "..\..\Foundation\FILETIME.ahk" { FILETIME }
#Import ".\CERT_ISSUER_SERIAL_NUMBER.ahk" { CERT_ISSUER_SERIAL_NUMBER }
#Import ".\CERT_ID.ahk" { CERT_ID }

/**
 * The CMSG_RECIPIENT_ENCRYPTED_KEY_INFO structure contains information used for an individual key agreement recipient.
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-cmsg_recipient_encrypted_key_info
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CMSG_RECIPIENT_ENCRYPTED_KEY_INFO {
    #StructPack 8

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cert_id">CERT_ID</a> structure identifying the recipient. Currently, only the ISSUER_SERIAL_NUMBER or KEYID choices in the <b>CERT_ID</b> structure are valid.
     */
    RecipientId : CERT_ID

    /**
     * A <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa381414(v=vs.85)">CRYPT_DATA_BLOB</a> structure that contains the encrypted content encryption key.
     */
    EncryptedKey : CRYPT_INTEGER_BLOB

    /**
     * Optional. When present, this member specifies which of the recipient's previously distributed UKMs was used by the sender. Only applicable to KEYID choice in the <b>RecipientId </b><a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cert_id">CERT_ID</a> structure.
     */
    Date : FILETIME

    /**
     * Optional pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-crypt_attribute_type_value">CRYPT_ATTRIBUTE_TYPE_VALUE</a> structure containing additional information. Only applicable to KEYID choice in the <b>RecipientId </b><a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cert_id">CERT_ID</a> structure.
     */
    pOtherAttr : CRYPT_ATTRIBUTE_TYPE_VALUE.Ptr

}
