#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DNS_CONNECTION_IFINDEX_ENTRY.ahk" { DNS_CONNECTION_IFINDEX_ENTRY }

/**
 * @namespace Windows.Win32.NetworkManagement.Dns
 */
export default struct DNS_CONNECTION_IFINDEX_LIST {
    #StructPack 8

    pConnectionIfIndexEntries : DNS_CONNECTION_IFINDEX_ENTRY.Ptr

    nEntries : UInt32

}
