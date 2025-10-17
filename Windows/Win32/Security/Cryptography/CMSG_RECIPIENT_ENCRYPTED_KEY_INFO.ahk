#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\CRYPT_INTEGER_BLOB.ahk
#Include .\CERT_ISSUER_SERIAL_NUMBER.ahk
#Include .\CERT_ID.ahk
#Include ..\..\Foundation\FILETIME.ahk

/**
 * The CMSG_RECIPIENT_ENCRYPTED_KEY_INFO structure contains information used for an individual key agreement recipient.
 * @see https://docs.microsoft.com/windows/win32/api//wincrypt/ns-wincrypt-cmsg_recipient_encrypted_key_info
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class CMSG_RECIPIENT_ENCRYPTED_KEY_INFO extends Win32Struct
{
    static sizeof => 72

    static packingSize => 8

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cert_id">CERT_ID</a> structure identifying the recipient. Currently, only the ISSUER_SERIAL_NUMBER or KEYID choices in the <b>CERT_ID</b> structure are valid.
     * @type {CERT_ID}
     */
    RecipientId{
        get {
            if(!this.HasProp("__RecipientId"))
                this.__RecipientId := CERT_ID(0, this)
            return this.__RecipientId
        }
    }

    /**
     * A <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa381414(v=vs.85)">CRYPT_DATA_BLOB</a> structure that contains the encrypted content encryption key.
     * @type {CRYPT_INTEGER_BLOB}
     */
    EncryptedKey{
        get {
            if(!this.HasProp("__EncryptedKey"))
                this.__EncryptedKey := CRYPT_INTEGER_BLOB(40, this)
            return this.__EncryptedKey
        }
    }

    /**
     * Optional. When present, this member specifies which of the recipient's previously distributed UKMs was used by the sender. Only applicable to KEYID choice in the <b>RecipientId </b><a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cert_id">CERT_ID</a> structure.
     * @type {FILETIME}
     */
    Date{
        get {
            if(!this.HasProp("__Date"))
                this.__Date := FILETIME(56, this)
            return this.__Date
        }
    }

    /**
     * Optional pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-crypt_attribute_type_value">CRYPT_ATTRIBUTE_TYPE_VALUE</a> structure containing additional information. Only applicable to KEYID choice in the <b>RecipientId </b><a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cert_id">CERT_ID</a> structure.
     * @type {Pointer<CRYPT_ATTRIBUTE_TYPE_VALUE>}
     */
    pOtherAttr {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
    }
}
