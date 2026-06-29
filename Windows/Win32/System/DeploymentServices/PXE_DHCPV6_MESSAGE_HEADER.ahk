#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Describes the fields in common between the PXE_DHCPV6_MESSAGE and PXE_DHCPV6_RELAY_MESSAGE structures.
 * @see https://learn.microsoft.com/windows/win32/api/wdspxe/ns-wdspxe-pxe_dhcpv6_message_header
 * @namespace Windows.Win32.System.DeploymentServices
 */
export default struct PXE_DHCPV6_MESSAGE_HEADER {
    #StructPack 1

    /**
     * The DHCPv6 Message Type.
     */
    MessageType : Int8

    /**
     * The remainder of the packet which must be interpreted differently based on the <b>MessageType</b>.
     */
    Message : Int8[1]

}
