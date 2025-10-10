#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains information on a mail list message recipient.
 * @see https://docs.microsoft.com/windows/win32/api//wincrypt/ns-wincrypt-cmsg_ctrl_mail_list_decrypt_para
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class CMSG_CTRL_MAIL_LIST_DECRYPT_PARA extends Win32Struct
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
     * The provider used to do the recipient key encryption and export. If <b>hCryptProv</b> is <b>NULL</b>, the provider specified in <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cmsg_enveloped_encode_info">CMSG_ENVELOPED_ENCODE_INFO</a> is used.
     * @type {Pointer}
     */
    hCryptProv {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cmsg_mail_list_recipient_info">CMSG_MAIL_LIST_RECIPIENT_INFO</a> structure.
     * @type {Pointer<CMSG_MAIL_LIST_RECIPIENT_INFO>}
     */
    pMailList {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Indicates a specific recipient in any array of recipients.
     * @type {Integer}
     */
    dwRecipientIndex {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * Indicates the member of the following union that will be used. Currently only CMSG_MAIL_LIST_HANDLE_KEY_CHOICE is defined.
     * @type {Integer}
     */
    dwKeyChoice {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * @type {Pointer}
     */
    hKeyEncryptionKey {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * @type {Pointer<Void>}
     */
    pvKeyEncryptionKey {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
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
