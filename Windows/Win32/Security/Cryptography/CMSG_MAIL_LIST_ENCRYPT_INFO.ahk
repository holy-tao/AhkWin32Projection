#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PSTR.ahk
#Include .\CRYPT_INTEGER_BLOB.ahk
#Include .\CRYPT_ALGORITHM_IDENTIFIER.ahk

/**
 * Contains encryption information for a mailing list recipient of enveloped data.
 * @remarks
 * When called with the <i>dwMsgType</i> parameter set to <b>CMSG_ENVELOPED</b>, the <a href="https://docs.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-cmsg_mail_list_recipient_encode_info">CryptMsgOpenToEncode</a> function initializes the <b>CMSG_MAIL_LIST_ENCRYPT_INFO</b> structure from the  <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cmsg_mail_list_recipient_encode_info">CMSG_MAIL_LIST_RECIPIENT_ENCODE_INFO</a> structure. The <b>CryptMsgOpenToEncode</b> function calls the <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/nc-wincrypt-pfn_cmsg_export_mail_list">PFN_CMSG_EXPORT_MAIL_LIST</a> function to update the <b>CMSG_MAIL_LIST_ENCRYPT_INFO</b> structure. If the callback function cannot be found, the <b>CryptMsgOpenToEncode</b> function fills this structure with default key information from the <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cmsg_content_encrypt_info">CMSG_CONTENT_ENCRYPT_INFO</a> structure.
  * 
  * The following members of the <b>CMSG_MAIL_LIST_ENCRYPT_INFO</b> structure can be updated by the callback function:<dl>
  * <dd><b>EncryptedKey</b></dd>
  * <dd><b>KeyEncryptionAlgorithm.pszObjId</b></dd>
  * <dd><b>KeyEncryptionAlgorithm.Parameters</b></dd>
  * <dd><b>dwFlags</b></dd>
  * </dl>
  * 
  * 
  * The other members are read-only.
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-cmsg_mail_list_encrypt_info
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class CMSG_MAIL_LIST_ENCRYPT_INFO extends Win32Struct
{
    static sizeof => 56

    static packingSize => 8

    /**
     * The size, in bytes, of this structure.
     * @type {Integer}
     */
    cbSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * A value that specifies the ordinal number of a recipient in the recipient list specified by the <i>pContentEncryptInfo</i> parameter to the <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/nc-wincrypt-pfn_cmsg_export_mail_list">PFN_CMSG_EXPORT_MAIL_LIST</a> function.
     * @type {Integer}
     */
    dwRecipientIndex {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-crypt_algorithm_identifier">CRYPT_ALGORITHM_IDENTIFIER</a> structure that specifies the algorithm used to encrypt the content encryption key. The <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/nf-wincrypt-cryptmsgopentoencode">CryptMsgOpenToEncode</a> function uses the <b>pszObjId</b> member of the <b>CRYPT_ALGORITHM_IDENTIFIER</b> structure to get the address of the function used to export the key. The function can be installed by using a Cryptography API: Next Generation (CNG) <a href="https://docs.microsoft.com/windows/desktop/SecGloss/o-gly">object identifier</a> (OID).
     * @type {CRYPT_ALGORITHM_IDENTIFIER}
     */
    KeyEncryptionAlgorithm{
        get {
            if(!this.HasProp("__KeyEncryptionAlgorithm"))
                this.__KeyEncryptionAlgorithm := CRYPT_ALGORITHM_IDENTIFIER(this.ptr + 8)
            return this.__KeyEncryptionAlgorithm
        }
    }

    /**
     * A <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa381414(v=vs.85)">CRYPT_DATA_BLOB</a> structure that contains the encrypted session key.
     * @type {CRYPT_INTEGER_BLOB}
     */
    EncryptedKey{
        get {
            if(!this.HasProp("__EncryptedKey"))
                this.__EncryptedKey := CRYPT_INTEGER_BLOB(this.ptr + 32)
            return this.__EncryptedKey
        }
    }

    /**
     * A value that specifies what members have been updated, and whose memory allocation must be freed by using the <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/nf-wincrypt-cryptmsgopentoencode">CryptMsgOpenToEncode</a> function.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CMSG_MAIL_LIST_ENCRYPT_FREE_OBJID_FLAG"></a><a id="cmsg_mail_list_encrypt_free_objid_flag"></a><dl>
     * <dt><b>CMSG_MAIL_LIST_ENCRYPT_FREE_OBJID_FLAG</b></dt>
     * <dt>0x00000002</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <b>pszObjId</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-crypt_algorithm_identifier">CRYPT_ALGORITHM_IDENTIFIER</a> structure referred to by the <b>KeyEncryptionAlgorithm</b> member was updated.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CMSG_MAIL_LIST_ENCRYPT_FREE_PARA_FLAG"></a><a id="cmsg_mail_list_encrypt_free_para_flag"></a><dl>
     * <dt><b>CMSG_MAIL_LIST_ENCRYPT_FREE_PARA_FLAG</b></dt>
     * <dt>0x00000001</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <b>Parameters</b> <b>pbData</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-crypt_algorithm_identifier">CRYPT_ALGORITHM_IDENTIFIER</a> structure referred to by the <b>KeyEncryptionAlgorithm</b> member was updated.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * Initializes the struct. `cbSize` must always contain the size of the struct.
     * @param {Integer} ptr The location at which to create the struct, or 0 to create a new `Buffer`
     */
    __New(ptr := 0){
        super.__New(ptr)
        this.cbSize := 56
    }
}
