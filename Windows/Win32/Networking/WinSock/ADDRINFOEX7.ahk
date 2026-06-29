#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\ADDRINFO_DNS_SERVER.ahk" { ADDRINFO_DNS_SERVER }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\SOCKADDR.ahk" { SOCKADDR }

/**
 * @namespace Windows.Win32.Networking.WinSock
 */
export default struct ADDRINFOEX7 {
    #StructPack 8

    ai_flags : Int32

    ai_family : Int32

    ai_socktype : Int32

    ai_protocol : Int32

    ai_addrlen : IntPtr

    ai_canonname : PWSTR

    ai_addr : SOCKADDR.Ptr

    ai_blob : IntPtr

    ai_bloblen : IntPtr

    ai_provider : Guid.Ptr

    ai_next : ADDRINFOEX7.Ptr

    ai_version : Int32

    ai_fqdn : PWSTR

    ai_interfaceindex : Int32

    ai_resolutionhandle : HANDLE

    ai_ttl : UInt32

    ai_numservers : UInt32

    ai_servers : ADDRINFO_DNS_SERVER.Ptr

    ai_responseflags : Int64

    ai_extraflags : Int64

}
