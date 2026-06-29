#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CRYPT_INTEGER_BLOB.ahk" { CRYPT_INTEGER_BLOB }
#Import ".\CRYPT_ATTRIBUTE_TYPE_VALUE.ahk" { CRYPT_ATTRIBUTE_TYPE_VALUE }
#Import "..\..\Foundation\FILETIME.ahk" { FILETIME }
#Import ".\CRYPT_ALGORITHM_IDENTIFIER.ahk" { CRYPT_ALGORITHM_IDENTIFIER }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * The CMSG_MAIL_LIST_RECIPIENT_ENCODE_INFO structure is used with previously distributed symmetric keys for decrypting the content key encryption key (KEK).
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-cmsg_mail_list_recipient_encode_info
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CMSG_MAIL_LIST_RECIPIENT_ENCODE_INFO {
    #StructPack 8

    /**
     * The size, in bytes, of this data structure.
     */
    cbSize : UInt32 := this.Size

    /**
     * A 
     * 						<a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-crypt_algorithm_identifier">CRYPT_ALGORITHM_IDENTIFIER</a> structure that indicates the encryption algorithm used.
     */
    KeyEncryptionAlgorithm : CRYPT_ALGORITHM_IDENTIFIER

    /**
     * A pointer to a structure that contains any additional encryption information.
     */
    pvKeyEncryptionAuxInfo : IntPtr

    /**
     * The provider used to do the recipient key encryption and export. If <b>NULL</b>, the provider specified in <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cmsg_enveloped_encode_info">CMSG_ENVELOPED_ENCODE_INFO</a> is used.
     */
    hCryptProv : IntPtr

    /**
     * Indicates which member of the following union will be used. Currently only CMSG_MAIL_LIST_HANDLE_KEY_CHOICE can be used.
     */
    dwKeyChoice : UInt32

    hKeyEncryptionKey : IntPtr

    /**
     * A <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa381414(v=vs.85)">CRYPT_DATA_BLOB</a> key identifier of the key-encryption key that was previously distributed to the message sender and one or more recipients.
     */
    KeyId : CRYPT_INTEGER_BLOB

    /**
     * Optional <b>FILETIME</b> value. When present, specifies a single key encryption key (KEK) from a set that was previously distributed.
     */
    Date : FILETIME

    /**
     * Optional pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-crypt_attribute_type_value">CRYPT_ATTRIBUTE_TYPE_VALUE</a> structure that contains encryption attributes.
     */
    pOtherAttr : CRYPT_ATTRIBUTE_TYPE_VALUE.Ptr

    static __New() {
        DefineProp(this.Prototype, 'pvKeyEncryptionKey', { type: IntPtr, offset: 56 })
        this.DeleteProp("__New")
    }
}
