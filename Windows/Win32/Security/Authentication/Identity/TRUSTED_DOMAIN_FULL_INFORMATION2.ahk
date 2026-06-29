#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\LSA_UNICODE_STRING.ahk" { LSA_UNICODE_STRING }
#Import ".\TRUSTED_DOMAIN_INFORMATION_EX2.ahk" { TRUSTED_DOMAIN_INFORMATION_EX2 }
#Import ".\TRUSTED_POSIX_OFFSET_INFO.ahk" { TRUSTED_POSIX_OFFSET_INFO }
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\LSA_AUTH_INFORMATION.ahk" { LSA_AUTH_INFORMATION }
#Import ".\TRUSTED_DOMAIN_AUTH_INFORMATION.ahk" { TRUSTED_DOMAIN_AUTH_INFORMATION }
#Import "..\..\PSID.ahk" { PSID }

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct TRUSTED_DOMAIN_FULL_INFORMATION2 {
    #StructPack 8

    Information : TRUSTED_DOMAIN_INFORMATION_EX2

    PosixOffset : TRUSTED_POSIX_OFFSET_INFO

    AuthInformation : TRUSTED_DOMAIN_AUTH_INFORMATION

}
