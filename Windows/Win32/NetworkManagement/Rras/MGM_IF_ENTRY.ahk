#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * The MGM_IF_ENTRY structure describes a router interface.
 * @see https://learn.microsoft.com/windows/win32/api/mgm/ns-mgm-mgm_if_entry
 * @namespace Windows.Win32.NetworkManagement.Rras
 */
export default struct MGM_IF_ENTRY {
    #StructPack 4

    /**
     * Specifies the index of the interface.
     */
    dwIfIndex : UInt32

    /**
     * Specifies the address of the next hop that corresponds to the index specified by <b>dwIfIndex</b>. The <b>dwIfIndex</b> and <b>dwIfNextHopIPAddr</b> members uniquely identify a next hop on point-to-multipoint interfaces. A point-to-multipoint interface is a connection where one interface connects to multiple networks. Examples of point-to-multipoint interfaces include non-broadcast multiple access (NBMA) interfaces and the internal interface on which all dial-up clients connect. 
     * 
     * 
     * 
     * 
     * For broadcast interfaces (such as Ethernet interfaces) or point-to-point interfaces, which are identified by only the value of <b>dwIfIndex</b>, specify zero.
     */
    dwIfNextHopAddr : UInt32

    /**
     * Indicates whether or not IGMP is enabled on this interface. If <b>bIGMP</b> is <b>TRUE</b>, then IGMP is enabled on this interface. If <b>bIGMP</b> is <b>FALSE</b>, then IGMP is not enabled on this interface.
     */
    bIGMP : BOOL

    /**
     * Indicates whether or not multicast forwarding is enabled on this interface. If <b>bIsEnabled</b> is <b>TRUE</b>, multicast forwarding is enabled on this interface. If <b>bIsEnabled</b> is <b>FALSE</b>, multicast forwarding is disabled on this interface.
     */
    bIsEnabled : BOOL

}
