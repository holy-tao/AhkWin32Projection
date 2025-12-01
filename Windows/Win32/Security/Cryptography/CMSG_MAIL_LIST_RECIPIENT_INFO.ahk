#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\CRYPT_INTEGER_BLOB.ahk
#Include .\CRYPT_ALGORITHM_IDENTIFIER.ahk
#Include ..\..\Foundation\FILETIME.ahk

/**
 * Contains information used for previously distributed symmetric key-encryption keys (KEK).
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-cmsg_mail_list_recipient_info
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class CMSG_MAIL_LIST_RECIPIENT_INFO extends Win32Struct
{
    static sizeof => 80

    static packingSize => 8

    /**
     * Indicates the version of the structure. This member is always four.
     * @type {Integer}
     */
    dwVersion {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * A <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa381414(v=vs.85)">CRYPT_DATA_BLOB</a> structure that identifies a <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">symmetric key</a>-encryption key previously distributed to the sender and one or more recipients.
     * @type {CRYPT_INTEGER_BLOB}
     */
    KeyId{
        get {
            if(!this.HasProp("__KeyId"))
                this.__KeyId := CRYPT_INTEGER_BLOB(8, this)
            return this.__KeyId
        }
    }

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-crypt_algorithm_identifier">CRYPT_ALGORITHM_IDENTIFIER</a> that identifies the key-encryption algorithm and any associated parameters used to encrypt the content encryption key.
     * @type {CRYPT_ALGORITHM_IDENTIFIER}
     */
    KeyEncryptionAlgorithm{
        get {
            if(!this.HasProp("__KeyEncryptionAlgorithm"))
                this.__KeyEncryptionAlgorithm := CRYPT_ALGORITHM_IDENTIFIER(24, this)
            return this.__KeyEncryptionAlgorithm
        }
    }

    /**
     * A <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa381414(v=vs.85)">CRYPT_DATA_BLOB</a> structure that contains the encrypted content encryption key.
     * @type {CRYPT_INTEGER_BLOB}
     */
    EncryptedKey{
        get {
            if(!this.HasProp("__EncryptedKey"))
                this.__EncryptedKey := CRYPT_INTEGER_BLOB(48, this)
            return this.__EncryptedKey
        }
    }

    /**
     * Optional. When present, this member specifies a single key-encryption key from a previously distributed set.
     * @type {FILETIME}
     */
    Date{
        get {
            if(!this.HasProp("__Date"))
                this.__Date := FILETIME(64, this)
            return this.__Date
        }
    }

    /**
     * Optional pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-crypt_attribute_type_value">CRYPT_ATTRIBUTE_TYPE_VALUE</a> structure containing additional information.
     * @type {Pointer<CRYPT_ATTRIBUTE_TYPE_VALUE>}
     */
    pOtherAttr {
        get => NumGet(this, 72, "ptr")
        set => NumPut("ptr", value, this, 72)
    }
}
