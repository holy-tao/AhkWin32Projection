#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Represents IP information for a NetName resource.
 * @see https://learn.microsoft.com/windows/win32/api/clusapi/ns-clusapi-clus_netname_ip_info_entry
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct CLUS_NETNAME_IP_INFO_ENTRY {
    #StructPack 4

    /**
     * The ID of the node that hosts the NetName resource.
     */
    NodeId : UInt32

    /**
     * The size of the <i>BYTE</i> parameter, in bytes.
     */
    AddressSize : UInt32

    /**
     * A byte array that contains the address of the NetName.
     */
    Address : Int8[1]

}
