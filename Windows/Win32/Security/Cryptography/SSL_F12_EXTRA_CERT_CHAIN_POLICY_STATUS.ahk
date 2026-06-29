#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * The SSL_F12_EXTRA_CERT_CHAIN_POLICY_STATUS structure checks if any certificates in the chain have weak cryptography and checks if a third party root certificate is compliant with the Microsoft Root Program requirements.
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-ssl_f12_extra_cert_chain_policy_status
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct SSL_F12_EXTRA_CERT_CHAIN_POLICY_STATUS {
    #StructPack 4

    /**
     * <b>DWORD</b> value that specifies the size, in bytes, of this structure. This value must be set to a value greater than or equal to sizeof(SSL_F12_EXTRA_CERT_CHAIN_POLICY_STATUS).
     */
    cbSize : UInt32 := this.Size

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
     */
    dwErrorLevel : UInt32

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
     */
    dwErrorCategory : UInt32

    /**
     * <b>DWORD</b> value reserved for future use.
     */
    dwReserved : UInt32

    /**
     * The error string provided if any certificates in the chain have weak cryptography or if the third party root certificate is not compliant with the Microsoft Root Program requirements.
     */
    wszErrorText : WCHAR[256]

}
