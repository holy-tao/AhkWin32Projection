#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\KERB_REQUEST_FLAGS.ahk" { KERB_REQUEST_FLAGS }
#Import ".\LSA_UNICODE_STRING.ahk" { LSA_UNICODE_STRING }
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\KERB_PROTOCOL_MESSAGE_TYPE.ahk" { KERB_PROTOCOL_MESSAGE_TYPE }
#Import "..\..\..\Foundation\LUID.ahk" { LUID }

/**
 * Specifies a message to add, remove, or replace an extra server credential for a logon session.
 * @remarks
 * Calling  the <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/nf-ntsecapi-lsacallauthenticationpackage">LsaCallAuthenticationPackage</a> function with this structure affects only the behavior of the <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-acceptsecuritycontext">AcceptSecurityContext (Kerberos)</a> function. Using this structure allows multiple physical and virtual servers to share a single identity.
 * @see https://learn.microsoft.com/windows/win32/api/ntsecapi/ns-ntsecapi-kerb_add_credentials_request
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct KERB_ADD_CREDENTIALS_REQUEST {
    #StructPack 8

    /**
     * A 
     * 						value of the <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/ne-ntsecapi-kerb_protocol_message_type">KERB_PROTOCOL_MESSAGE_TYPE</a> enumeration that lists the types of messages that can be sent to the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/k-gly">Kerberos</a> authentication package by calling 
     * the <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/nf-ntsecapi-lsacallauthenticationpackage">LsaCallAuthenticationPackage</a> function. This member must be set to <b>KerbAddExtraCredentialsMessage</b>.
     */
    MessageType : KERB_PROTOCOL_MESSAGE_TYPE

    /**
     * The user name for the credential.
     */
    UserName : LSA_UNICODE_STRING

    /**
     * The domain name for the credential.
     */
    DomainName : LSA_UNICODE_STRING

    /**
     * The password for the credential.
     */
    Password : LSA_UNICODE_STRING

    /**
     * The logon ID of the credential. The value of this member can be <b>NULL</b>.
     */
    LogonId : LUID

    Flags : KERB_REQUEST_FLAGS

}
