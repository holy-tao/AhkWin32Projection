#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\KERB_REQUEST_FLAGS.ahk" { KERB_REQUEST_FLAGS }
#Import ".\LSA_UNICODE_STRING.ahk" { LSA_UNICODE_STRING }
#Import ".\KERB_ADD_CREDENTIALS_REQUEST.ahk" { KERB_ADD_CREDENTIALS_REQUEST }
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\KERB_PROTOCOL_MESSAGE_TYPE.ahk" { KERB_PROTOCOL_MESSAGE_TYPE }
#Import "..\..\..\Foundation\LUID.ahk" { LUID }

/**
 * Specifies a message to add, remove, or replace an extra server credential for a logon session, and the service principal names (SPNs) to be associated with that credential.
 * @remarks
 * Calling the   <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/nf-ntsecapi-lsacallauthenticationpackage">LsaCallAuthenticationPackage</a> function with this structure affects only the behavior of the <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-acceptsecuritycontext">AcceptSecurityContext (Kerberos)</a> function. Using this structure allows multiple physical and virtual servers to share a single identity.
 * @see https://learn.microsoft.com/windows/win32/api/ntsecapi/ns-ntsecapi-kerb_add_credentials_request_ex
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct KERB_ADD_CREDENTIALS_REQUEST_EX {
    #StructPack 8

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/ns-ntsecapi-kerb_add_credentials_request">KERB_ADD_CREDENTIALS_REQUEST</a> structure that specifies the credentials to add, remove, or replace.
     */
    Credentials : KERB_ADD_CREDENTIALS_REQUEST

    /**
     * The number of elements in the <b>PrincipalNames</b> array.
     */
    PrincipalNameCount : UInt32

    /**
     * An array of SPNs to be associated with the user account specified by the <b>Credentials</b> member
     */
    PrincipalNames : LSA_UNICODE_STRING[1]

}
