#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * @namespace Windows.Win32.NetworkManagement.Dns
 */
export default struct DNS_CONNECTION_IFINDEX_ENTRY {
    #StructPack 8

    pwszConnectionName : PWSTR

    dwIfIndex : UInt32

}
