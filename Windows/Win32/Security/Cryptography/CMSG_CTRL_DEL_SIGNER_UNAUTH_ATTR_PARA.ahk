#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Used to delete an unauthenticated attribute of a signer of a signed message.
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-cmsg_ctrl_del_signer_unauth_attr_para
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CMSG_CTRL_DEL_SIGNER_UNAUTH_ATTR_PARA {
    #StructPack 4

    /**
     * Size of this structure in bytes.
     */
    cbSize : UInt32 := this.Size

    /**
     * Index of the signer in the <b>rgSigners</b> array of pointers to <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cmsg_signer_encode_info">CMSG_SIGNER_ENCODE_INFO</a> structures in a signed message's <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cmsg_signed_encode_info">CMSG_SIGNED_ENCODE_INFO</a> structure. The unauthenticated attribute for this signer is deleted.
     */
    dwSignerIndex : UInt32

    /**
     * Index of the element in the <b>rgUnauthAttr</b> array of the <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cmsg_signer_encode_info">CMSG_SIGNER_ENCODE_INFO</a> structure holding the unauthenticated attribute to be removed.
     */
    dwUnauthAttrIndex : UInt32

}
