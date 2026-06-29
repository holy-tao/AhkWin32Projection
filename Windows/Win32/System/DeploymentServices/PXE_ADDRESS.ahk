#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies the network address for a packet.
 * @see https://learn.microsoft.com/windows/win32/api/wdspxe/ns-wdspxe-pxe_address
 * @namespace Windows.Win32.System.DeploymentServices
 */
export default struct PXE_ADDRESS {
    #StructPack 4

    /**
     * Indicates how the structure should be interpreted and which of the members of the structure are 
     *       valid.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PXE_ADDR_BROADCAST"></a><a id="pxe_addr_broadcast"></a><dl>
     * <dt><b>PXE_ADDR_BROADCAST</b></dt>
     * <dt>0x0001</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * For transmitted packets, this flag specifies that this packet should be broadcast on the network. If the 
     *         <b>PXE_ADDR_USE_PORT</b> flag is set, then the <b>uPort</b> member 
     *         specifies the port number to use; otherwise the source port number of the received packet is used as the 
     *         destination port number. This flag cannot be combined with <b>PXE_ADDR_USE_ADDR</b>.
     * 
     * For received packets, this flag indicates that the packet was set to the server using a broadcast address. 
     *         The <b>uPort</b> member indicates the port on which the packet was received, in host byte 
     *         order. The <b>bAddress</b> and <b>uAddrLen</b> members are filled with 
     *         the broadcast address used.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PXE_ADDR_USE_PORT"></a><a id="pxe_addr_use_port"></a><dl>
     * <dt><b>PXE_ADDR_USE_PORT</b></dt>
     * <dt>0x0002</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * For transmitted packets, this flag specifies that the <b>uPort</b> member is valid and 
     *         should be used as the destination port when the packet is sent. The <b>uPort</b> member 
     *         must be in host byte order.
     * 
     * For received packets, this flag indicates that the packet was not received as a broadcast.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PXE_ADDR_USE_ADDR"></a><a id="pxe_addr_use_addr"></a><dl>
     * <dt><b>PXE_ADDR_USE_ADDR</b></dt>
     * <dt>0x0004</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * For transmitted packets, this flag specifies that the <b>bAddress</b> and 
     *         <b>uAddrLen</b> members are valid and should be used as the destination address of the 
     *         packet.
     * 
     * For received packets, this flag is always set.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PXE_ADDR_USE_DHCP_RULES"></a><a id="pxe_addr_use_dhcp_rules"></a><dl>
     * <dt><b>PXE_ADDR_USE_DHCP_RULES</b></dt>
     * <dt>0x0008</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * For transmitted packets, this flag specifies that the received packet is a valid DHCP packet, and that the 
     *         DHCP rules for relay agent should be used to determine the destination address and port. If this flag is 
     *         specified then <b>bAddress</b>, <b>uIpAddress</b>, 
     *         <b>uAddrLen</b>, and <b>uPort</b> are ignored.
     * 
     * For received packets, this flag is not used.
     * 
     * </td>
     * </tr>
     * </table>
     */
    uFlags : UInt32

    bAddress : Int8[16]

    /**
     * Length of the address (<b>bAddress</b> or <b>uIpAddress</b>). For 
     *       more information, see the description for the <b>uFlags</b> member.
     */
    uAddrLen : UInt32

    /**
     * Port number for the packet. For more information, see the description for the 
     *       <b>uFlags</b> member.
     */
    uPort : UInt16

    static __New() {
        DefineProp(this.Prototype, 'uIpAddress', { type: UInt32, offset: 4 })
        this.DeleteProp("__New")
    }
}
