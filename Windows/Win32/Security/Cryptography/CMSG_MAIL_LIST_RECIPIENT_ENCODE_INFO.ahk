#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\CRYPT_INTEGER_BLOB.ahk
#Include .\CRYPT_ALGORITHM_IDENTIFIER.ahk
#Include ..\..\Foundation\FILETIME.ahk

/**
 * The CMSG_MAIL_LIST_RECIPIENT_ENCODE_INFO structure is used with previously distributed symmetric keys for decrypting the content key encryption key (KEK).
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-cmsg_mail_list_recipient_encode_info
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class CMSG_MAIL_LIST_RECIPIENT_ENCODE_INFO extends Win32Struct
{
    static sizeof => 96

    static packingSize => 8

    /**
     * The size, in bytes, of this data structure.
     * @type {Integer}
     */
    cbSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * A 
     * 						<a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-crypt_algorithm_identifier">CRYPT_ALGORITHM_IDENTIFIER</a> structure that indicates the encryption algorithm used.
     * @type {CRYPT_ALGORITHM_IDENTIFIER}
     */
    KeyEncryptionAlgorithm{
        get {
            if(!this.HasProp("__KeyEncryptionAlgorithm"))
                this.__KeyEncryptionAlgorithm := CRYPT_ALGORITHM_IDENTIFIER(8, this)
            return this.__KeyEncryptionAlgorithm
        }
    }

    /**
     * A pointer to a structure that contains any additional encryption information.
     * @type {Pointer<Void>}
     */
    pvKeyEncryptionAuxInfo {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * The provider used to do the recipient key encryption and export. If <b>NULL</b>, the provider specified in <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cmsg_enveloped_encode_info">CMSG_ENVELOPED_ENCODE_INFO</a> is used.
     * @type {Pointer}
     */
    hCryptProv {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * Indicates which member of the following union will be used. Currently only CMSG_MAIL_LIST_HANDLE_KEY_CHOICE can be used.
     * @type {Integer}
     */
    dwKeyChoice {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * @type {Pointer}
     */
    hKeyEncryptionKey {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }

    /**
     * @type {Pointer<Void>}
     */
    pvKeyEncryptionKey {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }

    /**
     * A <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa381414(v=vs.85)">CRYPT_DATA_BLOB</a> key identifier of the key-encryption key that was previously distributed to the message sender and one or more recipients.
     * @type {CRYPT_INTEGER_BLOB}
     */
    KeyId{
        get {
            if(!this.HasProp("__KeyId"))
                this.__KeyId := CRYPT_INTEGER_BLOB(64, this)
            return this.__KeyId
        }
    }

    /**
     * Optional <b>FILETIME</b> value. When present, specifies a single key encryption key (KEK) from a set that was previously distributed.
     * @type {FILETIME}
     */
    Date{
        get {
            if(!this.HasProp("__Date"))
                this.__Date := FILETIME(80, this)
            return this.__Date
        }
    }

    /**
     * Optional pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-crypt_attribute_type_value">CRYPT_ATTRIBUTE_TYPE_VALUE</a> structure that contains encryption attributes.
     * @type {Pointer<CRYPT_ATTRIBUTE_TYPE_VALUE>}
     */
    pOtherAttr {
        get => NumGet(this, 88, "ptr")
        set => NumPut("ptr", value, this, 88)
    }

    __New(ptrOrObj := 0, parent := ""){
        super.__New(ptrOrObj, parent)
        this.cbSize := 96
    }
}
