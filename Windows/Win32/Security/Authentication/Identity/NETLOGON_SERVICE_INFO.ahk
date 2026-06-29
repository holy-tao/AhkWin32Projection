#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\LSA_UNICODE_STRING.ahk" { LSA_UNICODE_STRING }
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\..\System\PasswordManagement\CYPHER_BLOCK.ahk" { CYPHER_BLOCK }
#Import ".\NETLOGON_LOGON_IDENTITY_INFO.ahk" { NETLOGON_LOGON_IDENTITY_INFO }
#Import "..\..\..\System\PasswordManagement\LM_OWF_PASSWORD.ahk" { LM_OWF_PASSWORD }
#Import "..\..\..\Foundation\CHAR.ahk" { CHAR }

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct NETLOGON_SERVICE_INFO {
    #StructPack 8

    Identity : NETLOGON_LOGON_IDENTITY_INFO

    LmOwfPassword : LM_OWF_PASSWORD

    NtOwfPassword : LM_OWF_PASSWORD

}
