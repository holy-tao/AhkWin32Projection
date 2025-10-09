#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\CRYPT_INTEGER_BLOB.ahk
#Include .\CRYPT_ALGORITHM_IDENTIFIER.ahk
#Include .\CERT_ISSUER_SERIAL_NUMBER.ahk
#Include .\CERT_ID.ahk
#Include .\CRYPT_BIT_BLOB.ahk
#Include .\CERT_PUBLIC_KEY_INFO.ahk

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
 * @version v4.0.30319
 */
class CMSG_KEY_AGREE_ENCRYPT_INFO extends Win32Struct
{
    static sizeof => 128

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
     * A value that specifies the ordinal number of a recipient in the recipient list specified by the <i>pContentEncryptInfo</i> parameter of the <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/nc-wincrypt-pfn_cmsg_export_key_agree">PFN_CMSG_EXPORT_KEY_AGREE</a> function.
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
     * A <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa381414(v=vs.85)">CRYPT_DATA_BLOB</a> structure that contains user keying material provided by the sender to ensure that a different key is generated each time the same two parties generate a pair-wise key.
     * @type {CRYPT_INTEGER_BLOB}
     */
    UserKeyingMaterial{
        get {
            if(!this.HasProp("__UserKeyingMaterial"))
                this.__UserKeyingMaterial := CRYPT_INTEGER_BLOB(this.ptr + 32)
            return this.__UserKeyingMaterial
        }
    }

    /**
     * 
     * @type {Integer}
     */
    dwOriginatorChoice {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * @type {CERT_ID}
     */
    OriginatorCertId{
        get {
            if(!this.HasProp("__OriginatorCertId"))
                this.__OriginatorCertId := CERT_ID(this.ptr + 56)
            return this.__OriginatorCertId
        }
    }

    /**
     * @type {CERT_PUBLIC_KEY_INFO}
     */
    OriginatorPublicKeyInfo{
        get {
            if(!this.HasProp("__OriginatorPublicKeyInfo"))
                this.__OriginatorPublicKeyInfo := CERT_PUBLIC_KEY_INFO(this.ptr + 56)
            return this.__OriginatorPublicKeyInfo
        }
    }

    /**
     * A value that specifies the number of recipients in the <i>rgpKeyAgreeKeyEncryptInfo</i> parameter.
     * @type {Integer}
     */
    cKeyAgreeKeyEncryptInfo {
        get => NumGet(this, 104, "uint")
        set => NumPut("uint", value, this, 104)
    }

    /**
     * An array of <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cmsg_key_agree_key_encrypt_info">CMSG_KEY_AGREE_KEY_ENCRYPT_INFO</a> structures that contain the encrypted key for each recipient.
     * @type {Pointer<CMSG_KEY_AGREE_KEY_ENCRYPT_INFO>}
     */
    rgpKeyAgreeKeyEncryptInfo {
        get => NumGet(this, 112, "ptr")
        set => NumPut("ptr", value, this, 112)
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
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 120, "uint")
        set => NumPut("uint", value, this, 120)
    }

    /**
     * Initializes the struct. `cbSize` must always contain the size of the struct.
     * @param {Integer} ptr The location at which to create the struct, or 0 to create a new `Buffer`
     */
    __New(ptr := 0){
        super.__New(ptr)
        this.cbSize := 128
    }
}
