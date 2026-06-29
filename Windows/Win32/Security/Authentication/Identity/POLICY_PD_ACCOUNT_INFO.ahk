#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\LSA_UNICODE_STRING.ahk" { LSA_UNICODE_STRING }
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct POLICY_PD_ACCOUNT_INFO {
    #StructPack 8

    Name : LSA_UNICODE_STRING

}
