#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\LSA_UNICODE_STRING.ahk" { LSA_UNICODE_STRING }
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }
#Import ".\KERB_PROTOCOL_MESSAGE_TYPE.ahk" { KERB_PROTOCOL_MESSAGE_TYPE }

/**
 * Contains information used to change a password.
 * @see https://learn.microsoft.com/windows/win32/api/ntsecapi/ns-ntsecapi-kerb_changepassword_request
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct KERB_CHANGEPASSWORD_REQUEST {
    #StructPack 8

    MessageType : KERB_PROTOCOL_MESSAGE_TYPE

    /**
     * <b>UNICODE_STRING</b> that contains the domain name of the account for which to change the password.
     */
    DomainName : LSA_UNICODE_STRING

    /**
     * <b>UNICODE_STRING</b> that contains the account name of the account for which to change the password.
     */
    AccountName : LSA_UNICODE_STRING

    /**
     * <b>UNICODE_STRING</b> that contains the old password to be changed.
     */
    OldPassword : LSA_UNICODE_STRING

    /**
     * <b>UNICODE_STRING</b> that contains the new password.
     */
    NewPassword : LSA_UNICODE_STRING

    /**
     * TRUE if the client is impersonating another <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">security principal</a>. Otherwise, false.
     */
    Impersonating : BOOLEAN

}
