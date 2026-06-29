#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CRYPT_INTEGER_BLOB.ahk" { CRYPT_INTEGER_BLOB }

/**
 * Used to add an unauthenticated attribute to a signer of a signed message.
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-cmsg_ctrl_add_signer_unauth_attr_para
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CMSG_CTRL_ADD_SIGNER_UNAUTH_ATTR_PARA {
    #StructPack 8

    /**
     * Size of this structure in bytes.
     */
    cbSize : UInt32 := this.Size

    /**
     * Index of the signer in the <b>rgSigners</b> array of pointers of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cmsg_signer_encode_info">CMSG_SIGNER_ENCODE_INFO</a> structures in a signed message's 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cmsg_signed_encode_info">CMSG_SIGNED_ENCODE_INFO</a> structure. The unauthenticated attribute is to be added to this signer's information.
     */
    dwSignerIndex : UInt32

    blob : CRYPT_INTEGER_BLOB

}
