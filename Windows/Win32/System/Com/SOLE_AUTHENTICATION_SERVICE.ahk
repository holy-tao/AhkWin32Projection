#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * The SOLE_AUTHENTICATION_SERVICE (objidlbase.h) structure identifies an authentication service that a server is willing to use to communicate to a client.
 * @see https://learn.microsoft.com/windows/win32/api/objidlbase/ns-objidlbase-sole_authentication_service
 * @namespace Windows.Win32.System.Com
 */
export default struct SOLE_AUTHENTICATION_SERVICE {
    #StructPack 8

    /**
     * The authentication service. This member can be a single value from the <a href="https://docs.microsoft.com/windows/desktop/com/com-authentication-service-constants">Authentication Service Constants</a>.
     */
    dwAuthnSvc : UInt32

    /**
     * The authorization service. This member can be a single value from the <a href="https://docs.microsoft.com/windows/desktop/com/com-authorization-constants">Authorization Constants</a>.
     */
    dwAuthzSvc : UInt32

    /**
     * The principal name to be used with the authentication service. If the principal name is <b>NULL</b>, the current user identifier is assumed. A <b>NULL</b> principal name is allowed for NTLMSSP, Kerberos, and Snego authentication services but may not work for other authentication services. For Schannel, this member must point to a <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cert_context">CERT_CONTEXT</a> structure that contains the server's certificate; if it <b>NULL</b> and if a certificate for the current user does not exist, RPC_E_NO_GOOD_SECURITY_PACKAGES is returned.
     */
    pPrincipalName : PWSTR

    /**
     * When used in <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-coinitializesecurity">CoInitializeSecurity</a>, set on return to indicate the status of the call to register the authentication services.
     */
    hr : HRESULT

}
