#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\LUID.ahk" { LUID }
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\KERB_PROTOCOL_MESSAGE_TYPE.ahk" { KERB_PROTOCOL_MESSAGE_TYPE }
#Import ".\LSA_UNICODE_STRING.ahk" { LSA_UNICODE_STRING }
#Import "..\..\Credentials\SecHandle.ahk" { SecHandle }

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct KERB_SETPASSWORD_REQUEST {
    #StructPack 8

    MessageType : KERB_PROTOCOL_MESSAGE_TYPE

    LogonId : LUID

    CredentialsHandle : SecHandle

    Flags : UInt32

    DomainName : LSA_UNICODE_STRING

    AccountName : LSA_UNICODE_STRING

    Password : LSA_UNICODE_STRING

}
