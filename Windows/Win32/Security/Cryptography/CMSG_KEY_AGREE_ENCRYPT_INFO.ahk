#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CERT_PUBLIC_KEY_INFO.ahk" { CERT_PUBLIC_KEY_INFO }
#Import ".\CRYPT_INTEGER_BLOB.ahk" { CRYPT_INTEGER_BLOB }
#Import ".\CERT_ID_OPTION.ahk" { CERT_ID_OPTION }
#Import ".\CERT_ISSUER_SERIAL_NUMBER.ahk" { CERT_ISSUER_SERIAL_NUMBER }
#Import ".\CRYPT_ALGORITHM_IDENTIFIER.ahk" { CRYPT_ALGORITHM_IDENTIFIER }
#Import ".\CERT_ID.ahk" { CERT_ID }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }
#Import ".\CRYPT_BIT_BLOB.ahk" { CRYPT_BIT_BLOB }
#Import ".\CMSG_KEY_AGREE_ORIGINATOR.ahk" { CMSG_KEY_AGREE_ORIGINATOR }
#Import ".\CMSG_KEY_AGREE_KEY_ENCRYPT_INFO.ahk" { CMSG_KEY_AGREE_KEY_ENCRYPT_INFO }

/**
 * Contains encryption information applicable to all key agreement recipients of an enveloped message.
 * @remarks
 * When called with the <i>dwMsgType</i> parameter set to <b>CMSG_ENVELOPED</b>, the <a href="https://docs.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-cmsg_key_agree_recipient_encode_info">CryptMsgOpenToEncode</a> function initializes the <b>CMSG_KEY_AGREE_ENCRYPT_INFO</b> structure from the  <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cmsg_key_agree_recipient_encode_info">CMSG_KEY_AGREE_RECIPIENT_ENCODE_INFO</a> structure. The <b>CryptMsgOpenToEncode</b> function calls the <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/nc-wincrypt-pfn_cmsg_export_key_agree">PFN_CMSG_EXPORT_KEY_AGREE</a> function to update the <b>CMSG_KEY_AGREE_ENCRYPT_INFO</b> structure. If the callback function cannot be found, the <b>CryptMsgOpenToEncode</b> function fills this structure with default key information from the <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cmsg_content_encrypt_info">CMSG_CONTENT_ENCRYPT_INFO</a> structure.
 * 
 * The following members of the <b>CMSG_KEY_AGREE_ENCRYPT_INFO</b> structure can be updated by the callback function:<dl>
 * <dd><b>UserKeyingMaterial</b></dd>
 * <dd><b>KeyEncryptionAlgorithm.pszObjId</b></dd>
 * <dd><b>KeyEncryptionAlgorithm.Parameters</b></dd>
 * <dd><b>dwOriginatorChoice</b></dd>
 * <dd><b>OriginatorCertId</b></dd>
 * <dd><b>OriginatorPublicKeyInfo</b></dd>
 * <dd><b>dwFlags</b></dd>
 * </dl>
 * 
 * 
 * The other members are read-only.
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-cmsg_key_agree_encrypt_info
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CMSG_KEY_AGREE_ENCRYPT_INFO {
    #StructPack 8

    /**
     * The size, in bytes, of this structure.
     */
    cbSize : UInt32 := this.Size

    /**
     * A value that specifies the ordinal number of a recipient in the recipient list specified by the <i>pContentEncryptInfo</i> parameter of the <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/nc-wincrypt-pfn_cmsg_export_key_agree">PFN_CMSG_EXPORT_KEY_AGREE</a> function.
     */
    dwRecipientIndex : UInt32

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-crypt_algorithm_identifier">CRYPT_ALGORITHM_IDENTIFIER</a> structure that specifies the algorithm used to encrypt the content encryption key. The <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/nf-wincrypt-cryptmsgopentoencode">CryptMsgOpenToEncode</a> function uses the <b>pszObjId</b> member of the <b>CRYPT_ALGORITHM_IDENTIFIER</b> structure to get the address of the function used to export the key. The function can be installed by using a Cryptography API: Next Generation (CNG) <a href="https://docs.microsoft.com/windows/desktop/SecGloss/o-gly">object identifier</a> (OID).
     */
    KeyEncryptionAlgorithm : CRYPT_ALGORITHM_IDENTIFIER

    /**
     * A <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa381414(v=vs.85)">CRYPT_DATA_BLOB</a> structure that contains user keying material provided by the sender to ensure that a different key is generated each time the same two parties generate a pair-wise key.
     */
    UserKeyingMaterial : CRYPT_INTEGER_BLOB

    dwOriginatorChoice : CMSG_KEY_AGREE_ORIGINATOR

    OriginatorCertId : CERT_ID

    /**
     * A value that specifies the number of recipients in the <i>rgpKeyAgreeKeyEncryptInfo</i> parameter.
     */
    cKeyAgreeKeyEncryptInfo : UInt32

    /**
     * An array of <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cmsg_key_agree_key_encrypt_info">CMSG_KEY_AGREE_KEY_ENCRYPT_INFO</a> structures that contain the encrypted key for each recipient.
     */
    rgpKeyAgreeKeyEncryptInfo : IntPtr

    /**
     * A value that specifies what members have been updated, and whose memory allocation must be freed by using the <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/nf-wincrypt-cryptmsgopentoencode">CryptMsgOpenToEncode</a> function.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CMSG_KEY_AGREE_ENCRYPT_FREE_MATERIAL_FLAG"></a><a id="cmsg_key_agree_encrypt_free_material_flag"></a><dl>
     * <dt><b>CMSG_KEY_AGREE_ENCRYPT_FREE_MATERIAL_FLAG</b></dt>
     * <dt>0x00000002</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <b>UserKeyingMaterial</b> member was updated.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CMSG_KEY_AGREE_ENCRYPT_FREE_OBJID_FLAG"></a><a id="cmsg_key_agree_encrypt_free_objid_flag"></a><dl>
     * <dt><b>CMSG_KEY_AGREE_ENCRYPT_FREE_OBJID_FLAG</b></dt>
     * <dt>0x00000020</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <b>pszObjId</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-crypt_algorithm_identifier">CRYPT_ALGORITHM_IDENTIFIER</a> structure referred to by the <b>KeyEncryptionAlgorithm</b> member was updated.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CMSG_KEY_AGREE_ENCRYPT_FREE_PARA_FLAG"></a><a id="cmsg_key_agree_encrypt_free_para_flag"></a><dl>
     * <dt><b>CMSG_KEY_AGREE_ENCRYPT_FREE_PARA_FLAG</b></dt>
     * <dt>0x00000001</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <b>Parameters</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-crypt_algorithm_identifier">CRYPT_ALGORITHM_IDENTIFIER</a> structure referred to by <b>KeyEncryptionAlgorithm</b> member was updated.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CMSG_KEY_AGREE_ENCRYPT_FREE_PUBKEY_ALG_FLAG"></a><a id="cmsg_key_agree_encrypt_free_pubkey_alg_flag"></a><dl>
     * <dt><b>CMSG_KEY_AGREE_ENCRYPT_FREE_PUBKEY_ALG_FLAG</b></dt>
     * <dt>0x00000004</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <b>Algorithm.pszObjId</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cert_public_key_info">CERT_PUBLIC_KEY_INFO</a> structure referred to by the <b>OriginatorPublicKeyInfo</b> member was updated.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CMSG_KEY_AGREE_ENCRYPT_FREE_PUBKEY_BITS_FLAG"></a><a id="cmsg_key_agree_encrypt_free_pubkey_bits_flag"></a><dl>
     * <dt><b>CMSG_KEY_AGREE_ENCRYPT_FREE_PUBKEY_BITS_FLAG</b></dt>
     * <dt>0x00000010</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <b>PublicKey</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cert_public_key_info">CERT_PUBLIC_KEY_INFO</a> structure referred to by the <b>OriginatorPublicKeyInfo</b> member was updated.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CMSG_KEY_AGREE_ENCRYPT_FREE_PUBKEY_PARA_FLAG"></a><a id="cmsg_key_agree_encrypt_free_pubkey_para_flag"></a><dl>
     * <dt><b>CMSG_KEY_AGREE_ENCRYPT_FREE_PUBKEY_PARA_FLAG</b></dt>
     * <dt>0x00000008</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <b>Algorithm.Parameters</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cert_public_key_info">CERT_PUBLIC_KEY_INFO</a> structure referred to by the <b>OriginatorPublicKeyInfo</b> member was updated.
     * 
     * </td>
     * </tr>
     * </table>
     */
    dwFlags : UInt32

    static __New() {
        DefineProp(this.Prototype, 'OriginatorPublicKeyInfo', { type: CERT_PUBLIC_KEY_INFO, offset: 56 })
        this.DeleteProp("__New")
    }
}
