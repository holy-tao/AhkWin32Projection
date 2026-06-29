#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\LSA_UNICODE_STRING.ahk" { LSA_UNICODE_STRING }
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\PSID.ahk" { PSID }

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct LSA_FOREST_TRUST_SCANNER_INFO {
    #StructPack 8

    DomainSid : PSID

    DnsName : LSA_UNICODE_STRING

    NetbiosName : LSA_UNICODE_STRING

}
