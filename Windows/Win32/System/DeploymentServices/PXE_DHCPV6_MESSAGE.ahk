#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\PXE_DHCPV6_OPTION.ahk" { PXE_DHCPV6_OPTION }

/**
 * A DHCPV6 message.
 * @see https://learn.microsoft.com/windows/win32/api/wdspxe/ns-wdspxe-pxe_dhcpv6_message
 * @namespace Windows.Win32.System.DeploymentServices
 */
export default struct PXE_DHCPV6_MESSAGE {
    #StructPack 2

    /**
     * The DHCPv6 message type.
     */
    MessageType : Int8

    /**
     * Byte 1  of the transaction-id in the DHCPv6 message.
     */
    TransactionIDByte1 : Int8

    /**
     * Byte 2  of the transaction-id  the DHCPv6 message.
     */
    TransactionIDByte2 : Int8

    /**
     * Byte 3  of the transaction-id DHCPv6 message.
     */
    TransactionIDByte3 : Int8

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/wdspxe/ns-wdspxe-pxe_dhcpv6_option">PXE_DHCPV6_OPTION</a> structure that specifies the DHCPV6 option.
     */
    Options : PXE_DHCPV6_OPTION[1]

}
