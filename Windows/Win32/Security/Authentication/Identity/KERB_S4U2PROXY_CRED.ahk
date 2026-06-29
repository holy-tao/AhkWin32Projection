#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\KERB_S4U2PROXY_CACHE_ENTRY_INFO.ahk" { KERB_S4U2PROXY_CACHE_ENTRY_INFO }
#Import ".\LSA_UNICODE_STRING.ahk" { LSA_UNICODE_STRING }
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\..\Foundation\NTSTATUS.ahk" { NTSTATUS }

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct KERB_S4U2PROXY_CRED {
    #StructPack 8

    UserName : LSA_UNICODE_STRING

    DomainName : LSA_UNICODE_STRING

    Flags : UInt32

    LastStatus : NTSTATUS

    Expiry : Int64

    CountOfEntries : UInt32

    Entries : KERB_S4U2PROXY_CACHE_ENTRY_INFO.Ptr

}
