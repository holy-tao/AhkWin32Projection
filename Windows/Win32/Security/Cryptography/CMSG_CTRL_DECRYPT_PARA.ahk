#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\NCRYPT_KEY_HANDLE.ahk" { NCRYPT_KEY_HANDLE }

/**
 * Contains information used to decrypt an enveloped message for a key transport recipient. This structure is passed to CryptMsgControl if the dwCtrlType parameter is CMSG_CTRL_DECRYPT.
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-cmsg_ctrl_decrypt_para
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CMSG_CTRL_DECRYPT_PARA {
    #StructPack 8

    /**
     * The size, in bytes, of this structure.
     */
    cbSize : UInt32 := this.Size

    hCryptProv : IntPtr

    /**
     * The private key to be used. This member is not used when the <i>hNCryptKey</i> member is used.  
     * 
     * 
     * 
     * 
     * The following <b>dwKeySpec</b> values are defined for the default provider.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AT_KEYEXCHANGE"></a><a id="at_keyexchange"></a><dl>
     * <dt><b>AT_KEYEXCHANGE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Keys used to encrypt and decrypt session keys.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AT_SIGNATURE"></a><a id="at_signature"></a><dl>
     * <dt><b>AT_SIGNATURE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Keys used to create and verify digital signatures.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * If <b>dwKeySpec</b> is zero, the default AT_KEYEXCHANGE is used.
     */
    dwKeySpec : UInt32

    /**
     * Index of the recipient in the message associated with the <b>hCryptProv</b> private key.
     */
    dwRecipientIndex : UInt32

    static __New() {
        DefineProp(this.Prototype, 'hNCryptKey', { type: NCRYPT_KEY_HANDLE, offset: 8 })
        this.DeleteProp("__New")
    }
}
