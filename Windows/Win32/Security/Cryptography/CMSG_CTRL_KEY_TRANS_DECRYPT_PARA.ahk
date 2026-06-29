#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CMSG_KEY_TRANS_RECIPIENT_INFO.ahk" { CMSG_KEY_TRANS_RECIPIENT_INFO }
#Import ".\NCRYPT_KEY_HANDLE.ahk" { NCRYPT_KEY_HANDLE }

/**
 * Contains information about a key transport message recipient.
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-cmsg_ctrl_key_trans_decrypt_para
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CMSG_CTRL_KEY_TRANS_DECRYPT_PARA {
    #StructPack 8

    /**
     * The size, in bytes, of this data structure.
     */
    cbSize : UInt32 := this.Size

    hCryptProv : IntPtr

    /**
     * Specifies the encrypted key. The encrypted key is the result of encrypting the content-encryption key for a specific recipient by using that recipient's public key. This member is not used when the <i>hNCryptKey</i> member is used.
     */
    dwKeySpec : UInt32

    /**
     * A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cmsg_key_trans_recipient_info">CMSG_KEY_TRANS_RECIPIENT_INFO</a> structure.
     */
    pKeyTrans : CMSG_KEY_TRANS_RECIPIENT_INFO.Ptr

    /**
     * Indicates a specific recipient in any array of recipients.
     */
    dwRecipientIndex : UInt32

    static __New() {
        DefineProp(this.Prototype, 'hNCryptKey', { type: NCRYPT_KEY_HANDLE, offset: 8 })
        this.DeleteProp("__New")
    }
}
