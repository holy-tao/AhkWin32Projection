#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Used with the CryptMsgGetParam function to get information on a key transport, key agreement, or mail list envelope message recipient.
 * @see https://docs.microsoft.com/windows/win32/api//wincrypt/ns-wincrypt-cmsg_cms_recipient_info
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class CMSG_CMS_RECIPIENT_INFO extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

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
     * @type {Integer}
     */
    dwRecipientChoice {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Pointer<CMSG_KEY_TRANS_RECIPIENT_INFO>}
     */
    pKeyTrans {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Pointer<CMSG_KEY_AGREE_RECIPIENT_INFO>}
     */
    pKeyAgree {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Pointer<CMSG_MAIL_LIST_RECIPIENT_INFO>}
     */
    pMailList {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
