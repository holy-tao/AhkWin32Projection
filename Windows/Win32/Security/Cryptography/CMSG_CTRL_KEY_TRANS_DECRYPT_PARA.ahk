#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\NCRYPT_KEY_HANDLE.ahk

/**
 * Contains information about a key transport message recipient.
 * @see https://docs.microsoft.com/windows/win32/api//wincrypt/ns-wincrypt-cmsg_ctrl_key_trans_decrypt_para
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class CMSG_CTRL_KEY_TRANS_DECRYPT_PARA extends Win32Struct
{
    static sizeof => 40

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
     * @type {Pointer}
     */
    hCryptProv {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {NCRYPT_KEY_HANDLE}
     */
    hNCryptKey{
        get {
            if(!this.HasProp("__hNCryptKey"))
                this.__hNCryptKey := NCRYPT_KEY_HANDLE(this.ptr + 8)
            return this.__hNCryptKey
        }
    }

    /**
     * Specifies the encrypted key. The encrypted key is the result of encrypting the content-encryption key for a specific recipient by using that recipient's public key. This member is not used when the <i>hNCryptKey</i> member is used.
     * @type {Integer}
     */
    dwKeySpec {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cmsg_key_trans_recipient_info">CMSG_KEY_TRANS_RECIPIENT_INFO</a> structure.
     * @type {Pointer<CMSG_KEY_TRANS_RECIPIENT_INFO>}
     */
    pKeyTrans {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * Indicates a specific recipient in any array of recipients.
     * @type {Integer}
     */
    dwRecipientIndex {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * Initializes the struct. `cbSize` must always contain the size of the struct.
     * @param {Integer} ptr The location at which to create the struct, or 0 to create a new `Buffer`
     */
    __New(ptr := 0){
        super.__New(ptr)
        this.cbSize := 40
    }
}
