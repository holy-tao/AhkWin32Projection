#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CMSG_KEY_TRANS_RECIPIENT_INFO.ahk" { CMSG_KEY_TRANS_RECIPIENT_INFO }
#Import ".\CMSG_KEY_AGREE_RECIPIENT_INFO.ahk" { CMSG_KEY_AGREE_RECIPIENT_INFO }
#Import ".\CMSG_MAIL_LIST_RECIPIENT_INFO.ahk" { CMSG_MAIL_LIST_RECIPIENT_INFO }

/**
 * Used with the CryptMsgGetParam function to get information on a key transport, key agreement, or mail list envelope message recipient.
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-cmsg_cms_recipient_info
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CMSG_CMS_RECIPIENT_INFO {
    #StructPack 8

    /**
     * Indicates the member of the union to be used. 
     * 
     * 
     * 
     * 
     * Possible values are:
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CMSG_KEY_TRANS_RECIPIENT"></a><a id="cmsg_key_trans_recipient"></a><dl>
     * <dt><b>CMSG_KEY_TRANS_RECIPIENT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * pKeyTrans
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CMSG_KEY_AGREE_RECIPIENT"></a><a id="cmsg_key_agree_recipient"></a><dl>
     * <dt><b>CMSG_KEY_AGREE_RECIPIENT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * pKeyAgree
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CMSG_MAIL_LIST_RECIPIENT"></a><a id="cmsg_mail_list_recipient"></a><dl>
     * <dt><b>CMSG_MAIL_LIST_RECIPIENT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * pMailList
     * 
     * </td>
     * </tr>
     * </table>
     */
    dwRecipientChoice : UInt32

    pKeyTrans : CMSG_KEY_TRANS_RECIPIENT_INFO.Ptr

    static __New() {
        DefineProp(this.Prototype, 'pKeyAgree', { type: CMSG_KEY_AGREE_RECIPIENT_INFO.Ptr, offset: 8 })
        DefineProp(this.Prototype, 'pMailList', { type: CMSG_MAIL_LIST_RECIPIENT_INFO.Ptr, offset: 8 })
        this.DeleteProp("__New")
    }
}
