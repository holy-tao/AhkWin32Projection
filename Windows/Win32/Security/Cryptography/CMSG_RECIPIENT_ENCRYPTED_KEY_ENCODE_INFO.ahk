#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\CRYPT_BIT_BLOB.ahk
#Include .\CRYPT_INTEGER_BLOB.ahk
#Include .\CERT_ISSUER_SERIAL_NUMBER.ahk
#Include .\CERT_ID.ahk
#Include ..\..\Foundation\FILETIME.ahk

/**
 * Contains information on a message receiver used to decrypt the session key needed to decrypt the message contents.
 * @see https://docs.microsoft.com/windows/win32/api//wincrypt/ns-wincrypt-cmsg_recipient_encrypted_key_encode_info
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class CMSG_RECIPIENT_ENCRYPTED_KEY_ENCODE_INFO extends Win32Struct
{
    static sizeof => 88

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
     * A <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-crypt_bit_blob">CRYPT_BIT_BLOB</a> structure that contains the recipient's public key.
     * @type {CRYPT_BIT_BLOB}
     */
    RecipientPublicKey{
        get {
            if(!this.HasProp("__RecipientPublicKey"))
                this.__RecipientPublicKey := CRYPT_BIT_BLOB(8, this)
            return this.__RecipientPublicKey
        }
    }

    /**
     * The <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cert_id">CERT_ID</a> that identifies a message recipient's public key.
     * @type {CERT_ID}
     */
    RecipientId{
        get {
            if(!this.HasProp("__RecipientId"))
                this.__RecipientId := CERT_ID(32, this)
            return this.__RecipientId
        }
    }

    /**
     * Optional <b>FILETIME</b>. Applicable only if the <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cert_id">CERT_ID</a> identifies the receiver's public key with a KEY_IDENTIFIER.
     * @type {FILETIME}
     */
    Date{
        get {
            if(!this.HasProp("__Date"))
                this.__Date := FILETIME(72, this)
            return this.__Date
        }
    }

    /**
     * Optional. Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-crypt_attribute_type_value">CRYPT_ATTRIBUTE_TYPE_VALUE</a>. Applicable only if the CERT_ID identifies the receiver's public key with a KEY_IDENTIFIER.
     * @type {Pointer<CRYPT_ATTRIBUTE_TYPE_VALUE>}
     */
    pOtherAttr {
        get => NumGet(this, 80, "ptr")
        set => NumPut("ptr", value, this, 80)
    }

    __New(ptrOrObj := 0, parent := ""){
        super.__New(ptrOrObj, parent)
        this.cbSize := 88
    }
}
