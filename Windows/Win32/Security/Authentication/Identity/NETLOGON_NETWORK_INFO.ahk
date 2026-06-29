#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\LSA_STRING.ahk" { LSA_STRING }
#Import ".\LSA_UNICODE_STRING.ahk" { LSA_UNICODE_STRING }
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\NETLOGON_LOGON_IDENTITY_INFO.ahk" { NETLOGON_LOGON_IDENTITY_INFO }
#Import ".\CLEAR_BLOCK.ahk" { CLEAR_BLOCK }
#Import "..\..\..\Foundation\PSTR.ahk" { PSTR }
#Import "..\..\..\Foundation\CHAR.ahk" { CHAR }

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct NETLOGON_NETWORK_INFO {
    #StructPack 8

    Identity : NETLOGON_LOGON_IDENTITY_INFO

    LmChallenge : CLEAR_BLOCK

    NtChallengeResponse : LSA_STRING

    LmChallengeResponse : LSA_STRING

}
