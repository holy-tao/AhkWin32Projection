#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CRYPT_INTEGER_BLOB.ahk" { CRYPT_INTEGER_BLOB }

/**
 * Contains the encrypted key for a key agreement recipient of an enveloped message.
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-cmsg_key_agree_key_encrypt_info
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CMSG_KEY_AGREE_KEY_ENCRYPT_INFO {
    #StructPack 8

    /**
     * The size, in bytes, of this structure.
     */
    cbSize : UInt32 := this.Size

    /**
     * A <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa381414(v=vs.85)">CRYPT_DATA_BLOB</a> structure that contains the session key encrypted by the negotiated key of the recipient.
     */
    EncryptedKey : CRYPT_INTEGER_BLOB

}
