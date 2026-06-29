#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\PXE_DHCPV6_RELAY_MESSAGE.ahk" { PXE_DHCPV6_RELAY_MESSAGE }

/**
 * Describes packets nested in OPTION_RELAY_MSG message.
 * @see https://learn.microsoft.com/windows/win32/api/wdspxe/ns-wdspxe-pxe_dhcpv6_nested_relay_message
 * @namespace Windows.Win32.System.DeploymentServices
 */
export default struct PXE_DHCPV6_NESTED_RELAY_MESSAGE {
    #StructPack 8

    /**
     * A pointer to the nested RELAY-FORW message.
     */
    pRelayMessage : PXE_DHCPV6_RELAY_MESSAGE.Ptr

    /**
     * A pointer to the size of the nested RELAY-FORW message.
     */
    cbRelayMessage : UInt32

    /**
     * If the nested RELAY-FORW message contains <b>OPTION_INTERFACE_ID</b>, this  is a pointer to the option payload. Otherwise, this field will be <b>NULL</b>.
     */
    pInterfaceIdOption : IntPtr

    /**
     * If the nested RELAY-FORW message contains <b>OPTION_INTERFACE_ID</b>, this  is the size of the option payload.
     *      Otherwise, this field will be 0.
     */
    cbInterfaceIdOption : UInt16

}
