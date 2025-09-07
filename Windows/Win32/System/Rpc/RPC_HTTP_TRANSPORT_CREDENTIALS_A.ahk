#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The RPC_HTTP_TRANSPORT_CREDENTIALS structure defines additional credentials to authenticate to an RPC proxy server when using RPC/HTTP. (ANSI)
 * @remarks
 * If the <b>TransportCredentials</b> member is <b>NULL</b> and the authentication scheme is NTLM, the credentials of the currently logged on user are used. To avoid exposing user credentials on the network through a weak LM hash, user logon credentials are used only if one or both of the following conditions are true:
  * 
  * <ul>
  * <li>Caller requested use of SSL and used the <b>ServerCertificateSubject</b> member. This scenario guarantees credentials are protected both in transit and at the final destination, even if a weak hash is used.</li>
  * <li>The lncompatibilitylevel key is set to 2 or higher. This  causes the NTLM security provider to emit or respond to only the strong NT hash, not the weak LM hash. In addition, customers are encouraged to use level 3 or higher, which will attempt NTLMv2.</li>
  * </ul>
  * If the Unicode version of the <a href="https://docs.microsoft.com/windows/desktop/api/rpcdce/nf-rpcdce-rpcbindingsetauthinfoexa">RpcBindingSetAuthInfoEx</a> function is used,  Unicode versions of the <b>RPC_HTTP_TRANSPORT_CREDENTIALS</b> and <a href="https://docs.microsoft.com/windows/desktop/api/rpcdce/ns-rpcdce-sec_winnt_auth_identity_a">SEC_WINNT_AUTH_IDENTITY</a> structures must also be provided, and the <b>Flags</b> member in <b>TransportCredentials</b> must be set to SEC_WINNT_AUTH_IDENTITY_UNICODE. 
  * If the ANSI version of the <b>RpcBindingSetAuthInfoEx</b> function is used,  ANSI versions of <b>RPC_HTTP_TRANSPORT_CREDENTIALS</b> and <b>SEC_WINNT_AUTH_IDENTITY</b> structures must be provided, and the <b>Flags</b> member in <b>TransportCredentials</b> must be set to SEC_WINNT_AUTH_IDENTITY_ANSI.
 * @see https://learn.microsoft.com/windows/win32/api/rpcdce/ns-rpcdce-rpc_http_transport_credentials_a
 * @namespace Windows.Win32.System.Rpc
 * @version v4.0.30319
 * @charset ANSI
 */
class RPC_HTTP_TRANSPORT_CREDENTIALS_A extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/rpcdce/ns-rpcdce-sec_winnt_auth_identity_a">SEC_WINNT_AUTH_IDENTITY</a> structure that contains the user name, domain, and password for the user.
     * @type {Pointer<SEC_WINNT_AUTH_IDENTITY_A>}
     */
    TransportCredentials {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * A set of flags that can be combined with the bitwise OR operator. 
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RPC_C_HTTP_FLAG_USE_SSL"></a><a id="rpc_c_http_flag_use_ssl"></a><dl>
     * <dt><b>RPC_C_HTTP_FLAG_USE_SSL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Instructs RPC to use SSL to communicate with the RPC Proxy.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RPC_C_HTTP_FLAG_USE_FIRST_AUTH_SCHEME"></a><a id="rpc_c_http_flag_use_first_auth_scheme"></a><dl>
     * <dt><b>RPC_C_HTTP_FLAG_USE_FIRST_AUTH_SCHEME</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * When set, RPC chooses the first scheme in the <b>AuthnSchemes</b> array and attempts to authenticate to the RPC Proxy. If the RPC Proxy does not support the selected authentication scheme, the call fails. When not set, the RPC client queries the RPC Proxy for supported authentication schemes, and chooses one. 
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Specifies the authentication target.
     * @type {Integer}
     */
    AuthenticationTarget {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * The number of elements in the <b>AuthnScheme</b> array.
     * @type {Integer}
     */
    NumberOfAuthnSchemes {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * 
     * @type {Pointer<UInt32>}
     */
    AuthnSchemes {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * Contains an optional string with the expected server principal name. The principal name is in the same format as that generated for <a href="https://docs.microsoft.com/windows/desktop/api/rpcssl/nf-rpcssl-rpccertgenerateprincipalname">RpcCertGeneratePrincipalName</a> (see <a href="https://docs.microsoft.com/windows/desktop/Rpc/principal-names">Principal Names</a> for more information). This member is used only when SSL is used. In such cases, the server certificate is checked against the generated principal name. If they do not match, an error is returned. This member enables clients to authenticate the RPC Proxy.
     * @type {Pointer<Byte>}
     */
    ServerCertificateSubject {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }
}
