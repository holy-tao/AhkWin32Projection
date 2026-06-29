#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\LSA_UNICODE_STRING.ahk" { LSA_UNICODE_STRING }
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }
#Import "..\..\..\Foundation\LUID.ahk" { LUID }

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct KDC_PROXY_CACHE_ENTRY_DATA {
    #StructPack 8

    SinceLastUsed : Int64

    DomainName : LSA_UNICODE_STRING

    ProxyServerName : LSA_UNICODE_STRING

    ProxyServerVdir : LSA_UNICODE_STRING

    ProxyServerPort : UInt16

    LogonId : LUID

    CredUserName : LSA_UNICODE_STRING

    CredDomainName : LSA_UNICODE_STRING

    GlobalCache : BOOLEAN

}
