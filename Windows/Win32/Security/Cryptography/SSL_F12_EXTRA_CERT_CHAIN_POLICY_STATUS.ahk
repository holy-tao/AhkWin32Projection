#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The SSL_F12_EXTRA_CERT_CHAIN_POLICY_STATUS structure checks if any certificates in the chain have weak cryptography and checks if a third party root certificate is compliant with the Microsoft Root Program requirements.
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-ssl_f12_extra_cert_chain_policy_status
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class SSL_F12_EXTRA_CERT_CHAIN_POLICY_STATUS extends Win32Struct
{
    static sizeof => 528

    static packingSize => 4

    /**
     * <b>DWORD</b> value that specifies the size, in bytes, of this structure. This value must be set to a value greater than or equal to sizeof(SSL_F12_EXTRA_CERT_CHAIN_POLICY_STATUS).
     * @type {Integer}
     */
    cbSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * <b>DWORD</b> value that specifies the level of an error.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CERT_CHAIN_POLICY_SSL_F12_SUCCESS_LEVEL"></a><a id="cert_chain_policy_ssl_f12_success_level"></a><dl>
     * <dt><b>CERT_CHAIN_POLICY_SSL_F12_SUCCESS_LEVEL</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No certificate errors.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CERT_CHAIN_POLICY_SSL_F12_WARNING_LEVEL"></a><a id="cert_chain_policy_ssl_f12_warning_level"></a><dl>
     * <dt><b>CERT_CHAIN_POLICY_SSL_F12_WARNING_LEVEL</b></dt>
     * <dt>1</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Certificate warning level.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CERT_CHAIN_POLICY_SSL_F12_ERROR_LEVEL"></a><a id="cert_chain_policy_ssl_f12_error_level"></a><dl>
     * <dt><b>CERT_CHAIN_POLICY_SSL_F12_ERROR_LEVEL</b></dt>
     * <dt>2</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Certificate error level.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    dwErrorLevel {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * <b>DWORD</b> value that specifies the category of an error. Each error category has a corresponding <b>dwErrorLevel</b>.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CERT_CHAIN_POLICY_SSL_F12_NONE_CATEGORY"></a><a id="cert_chain_policy_ssl_f12_none_category"></a><dl>
     * <dt><b>CERT_CHAIN_POLICY_SSL_F12_NONE_CATEGORY</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No certificate errors.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CERT_CHAIN_POLICY_SSL_F12_WEAK_CRYPTO_CATEGORY"></a><a id="cert_chain_policy_ssl_f12_weak_crypto_category"></a><dl>
     * <dt><b>CERT_CHAIN_POLICY_SSL_F12_WEAK_CRYPTO_CATEGORY</b></dt>
     * <dt>1</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Errors in this category with the <b>dwErrorLevel</b>: <b>CERT_CHAIN_POLICY_SSL_F12_WARNING_LEVEL</b> are errors associated with all other roots including enterprise.
     * 
     * Errors in this category with the <b>dwErrorLevel</b>: <b>CERT_CHAIN_POLICY_SSL_F12_ERROR_LEVEL</b> are errors associated with the third party root certificate.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CERT_CHAIN_POLICY_SSL_F12_ROOT_PROGRAM_CATEGORY"></a><a id="cert_chain_policy_ssl_f12_root_program_category"></a><dl>
     * <dt><b>CERT_CHAIN_POLICY_SSL_F12_ROOT_PROGRAM_CATEGORY</b></dt>
     * <dt>2</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Errors in this category with the <b>dwErrorLevel</b>: <b>CERT_CHAIN_POLICY_SSL_F12_WARNING_LEVEL</b> are all errors with root program compliance failures.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    dwErrorCategory {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * <b>DWORD</b> value reserved for future use.
     * @type {Integer}
     */
    dwReserved {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * The error string provided if any certificates in the chain have weak cryptography or if the third party root certificate is not compliant with the Microsoft Root Program requirements.
     * @type {String}
     */
    wszErrorText {
        get => StrGet(this.ptr + 16, 255, "UTF-16")
        set => StrPut(value, this.ptr + 16, 255, "UTF-16")
    }

    /**
     * Initializes the struct. `cbSize` must always contain the size of the struct.
     * @param {Integer} ptr The location at which to create the struct, or 0 to create a new `Buffer`
     */
    __New(ptr := 0){
        super.__New(ptr)
        this.cbSize := 528
    }
}
