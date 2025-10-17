#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains the authentication settings used while making a remote activation request from the client computer to the server computer.
 * @remarks
 * 
  * If <b>pAuthInfo</b> in <a href="https://docs.microsoft.com/windows/desktop/api/objidl/ns-objidl-coserverinfo">COSERVERINFO</a> is set to <b>NULL</b>, Snego will be used to negotiate an authentication service that will work between the client and server. However, a non-<b>NULL</b><b>COAUTHINFO</b> structure can be specified for <b>pAuthInfo</b> to meet any one of the following needs:
  * 
  * <ul>
  * <li>To specify a different client identity for computer remote activations. The specified identity will be used for the launch permission check on the server rather than the real client identity.
  * </li>
  * <li>To specify that Kerberos, rather than NTLMSSP, is used for machine remote activation. A nondefault client identity may or may not be specified. 
  * </li>
  * <li>To request unsecure activation.
  * </li>
  * <li>To specify a proprietary authentication service.</li>
  * </ul>
  * Specifying a <b>COAUTHINFO</b> structure allows DCOM activations to work correctly with security providers other than NTLMSSP. You can also specify additional security information used during remote activations for interoperability with alternate implementations of DCOM. 
  * 
  * If you set <b>dwAuthzSvc</b>, <b>pwszServerPrincName</b>, <b>dwImpersonationLevel</b>, or <b>dwCapabilities</b> to incorrect values and call either <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cogetclassobject">CoGetClassObject</a> or <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cocreateinstanceex">CoCreateInstanceEx</a>, these functions do not return E_INVALIDARG or a similar error. Default values are used instead of the incorrect values.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//wtypesbase/ns-wtypesbase-coauthinfo
 * @namespace Windows.Win32.System.Com
 * @version v4.0.30319
 */
class COAUTHINFO extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * The authentication service to be used. For a list of values, see <a href="https://docs.microsoft.com/windows/desktop/com/com-authentication-service-constants">Authentication Service Constants</a>. Use RPC_C_AUTHN_NONE if no authentication is required. RPC_C_AUTHN_WINNT is the default and RPC_C_AUTHN_GSS_KERBEROS is also supported.
     * @type {Integer}
     */
    dwAuthnSvc {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The authorization service to be used. For a list of values, see <a href="https://docs.microsoft.com/windows/desktop/com/com-authorization-constants">Authorization Constants</a>. To use the NT authentication service, specify RPC_C_AUTHZ_NONE.
     * @type {Integer}
     */
    dwAuthzSvc {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * The server principal name to use with the authentication service. If you are using RPC_C_AUTHN_WINNT, the principal name must be <b>NULL</b>.
     * @type {PWSTR}
     */
    pwszServerPrincName {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * The authentication level to be used. For a list of values, see <a href="https://docs.microsoft.com/windows/desktop/com/com-authentication-level-constants">Authentication Level Constants</a>.
     * 
     * As of Windows Server 2003, remote activations use the default authentication level specified in the <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-coinitializesecurity">CoInitializeSecurity</a> <i>dwAuthnLevel</i> parameter. In previous versions of Windows, RPC_C_AUTHN_LEVEL_CONNECT was always used for the security level unless another level was explicitly specified.
     * @type {Integer}
     */
    dwAuthnLevel {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * The impersonation level to be used. For a list of values, see <a href="https://docs.microsoft.com/windows/desktop/com/com-impersonation-level-constants">Impersonation Level Constants</a>. This value must be RPC_C_IMP_LEVEL_IMPERSONATE or above.
     * @type {Integer}
     */
    dwImpersonationLevel {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wtypesbase/ns-wtypesbase-coauthidentity">COAUTHIDENTITY</a> structure that establishes a nondefault client identity. If this parameter is <b>NULL</b>, the actual identity of the client is used. Values of structure members are authentication-service specific. This value must be <b>NULL</b> if <b>dwAuthnSvc</b> does not specify either the NTLMSSP or Kerberos network authentication protocol is used as the authorization service.
     * @type {Pointer<COAUTHIDENTITY>}
     */
    pAuthIdentityData {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * Indicates additional capabilities of this proxy. Currently, this member must be EOAC_NONE (0x0) or RPC_C_QOS_CAPABILITIES_MUTUAL_AUTH (0x1). Use RPC_C_QOS_CAPABILITIES_MUTUAL_AUTH if Kerberos is required.
     * @type {Integer}
     */
    dwCapabilities {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }
}
