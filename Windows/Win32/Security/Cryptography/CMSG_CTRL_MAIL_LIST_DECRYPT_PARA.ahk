#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CMSG_MAIL_LIST_RECIPIENT_INFO.ahk" { CMSG_MAIL_LIST_RECIPIENT_INFO }

/**
 * Contains information on a mail list message recipient.
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-cmsg_ctrl_mail_list_decrypt_para
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CMSG_CTRL_MAIL_LIST_DECRYPT_PARA {
    #StructPack 8

    /**
     * The size, in bytes, of this data structure.
     */
    cbSize : UInt32 := this.Size

    /**
     * The provider used to do the recipient key encryption and export. If <b>hCryptProv</b> is <b>NULL</b>, the provider specified in <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cmsg_enveloped_encode_info">CMSG_ENVELOPED_ENCODE_INFO</a> is used.
     */
    hCryptProv : IntPtr

    /**
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cmsg_mail_list_recipient_info">CMSG_MAIL_LIST_RECIPIENT_INFO</a> structure.
     */
    pMailList : CMSG_MAIL_LIST_RECIPIENT_INFO.Ptr

    /**
     * Indicates a specific recipient in any array of recipients.
     */
    dwRecipientIndex : UInt32

    /**
     * Indicates the member of the following union that will be used. Currently only CMSG_MAIL_LIST_HANDLE_KEY_CHOICE is defined.
     */
    dwKeyChoice : UInt32

    hKeyEncryptionKey : IntPtr

    static __New() {
        DefineProp(this.Prototype, 'pvKeyEncryptionKey', { type: IntPtr, offset: 32 })
        this.DeleteProp("__New")
    }
}
