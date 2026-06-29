#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CMSG_KEY_AGREE_RECIPIENT_INFO.ahk" { CMSG_KEY_AGREE_RECIPIENT_INFO }
#Import ".\NCRYPT_KEY_HANDLE.ahk" { NCRYPT_KEY_HANDLE }
#Import ".\CRYPT_BIT_BLOB.ahk" { CRYPT_BIT_BLOB }

/**
 * Contains information about a key agreement recipient.
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-cmsg_ctrl_key_agree_decrypt_para
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CMSG_CTRL_KEY_AGREE_DECRYPT_PARA {
    #StructPack 8

    /**
     * The size, in bytes,  of this data structure.
     */
    cbSize : UInt32 := this.Size

    hCryptProv : IntPtr

    /**
     * Specifies the encrypted key. The encrypted key is the result of encrypting the content-encryption key. This member is not used when the <i>hNCryptKey</i> member is used.
     */
    dwKeySpec : UInt32

    /**
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cmsg_key_agree_recipient_info">CMSG_KEY_AGREE_RECIPIENT_INFO</a> structure.
     */
    pKeyAgree : CMSG_KEY_AGREE_RECIPIENT_INFO.Ptr

    /**
     * Indicates a specific recipient in an array of recipients.
     */
    dwRecipientIndex : UInt32

    /**
     * Indicates a specific encrypted key in an array of encrypted keys.
     */
    dwRecipientEncryptedKeyIndex : UInt32

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-crypt_bit_blob">CRYPT_BIT_BLOB</a> structure that contains the sender's public key information.
     */
    OriginatorPublicKey : CRYPT_BIT_BLOB

    static __New() {
        DefineProp(this.Prototype, 'hNCryptKey', { type: NCRYPT_KEY_HANDLE, offset: 8 })
        this.DeleteProp("__New")
    }
}
