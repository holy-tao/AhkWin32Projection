#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\LSA_UNICODE_STRING.ahk" { LSA_UNICODE_STRING }
#Import "..\..\Credentials\SecHandle.ahk" { SecHandle }
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }
#Import ".\KERB_PROTOCOL_MESSAGE_TYPE.ahk" { KERB_PROTOCOL_MESSAGE_TYPE }
#Import "..\..\..\Foundation\LUID.ahk" { LUID }

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct KERB_SETPASSWORD_EX_REQUEST {
    #StructPack 8

    MessageType : KERB_PROTOCOL_MESSAGE_TYPE

    LogonId : LUID

    CredentialsHandle : SecHandle

    Flags : UInt32

    AccountRealm : LSA_UNICODE_STRING

    AccountName : LSA_UNICODE_STRING

    Password : LSA_UNICODE_STRING

    ClientRealm : LSA_UNICODE_STRING

    ClientName : LSA_UNICODE_STRING

    Impersonating : BOOLEAN

    KdcAddress : LSA_UNICODE_STRING

    KdcAddressType : UInt32

}
