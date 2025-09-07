#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\CRYPT_INTEGER_BLOB.ahk

/**
 * Contains the encrypted key for a key agreement recipient of an enveloped message.
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-cmsg_key_agree_key_encrypt_info
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class CMSG_KEY_AGREE_KEY_ENCRYPT_INFO extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * The size, in bytes, of this structure.
     * @type {Integer}
     */
    cbSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * A <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa381414(v=vs.85)">CRYPT_DATA_BLOB</a> structure that contains the session key encrypted by the negotiated key of the recipient.
     * @type {CRYPT_INTEGER_BLOB}
     */
    EncryptedKey{
        get {
            if(!this.HasProp("__EncryptedKey"))
                this.__EncryptedKey := CRYPT_INTEGER_BLOB(this.ptr + 8)
            return this.__EncryptedKey
        }
    }

    /**
     * Initializes the struct. `cbSize` must always contain the size of the struct.
     * @param {Integer} ptr The location at which to create the struct, or 0 to create a new `Buffer`
     */
    __New(ptr := 0){
        super.__New(ptr)
        this.cbSize := 24
    }
}
