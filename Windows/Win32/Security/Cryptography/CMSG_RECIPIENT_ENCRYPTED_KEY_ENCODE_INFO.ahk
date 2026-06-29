#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CRYPT_INTEGER_BLOB.ahk" { CRYPT_INTEGER_BLOB }
#Import ".\CERT_ID_OPTION.ahk" { CERT_ID_OPTION }
#Import ".\CRYPT_ATTRIBUTE_TYPE_VALUE.ahk" { CRYPT_ATTRIBUTE_TYPE_VALUE }
#Import ".\CERT_ISSUER_SERIAL_NUMBER.ahk" { CERT_ISSUER_SERIAL_NUMBER }
#Import ".\CERT_ID.ahk" { CERT_ID }
#Import ".\CRYPT_BIT_BLOB.ahk" { CRYPT_BIT_BLOB }
#Import "..\..\Foundation\FILETIME.ahk" { FILETIME }

/**
 * Contains information on a message receiver used to decrypt the session key needed to decrypt the message contents.
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-cmsg_recipient_encrypted_key_encode_info
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CMSG_RECIPIENT_ENCRYPTED_KEY_ENCODE_INFO {
    #StructPack 8

    /**
     * The size, in bytes, of this data structure.
     */
    cbSize : UInt32 := this.Size

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-crypt_bit_blob">CRYPT_BIT_BLOB</a> structure that contains the recipient's public key.
     */
    RecipientPublicKey : CRYPT_BIT_BLOB

    /**
     * The <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cert_id">CERT_ID</a> that identifies a message recipient's public key.
     */
    RecipientId : CERT_ID

    /**
     * Optional <b>FILETIME</b>. Applicable only if the <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cert_id">CERT_ID</a> identifies the receiver's public key with a KEY_IDENTIFIER.
     */
    Date : FILETIME

    /**
     * Optional. Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-crypt_attribute_type_value">CRYPT_ATTRIBUTE_TYPE_VALUE</a>. Applicable only if the CERT_ID identifies the receiver's public key with a KEY_IDENTIFIER.
     */
    pOtherAttr : CRYPT_ATTRIBUTE_TYPE_VALUE.Ptr

}
