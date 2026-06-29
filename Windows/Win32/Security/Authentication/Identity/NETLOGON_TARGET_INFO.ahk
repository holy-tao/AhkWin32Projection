#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\LSA_UNICODE_STRING.ahk" { LSA_UNICODE_STRING }
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct NETLOGON_TARGET_INFO {
    #StructPack 8

    Type : UInt32

    NbComputerName : LSA_UNICODE_STRING

    NbDomainName : LSA_UNICODE_STRING

    DnsComputerName : LSA_UNICODE_STRING

    DnsDomainName : LSA_UNICODE_STRING

    DnsTreeName : LSA_UNICODE_STRING

    TargetName : LSA_UNICODE_STRING

}
