#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Used with the BCryptEncrypt and BCryptDecrypt functions to contain additional information related to authenticated cipher modes.
 * @remarks
 * 
  * The size of this structure is different between 64-bit and 32-bit operating systems.  On 64-bit operating systems, the size is different between 64-bit and 32-bit processes.  Instances of this structure must not be shared across threads or passed between processes.
  * 
 * @see https://docs.microsoft.com/windows/win32/api//bcrypt/ns-bcrypt-bcrypt_authenticated_cipher_mode_info
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class BCRYPT_AUTHENTICATED_CIPHER_MODE_INFO extends Win32Struct
{
    static sizeof => 88

    static packingSize => 8

    /**
     * The size, in bytes, of this structure. Do not set this field directly. Use the <a href="https://docs.microsoft.com/windows/desktop/api/bcrypt/nf-bcrypt-bcrypt_init_auth_mode_info">BCRYPT_INIT_AUTH_MODE_INFO</a> macro instead.
     * @type {Integer}
     */
    cbSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The version number of the structure.   The only supported value is <b>BCRYPT_AUTHENTICATED_CIPHER_MODE_INFO_VERSION</b>. Do not set this field directly. Use the <a href="https://docs.microsoft.com/windows/desktop/api/bcrypt/nf-bcrypt-bcrypt_init_auth_mode_info">BCRYPT_INIT_AUTH_MODE_INFO</a> macro instead.
     * @type {Integer}
     */
    dwInfoVersion {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * A pointer to a buffer that contains a nonce. The Microsoft algorithm providers for <a href="https://docs.microsoft.com/windows/desktop/SecGloss/a-gly">Advanced Encryption Standard</a> (AES) require a nonce for the Counter with CBC-MAC (CCM) and Galois/Counter Mode (GCM) chaining modes, and will return an error if none is present. If a nonce is not used, this member must be set to <b>NULL</b>.
     * @type {Pointer<Byte>}
     */
    pbNonce {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * The size, in bytes, of the buffer pointed to by the <b>pbNonce</b> member.
     * 	If a nonce is not used, this member must be set to zero.
     * @type {Integer}
     */
    cbNonce {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * A pointer to a buffer that contains the authenticated data.  This is data that will be included in the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/m-gly">Message Authentication Code</a> (MAC) but not encrypted.  If there is no authenticated data, this member must be set to <b>NULL</b>.
     * @type {Pointer<Byte>}
     */
    pbAuthData {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * The size, in bytes, of the buffer pointed to by the <b>pbAuthData</b> member.  If there is no authenticated data, this member must be set to zero.
     * @type {Integer}
     */
    cbAuthData {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * A pointer to a buffer.
     * 
     * The use of this member depends on the function to which the structure is passed.
     * 
     * <table>
     * <tr>
     * <th>Function</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="BCryptEncrypt"></a><a id="bcryptencrypt"></a><a id="BCRYPTENCRYPT"></a><dl>
     * <dt><b><a href="https://docs.microsoft.com/windows/desktop/api/bcrypt/nf-bcrypt-bcryptencrypt">BCryptEncrypt</a></b></dt>
     * <dt></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The  buffer will receive the authentication tag.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="BCryptDecrypt"></a><a id="bcryptdecrypt"></a><a id="BCRYPTDECRYPT"></a><dl>
     * <dt><b><a href="https://docs.microsoft.com/windows/desktop/api/bcrypt/nf-bcrypt-bcryptdecrypt">BCryptDecrypt</a></b></dt>
     * <dt></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The buffer contains the authentication tag to be checked against.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * If there is no tag, this member must be set to <b>NULL</b>.
     * @type {Pointer<Byte>}
     */
    pbTag {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * The size, in bytes, of the <b>pbTag</b> buffer. The buffer must be long enough to include the whole authentication tag.  Some authentication modes, such as CCM and GCM, support checking against a tag with multiple lengths.  To obtain the valid authentication tag lengths use <a href="https://docs.microsoft.com/windows/desktop/api/bcrypt/nf-bcrypt-bcryptgetproperty">BCryptGetProperty</a> to query the <b>BCRYPT_AUTH_TAG_LENGTH</b> property.  If there is no tag, this member must be set to zero.
     * @type {Integer}
     */
    cbTag {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * A pointer to a buffer that stores the partially computed MAC between calls to <a href="https://docs.microsoft.com/windows/desktop/api/bcrypt/nf-bcrypt-bcryptencrypt">BCryptEncrypt</a> and <a href="https://docs.microsoft.com/windows/desktop/api/bcrypt/nf-bcrypt-bcryptdecrypt">BCryptDecrypt</a> when chaining encryption or decryption.
     * 
     * If the input to encryption or decryption is scattered across multiple buffers, then you must chain calls to the <a href="https://docs.microsoft.com/windows/desktop/api/bcrypt/nf-bcrypt-bcryptencrypt">BCryptEncrypt</a> and <a href="https://docs.microsoft.com/windows/desktop/api/bcrypt/nf-bcrypt-bcryptdecrypt">BCryptDecrypt</a> functions. Chaining is indicated by setting the <b>BCRYPT_AUTH_MODE_IN_PROGRESS_FLAG</b> flag in the <b>dwFlags</b> member.
     * 
     * This buffer must be supplied by the caller and must be at least as large as the maximum length of an authentication tag for the cipher you are using. To get the valid authentication tag lengths, use <a href="https://docs.microsoft.com/windows/desktop/api/bcrypt/nf-bcrypt-bcryptgetproperty">BCryptGetProperty</a> to query the <b>BCRYPT_AUTH_TAG_LENGTH</b> property.
     * 
     * If <a href="https://docs.microsoft.com/windows/desktop/api/bcrypt/nf-bcrypt-bcryptencrypt">BCryptEncrypt</a> and  <a href="https://docs.microsoft.com/windows/desktop/api/bcrypt/nf-bcrypt-bcryptdecrypt">BCryptDecrypt</a> calls are not being chained, this member must be set to <b>NULL</b>.
     * @type {Pointer<Byte>}
     */
    pbMacContext {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }

    /**
     * The size, in bytes, of the buffer pointed to by the <b>pbMacContext</b> member.  If <a href="https://docs.microsoft.com/windows/desktop/api/bcrypt/nf-bcrypt-bcryptencrypt">BCryptEncrypt</a> and  <a href="https://docs.microsoft.com/windows/desktop/api/bcrypt/nf-bcrypt-bcryptdecrypt">BCryptDecrypt</a> calls are not being chained, this member must be set to zero.
     * @type {Integer}
     */
    cbMacContext {
        get => NumGet(this, 64, "uint")
        set => NumPut("uint", value, this, 64)
    }

    /**
     * The length, in bytes, of additional authenticated data (AAD) to be used by the <a href="https://docs.microsoft.com/windows/desktop/api/bcrypt/nf-bcrypt-bcryptencrypt">BCryptEncrypt</a> and <a href="https://docs.microsoft.com/windows/desktop/api/bcrypt/nf-bcrypt-bcryptdecrypt">BCryptDecrypt</a> functions.  This member is used only  when chaining calls.
     * 
     * This member is used only when the <b>BCRYPT_AUTH_MODE_IN_PROGRESS_FLAG</b> flag in the <b>dwFlags</b> member is set.
     * 
     * On the first call to <a href="https://docs.microsoft.com/windows/desktop/api/bcrypt/nf-bcrypt-bcryptencrypt">BCryptEncrypt</a> or <a href="https://docs.microsoft.com/windows/desktop/api/bcrypt/nf-bcrypt-bcryptdecrypt">BCryptDecrypt</a> you must set this field to zero.
     * 
     * 
     * <div class="alert"><b>Note</b>  During the chaining sequence, this member is maintained internally and must not be changed or the value of the computed MAC will be corrupted.</div>
     * <div> </div>
     * @type {Integer}
     */
    cbAAD {
        get => NumGet(this, 68, "uint")
        set => NumPut("uint", value, this, 68)
    }

    /**
     * The length, in bytes, of the payload data that was encrypted or decrypted.  This member is used only when chaining calls.
     * 
     * This member is used only when the <b>BCRYPT_AUTH_MODE_IN_PROGRESS_FLAG</b> flag in the <b>dwFlags</b> member is set.
     * 
     * On the first call to <a href="https://docs.microsoft.com/windows/desktop/api/bcrypt/nf-bcrypt-bcryptencrypt">BCryptEncrypt</a> or <a href="https://docs.microsoft.com/windows/desktop/api/bcrypt/nf-bcrypt-bcryptdecrypt">BCryptDecrypt</a> you must set this field to zero, , either directly or by calling the <a href="https://docs.microsoft.com/windows/desktop/api/bcrypt/nf-bcrypt-bcrypt_init_auth_mode_info">BCRYPT_INIT_AUTH_INFO</a> macro
     * 
     * 
     * <div class="alert"><b>Note</b>  During the chaining sequence, this member is maintained internally and must not be changed or the value of the computed MAC will be corrupted.</div>
     * <div> </div>
     * @type {Integer}
     */
    cbData {
        get => NumGet(this, 72, "uint")
        set => NumPut("uint", value, this, 72)
    }

    /**
     * This flag is used when chaining <a href="https://docs.microsoft.com/windows/desktop/api/bcrypt/nf-bcrypt-bcryptencrypt">BCryptEncrypt</a> or <a href="https://docs.microsoft.com/windows/desktop/api/bcrypt/nf-bcrypt-bcryptdecrypt">BCryptDecrypt</a> function calls.  If calls are not being chained, this member must be set to zero.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>0x00000000</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * For <a href="https://docs.microsoft.com/windows/desktop/api/bcrypt/nf-bcrypt-bcryptencrypt">BCryptEncrypt</a>, calculate the authentication tag and place it in the buffer pointed to by the <b>pbTag</b> member. 
     * 
     * For <a href="https://docs.microsoft.com/windows/desktop/api/bcrypt/nf-bcrypt-bcryptdecrypt">BCryptDecrypt</a>, calculate the authentication tag and compare it against the tag passed in to the buffer pointed to by the <b>pbTag</b> member. When chaining multiple calls to <a href="https://docs.microsoft.com/windows/desktop/api/bcrypt/nf-bcrypt-bcryptencrypt">BCryptEncrypt</a> or <b>BCryptDecrypt</b>, this value signals the end of the chain.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="BCRYPT_AUTH_MODE_CHAIN_CALLS_FLAG"></a><a id="bcrypt_auth_mode_chain_calls_flag"></a><dl>
     * <dt><b>BCRYPT_AUTH_MODE_CHAIN_CALLS_FLAG</b></dt>
     * <dt>0x00000001</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates that <a href="https://docs.microsoft.com/windows/desktop/api/bcrypt/nf-bcrypt-bcryptencrypt">BCryptEncrypt</a> and <a href="https://docs.microsoft.com/windows/desktop/api/bcrypt/nf-bcrypt-bcryptdecrypt">BCryptDecrypt</a> function calls are being chained and that the MAC value will not be computed. On the last call in the chain, clear this value to compute the MAC value for the entire chain.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="BCRYPT_AUTH_MODE_IN_PROGRESS_FLAG"></a><a id="bcrypt_auth_mode_in_progress_flag"></a><dl>
     * <dt><b>BCRYPT_AUTH_MODE_IN_PROGRESS_FLAG</b></dt>
     * <dt>0x00000002</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates that this <b>BCRYPT_AUTHENTICATED_CIPHER_MODE_INFO</b> structure is being used in a sequence of chained <a href="https://docs.microsoft.com/windows/desktop/api/bcrypt/nf-bcrypt-bcryptencrypt">BCryptEncrypt</a> or <a href="https://docs.microsoft.com/windows/desktop/api/bcrypt/nf-bcrypt-bcryptdecrypt">BCryptDecrypt</a> function calls. This flag is set and maintained internally.
     * 
     * 
     * <div class="alert"><b>Note</b>  During the chaining sequence, this flag value is maintained internally and must not be changed or the value of the computed MAC will be corrupted.</div>
     * <div> </div>
     * 
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 80, "uint")
        set => NumPut("uint", value, this, 80)
    }

    /**
     * Initializes the struct. `cbSize` must always contain the size of the struct.
     * @param {Integer} ptr The location at which to create the struct, or 0 to create a new `Buffer`
     */
    __New(ptr := 0){
        super.__New(ptr)
        this.cbSize := 88
    }
}
