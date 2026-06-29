#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The RTM_NET_ADDRESS structure is used to communicate address information to the routing table manager for any address family. The address family must use only with contiguous address masks that are less than 8 bytes.
 * @remarks
 * If the client specifies an address and a mask length that do not correspond to each other, inconsistent results are returned by the routing table manager. For example, if a client specifies an address as 10.10.10.10 and a length as 24 when calling 
 * <a href="https://docs.microsoft.com/windows/desktop/api/rtmv2/nf-rtmv2-rtm_ipv4_set_addr_and_len">RTM_IPV4_SET_ADDR_AND_LEN</a>, the routing table manager may return an incorrect <i>NetAddress</i>.
 * @see https://learn.microsoft.com/windows/win32/api/rtmv2/ns-rtmv2-rtm_net_address
 * @namespace Windows.Win32.NetworkManagement.Rras
 */
export default struct RTM_NET_ADDRESS {
    #StructPack 2

    /**
     * Specifies the type of network address for this address (such as IPv4).
     */
    AddressFamily : UInt16

    /**
     * Specifies the number of bits in the network part of the <b>AddrBits</b> bit array (for example, 192.168.0.0 has 8 bits).
     */
    NumBits : UInt16

    /**
     * Specifies an array of bits that form the address prefix.
     */
    AddrBits : Int8[16]

}
