#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Identifies an authentication service, authorization service, and the authentication information for the specified authentication service.
 * @see https://docs.microsoft.com/windows/win32/api//objidl/ns-objidl-sole_authentication_info
 * @namespace Windows.Win32.System.Com
 * @version v4.0.30319
 */
class SOLE_AUTHENTICATION_INFO extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * The authentication service. This member can be a single value from the <a href="https://docs.microsoft.com/windows/desktop/com/com-authentication-service-constants">Authentication Service Constants</a>.
     * @type {Integer}
     */
    dwAuthnSvc {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The authorization service. This member can be a single value from the <a href="https://docs.microsoft.com/windows/desktop/com/com-authorization-constants">Authorization Constants</a>.
     * @type {Integer}
     */
    dwAuthzSvc {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * A pointer to the authentication information, whose type is specific to the authentication service identified by <b>dwAuthnSvc</b>.
     * 
     * For Schannel (<a href="https://docs.microsoft.com/windows/desktop/com/com-authentication-service-constants">RPC_C_AUTHN_GSS_SCHANNEL</a>), this member either points to a <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cert_context">CERT_CONTEXT</a> structure that contains the client's X.509 certificate or is <b>NULL</b> if the client has no certificate or wishes to remain anonymous to the server.
     * 
     * For NTLMSSP (<a href="https://docs.microsoft.com/windows/desktop/com/com-authentication-service-constants">RPC_C_AUTHN_WINNT</a>) and Kerberos (RPC_C_AUTHN_GSS_KERBEROS), this member points to a <a href="https://docs.microsoft.com/windows/desktop/api/sspi/ns-sspi-sec_winnt_auth_identity_a">SEC_WINNT_AUTH_IDENTITY</a> or <a href="https://docs.microsoft.com/windows/win32/api/sspi/ns-sspi-sec_winnt_auth_identity_ex2">SEC_WINNT_AUTH_IDENTITY_EX</a> structure that contains the user name and password.
     * 
     * For Snego (<a href="https://docs.microsoft.com/windows/desktop/com/com-authentication-service-constants">RPC_C_AUTHN_GSS_NEGOTIATE</a>), this member is either <b>NULL</b>, points to a <a href="https://docs.microsoft.com/windows/desktop/api/sspi/ns-sspi-sec_winnt_auth_identity_a">SEC_WINNT_AUTH_IDENTITY</a> structure, or points to a <a href="https://docs.microsoft.com/windows/win32/api/sspi/ns-sspi-sec_winnt_auth_identity_ex2">SEC_WINNT_AUTH_IDENTITY_EX</a> structure. If it is <b>NULL</b>, Snego will pick a list of authentication services based on those available on the client computer. If it points to a <b>SEC_WINNT_AUTH_IDENTITY_EX</b> structure, the structure's <b>PackageList</b> member must point to a string containing a comma-separated list of authentication service names and the <b>PackageListLength</b> member must give the number of bytes in the <b>PackageList</b> string. If <b>PackageList</b> is <b>NULL</b>, all calls using Snego will fail.
     * 
     * For authentication services not registered with DCOM, <b>pAuthInfo</b> must be set to <b>NULL</b> and DCOM will use the process identity to represent the client. For more information, see <a href="https://docs.microsoft.com/windows/desktop/com/com-and-security-packages">COM and Security Packages</a>.
     * @type {Pointer<Void>}
     */
    pAuthInfo {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
