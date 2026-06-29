#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\PXE_DHCPV6_OPTION.ahk" { PXE_DHCPV6_OPTION }

/**
 * Provides the DHCPV6 relay message.
 * @see https://learn.microsoft.com/windows/win32/api/wdspxe/ns-wdspxe-pxe_dhcpv6_relay_message
 * @namespace Windows.Win32.System.DeploymentServices
 */
export default struct PXE_DHCPV6_RELAY_MESSAGE {
    #StructPack 2

    /**
     * The message type
     */
    MessageType : Int8

    /**
     * The hop count
     */
    HopCount : Int8

    /**
     * The link address
     */
    LinkAddress : Int8[16]

    /**
     * The peer address
     */
    PeerAddress : Int8[16]

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/wdspxe/ns-wdspxe-pxe_dhcpv6_option">PXE_DHCPV6_OPTION</a> structure and see RFC 3315 section 7.
     */
    Options : PXE_DHCPV6_OPTION[1]

}
