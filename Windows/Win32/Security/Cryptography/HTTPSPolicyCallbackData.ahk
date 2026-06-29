#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\HTTPSPOLICY_CALLBACK_DATA_AUTH_TYPE.ahk" { HTTPSPOLICY_CALLBACK_DATA_AUTH_TYPE }

/**
 * Holds policy information used in the verification of Secure Sockets Layer (SSL) client/server certificate chains.
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-httpspolicycallbackdata
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct HTTPSPolicyCallbackData {
    #StructPack 8

    cbStruct : UInt32

    dwAuthType : HTTPSPOLICY_CALLBACK_DATA_AUTH_TYPE

    /**
     * <b>DWORD</b> value that specifies certificate errors to ignore. This can be a bitwise combination of the following flags.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SECURITY_FLAG_IGNORE_REVOCATION"></a><a id="security_flag_ignore_revocation"></a><dl>
     * <dt><b>SECURITY_FLAG_IGNORE_REVOCATION</b></dt>
     * <dt>0x00000080</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Ignore errors associated with a revoked certificate.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SECURITY_FLAG_IGNORE_UNKNOWN_CA"></a><a id="security_flag_ignore_unknown_ca"></a><dl>
     * <dt><b>SECURITY_FLAG_IGNORE_UNKNOWN_CA</b></dt>
     * <dt>0x00000100</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Ignore errors associated with an unknown <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">certification authority</a>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SECURITY_FLAG_IGNORE_WRONG_USAGE"></a><a id="security_flag_ignore_wrong_usage"></a><dl>
     * <dt><b>SECURITY_FLAG_IGNORE_WRONG_USAGE</b></dt>
     * <dt>0x00000200</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Ignore errors associated with the use of a certificate.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SECURITY_FLAG_IGNORE_CERT_CN_INVALID"></a><a id="security_flag_ignore_cert_cn_invalid"></a><dl>
     * <dt><b>SECURITY_FLAG_IGNORE_CERT_CN_INVALID</b></dt>
     * <dt>0x00001000</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Ignore errors associated with a certificate that contains a common name that is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SECURITY_FLAG_IGNORE_CERT_DATE_INVALID"></a><a id="security_flag_ignore_cert_date_invalid"></a><dl>
     * <dt><b>SECURITY_FLAG_IGNORE_CERT_DATE_INVALID</b></dt>
     * <dt>0x00002000</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Ignore errors associated with an expired certificate.
     * 
     * </td>
     * </tr>
     * </table>
     */
    fdwChecks : UInt32

    /**
     * A pointer to a null-terminated wide character string that contains the server name. This member is ignored if the value of the <b>dwAuthType</b> member is <b>AUTHTYPE_CLIENT</b>.
     * 
     * If the string is Punycode encoded, then the server name from the certificate, either the DNS name or common name, is converted to a Punycode encoded string. Matching is then performed, label-by-label if the name contains wildcards, or a case-insensitive exact match otherwise. 
     * 
     * If the string contains Unicode characters outside of the ASCII character set and the subject name, either the DNS name or common name, is a Punycode encoded string then it is Punycode encoded before comparison.
     */
    pwszServerName : PWSTR

    static __New() {
        DefineProp(this.Prototype, 'cbSize', { type: UInt32, offset: 0 })
        this.DeleteProp("__New")
    }
}
