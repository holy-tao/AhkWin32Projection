#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\HCRYPTPROV_LEGACY.ahk
#Include .\CRYPT_INTEGER_BLOB.ahk
#Include .\CRYPT_ALGORITHM_IDENTIFIER.ahk
#Include .\BCRYPT_KEY_HANDLE.ahk

/**
 * Contains information shared between the PFN_CMSG_GEN_CONTENT_ENCRYPT_KEY, PFN_CMSG_EXPORT_KEY_TRANS, PFN_CMSG_EXPORT_KEY_AGREE, and PFN_CMSG_EXPORT_MAIL_LIST functions.
 * @remarks
 * 
  * When called with the <i>dwMsgType</i> parameter set to <b>CMSG_ENVELOPED</b>, the <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/nf-wincrypt-cryptmsgopentoencode">CryptMsgOpenToEncode</a> function  initializes the <b>CMSG_CONTENT_ENCRYPT_INFO</b> structure from the <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cmsg_enveloped_encode_info">CMSG_ENVELOPED_ENCODE_INFO</a> structure.
  * 
  * If the  <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cmsg_enveloped_encode_info">CMSG_ENVELOPED_ENCODE_INFO</a> structure uses the <b>rgpRecipients</b> member instead of the <b>rgCmsRecipients</b> member, the <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/nf-wincrypt-cryptmsgopentoencode">CryptMsgOpenToEncode</a> function converts the <b>rgpRecipients</b> member structures to <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cmsg_recipient_encode_info">CMSG_RECIPIENT_ENCODE_INFO</a> structures for the <b>rgCmsRecipients</b> member of the <b>CMSG_CONTENT_ENCRYPT_INFO</b> structure.
  * 
  * When the <b>fCNG</b> member is <b>FALSE</b>, the following members can be changed in the <b>CMSG_CONTENT_ENCRYPT_INFO</b> structure:<dl>
  * <dd><b>hContentEncryptKey</b></dd>
  * <dd><b>hCryptProv</b></dd>
  * <dd>The <b>pszObjId</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-crypt_algorithm_identifier">CRYPT_ALGORITHM_IDENTIFIER</a> structure referred to by the <b>ContentEncryptionAlgorithm</b> member</dd>
  * <dd>The <b>Parameters</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-crypt_algorithm_identifier">CRYPT_ALGORITHM_IDENTIFIER</a> structure referred to by the <b>ContentEncryptionAlgorithm</b> member</dd>
  * <dd><b>dwFlags</b></dd>
  * </dl>
  * 
  * 
  * When the <b>fCNG</b> member is <b>TRUE</b>, the following members can be changed in the <b>CMSG_CONTENT_ENCRYPT_INFO</b> structure:<dl>
  * <dd><b>hCNGContentEncryptKey</b></dd>
  * <dd><b>pbCNGContentEncryptKeyObject</b></dd>
  * <dd><b>pbContentEncryptKey</b></dd>
  * <dd><b>cbContentEncryptKey</b></dd>
  * <dd>The <b>pszObjId</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-crypt_algorithm_identifier">CRYPT_ALGORITHM_IDENTIFIER</a> structure referred to by the <b>ContentEncryptionAlgorithm</b> member</dd>
  * <dd>The <b>Parameters</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-crypt_algorithm_identifier">CRYPT_ALGORITHM_IDENTIFIER</a> structure referred to by the <b>ContentEncryptionAlgorithm</b> member</dd>
  * <dd><b>dwFlags</b></dd>
  * </dl>
  * 
  * 
  * The following members are read-only:<dl>
  * <dd><b>cbSize</b></dd>
  * <dd><b>pvEncryptionAuxInfo</b></dd>
  * <dd><b>cRecipients</b></dd>
  * <dd><b>rgCmsRecipients</b></dd>
  * <dd><b>pfnAlloc</b></dd>
  * <dd><b>pfnFree</b></dd>
  * <dd><b>dwEncryptFlags</b></dd>
  * </dl>
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//wincrypt/ns-wincrypt-cmsg_content_encrypt_info
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class CMSG_CONTENT_ENCRYPT_INFO extends Win32Struct
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
     * A handle to a <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">cryptographic service provider</a> (CSP). If the <b>fCNG</b> member is <b>FALSE</b> and the <b>hCryptProv</b> member is <b>NULL</b> upon input, <b>hCryptProv</b> must be updated by the callback function. If a provider is acquired that must be released, the <b>CMSG_CONTENT_ENCRYPT_RELEASE_CONTEXT_FLAG</b> must be set in the <b>dwFlags</b> member.
     * @type {HCRYPTPROV_LEGACY}
     */
    hCryptProv{
        get {
            if(!this.HasProp("__hCryptProv"))
                this.__hCryptProv := HCRYPTPROV_LEGACY(8, this)
            return this.__hCryptProv
        }
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-crypt_algorithm_identifier">CRYPT_ALGORITHM_IDENTIFIER</a> structure that specifies the algorithm used to encrypt the key. If the callback function updates either the <b>pszObjId</b> member or the <b>Parameters</b> member of the <b>CRYPT_ALGORITHM_IDENTIFIER</b> structure, set the appropriate value in the <b>dwFlags</b> member. You must allocate and free memory for these values by using the <b>pfnAlloc</b> and <b>pfnFree</b> members.
     * @type {CRYPT_ALGORITHM_IDENTIFIER}
     */
    ContentEncryptionAlgorithm{
        get {
            if(!this.HasProp("__ContentEncryptionAlgorithm"))
                this.__ContentEncryptionAlgorithm := CRYPT_ALGORITHM_IDENTIFIER(16, this)
            return this.__ContentEncryptionAlgorithm
        }
    }

    /**
     * A pointer to a structure that depends on the encryption algorithm. The following table lists possible algorithm IDs and the corresponding member content.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RC2"></a><a id="rc2"></a><dl>
     * <dt><b>RC2</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cmsg_rc2_aux_info">CMSG_RC2_AUX_INFO</a>
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RC4"></a><a id="rc4"></a><dl>
     * <dt><b>RC4</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cmsg_rc4_aux_info">CMSG_RC4_AUX_INFO</a>
     * 
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * For all other encryption algorithms, this value is <b>NULL</b>.
     * @type {Pointer<Void>}
     */
    pvEncryptionAuxInfo {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * A value that specifies the number of recipients of a message.
     * @type {Integer}
     */
    cRecipients {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * A pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cmsg_recipient_encode_info">CMSG_RECIPIENT_ENCODE_INFO</a> structures that contain the message recipient information.
     * @type {Pointer<CMSG_RECIPIENT_ENCODE_INFO>}
     */
    rgCmsRecipients {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }

    /**
     * A pointer to an installable function used to allocate memory for an updated member.
     * @type {Pointer<PFN_CMSG_ALLOC>}
     */
    pfnAlloc {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
    }

    /**
     * A pointer to an installable function used to free memory allocated by <b>pfnAlloc</b>.
     * @type {Pointer<PFN_CMSG_FREE>}
     */
    pfnFree {
        get => NumGet(this, 72, "ptr")
        set => NumPut("ptr", value, this, 72)
    }

    /**
     * A value that indicates whether the encoded output should be padded with zeros to obtain a consistent maximum length required for definite-length streaming in the <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/nf-wincrypt-cryptmsgcalculateencodedlength">CryptMsgCalculateEncodedLength</a> or <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/nf-wincrypt-cryptmsgopentoencode">CryptMsgOpenToEncode</a> functions.
     * @type {Integer}
     */
    dwEncryptFlags {
        get => NumGet(this, 80, "uint")
        set => NumPut("uint", value, this, 80)
    }

    /**
     * @type {Pointer}
     */
    hContentEncryptKey {
        get => NumGet(this, 88, "ptr")
        set => NumPut("ptr", value, this, 88)
    }

    /**
     * @type {BCRYPT_KEY_HANDLE}
     */
    hCNGContentEncryptKey{
        get {
            if(!this.HasProp("__hCNGContentEncryptKey"))
                this.__hCNGContentEncryptKey := BCRYPT_KEY_HANDLE(88, this)
            return this.__hCNGContentEncryptKey
        }
    }

    /**
     * A value that indicates whether memory must be freed for the <b>hCryptProv</b> or <b>ContentEncryptionAlgorithm</b> members.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CMSG_CONTENT_ENCRYPT_FREE_PARA_FLAG"></a><a id="cmsg_content_encrypt_free_para_flag"></a><dl>
     * <dt><b>CMSG_CONTENT_ENCRYPT_FREE_PARA_FLAG</b></dt>
     * <dt>0x00000001</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Set if the callback function updates the <b>Parameters</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-crypt_algorithm_identifier">CRYPT_ALGORITHM_IDENTIFIER</a> structure referred to by the <b>ContentEncryptionAlgorithm</b> member.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CMSG_CONTENT_ENCRYPT_FREE_OBJID_FLAG"></a><a id="cmsg_content_encrypt_free_objid_flag"></a><dl>
     * <dt><b>CMSG_CONTENT_ENCRYPT_FREE_OBJID_FLAG</b></dt>
     * <dt>0x00000002</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Set if the callback function updates the <b>pszObjId</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-crypt_algorithm_identifier">CRYPT_ALGORITHM_IDENTIFIER</a> structure referred to by the <b>ContentEncryptionAlgorithm</b> member.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CMSG_CONTENT_ENCRYPT_RELEASE_CONTEXT_FLAG"></a><a id="cmsg_content_encrypt_release_context_flag"></a><dl>
     * <dt><b>CMSG_CONTENT_ENCRYPT_RELEASE_CONTEXT_FLAG</b></dt>
     * <dt>0x00008000</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Set if the callback function acquires an <b>hCryptProv</b> member that must be freed.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 96, "uint")
        set => NumPut("uint", value, this, 96)
    }

    /**
     * A value that indicates whether to use a <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">Cryptography API: Next Generation</a> (CNG) provider to generate the content encryption key.
     * 
     * If the <b>fCNG</b> member is <b>FALSE</b>, the <b>CMSG_OID_GEN_CONTENT_ENCRYPT_KEY_FUNC</b> function is called to update the <b>hContentEncryptKey</b> member.
     * 
     * If the <b>fCNG</b> member is <b>TRUE</b>, the  <b>CMSG_OID_CNG_GEN_CONTENT_ENCRYPT_KEY_FUNC</b> function is called to update the <b>hCNGContentEncryptKey</b> and <b>cbContentEncryptKey</b> members, and the <b>pbCNGContentEncryptKeyObject</b> and <b>pbContentEncryptKey</b> members must be allocated by the <b>pfnAlloc</b> member. Free and release the content encryption key by calling the <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/nf-wincrypt-cryptmsgclose">CryptMsgClose</a> function.
     * @type {BOOL}
     */
    fCNG {
        get => NumGet(this, 100, "int")
        set => NumPut("int", value, this, 100)
    }

    /**
     * A pointer to the buffer that contains the CNG content encryption key.
     * @type {Pointer<Integer>}
     */
    pbCNGContentEncryptKeyObject {
        get => NumGet(this, 104, "ptr")
        set => NumPut("ptr", value, this, 104)
    }

    /**
     * A pointer to the buffer that contains a CAPI1 content encryption key.
     * @type {Pointer<Integer>}
     */
    pbContentEncryptKey {
        get => NumGet(this, 112, "ptr")
        set => NumPut("ptr", value, this, 112)
    }

    /**
     * The size, in bytes, of the <b>pbCNGContentEncryptKeyObject</b> or <b>pbContentEncryptKey</b> member depending on the value of the <b>fCNG</b> member.
     * @type {Integer}
     */
    cbContentEncryptKey {
        get => NumGet(this, 120, "uint")
        set => NumPut("uint", value, this, 120)
    }

    __New(ptrOrObj := 0, parent := ""){
        super.__New(ptrOrObj, parent)
        this.cbSize := 128
    }
}
