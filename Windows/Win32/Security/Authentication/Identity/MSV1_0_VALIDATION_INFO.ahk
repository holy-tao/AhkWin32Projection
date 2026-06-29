#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\LSA_UNICODE_STRING.ahk" { LSA_UNICODE_STRING }
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }
#Import "..\..\..\System\PasswordManagement\CYPHER_BLOCK.ahk" { CYPHER_BLOCK }
#Import ".\USER_SESSION_KEY.ahk" { USER_SESSION_KEY }
#Import "..\..\..\Foundation\CHAR.ahk" { CHAR }

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct MSV1_0_VALIDATION_INFO {
    #StructPack 8

    LogoffTime : Int64

    KickoffTime : Int64

    LogonServer : LSA_UNICODE_STRING

    LogonDomainName : LSA_UNICODE_STRING

    SessionKey : USER_SESSION_KEY

    Authoritative : BOOLEAN

    UserFlags : UInt32

    WhichFields : UInt32

    UserId : UInt32

}
