#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\DNS_CUSTOM_SERVER.ahk" { DNS_CUSTOM_SERVER }
#Import "..\..\Foundation\CHAR.ahk" { CHAR }

/**
 * @namespace Windows.Win32.NetworkManagement.Dns
 */
export default struct DNS_QUERY_RAW_REQUEST {
    #StructPack 8

    version : UInt32

    resultsVersion : UInt32

    dnsQueryRawSize : UInt32

    dnsQueryRaw : IntPtr

    dnsQueryName : PWSTR

    dnsQueryType : UInt16

    queryOptions : Int64

    interfaceIndex : UInt32

    queryCompletionCallback : IntPtr

    queryContext : IntPtr

    queryRawOptions : Int64

    customServersSize : UInt32

    customServers : DNS_CUSTOM_SERVER.Ptr

    protocol : UInt32

    maxSa : CHAR[32]

}
