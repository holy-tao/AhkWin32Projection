#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\LSA_UNICODE_STRING.ahk" { LSA_UNICODE_STRING }
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }
#Import ".\MSV1_0_PROTOCOL_MESSAGE_TYPE.ahk" { MSV1_0_PROTOCOL_MESSAGE_TYPE }

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct MSV1_0_CHANGEPASSWORD_REQUEST {
    #StructPack 8

    MessageType : MSV1_0_PROTOCOL_MESSAGE_TYPE

    DomainName : LSA_UNICODE_STRING

    AccountName : LSA_UNICODE_STRING

    OldPassword : LSA_UNICODE_STRING

    NewPassword : LSA_UNICODE_STRING

    Impersonating : BOOLEAN

}
