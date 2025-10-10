#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\CRYPT_BIT_BLOB.ahk

/**
 * Contains information about a key agreement recipient.
 * @see https://docs.microsoft.com/windows/win32/api//wincrypt/ns-wincrypt-cmsg_ctrl_key_agree_decrypt_para
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class CMSG_CTRL_KEY_AGREE_DECRYPT_PARA extends Win32Struct
{
    static sizeof => 64

    static packingSize => 8

    /**
     * The size, in bytes,  of this data structure.
     * @type {Integer}
     */
    cbSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Pointer}
     */
    hCryptProv {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Pointer}
     */
    hNCryptKey {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Specifies the encrypted key. The encrypted key is the result of encrypting the content-encryption key. This member is not used when the <i>hNCryptKey</i> member is used.
     * @type {Integer}
     */
    dwKeySpec {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cmsg_key_agree_recipient_info">CMSG_KEY_AGREE_RECIPIENT_INFO</a> structure.
     * @type {Pointer<CMSG_KEY_AGREE_RECIPIENT_INFO>}
     */
    pKeyAgree {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * Indicates a specific recipient in an array of recipients.
     * @type {Integer}
     */
    dwRecipientIndex {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * Indicates a specific encrypted key in an array of encrypted keys.
     * @type {Integer}
     */
    dwRecipientEncryptedKeyIndex {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-crypt_bit_blob">CRYPT_BIT_BLOB</a> structure that contains the sender's public key information.
     * @type {CRYPT_BIT_BLOB}
     */
    OriginatorPublicKey{
        get {
            if(!this.HasProp("__OriginatorPublicKey"))
                this.__OriginatorPublicKey := CRYPT_BIT_BLOB(this.ptr + 40)
            return this.__OriginatorPublicKey
        }
    }

    /**
     * Initializes the struct. `cbSize` must always contain the size of the struct.
     * @param {Integer} ptr The location at which to create the struct, or 0 to create a new `Buffer`
     */
    __New(ptr := 0){
        super.__New(ptr)
        this.cbSize := 64
    }
}
