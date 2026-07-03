#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The DHCP_CALLOUT_TABLE structure is used by Microsoft DHCP Server and third-party DLLs to send notification requests for DHCP Server events.
 * @remarks
 * It is not necessary to implement all hooks available from Microsoft DHCP Server. If notification for a particular event is not required, set the member to <b>NULL</b>. Remember, however, that the initially loaded third-party DLL is responsible for loading subsequent third-party DLLs, and that subsequent DLLs may require notification of events that otherwise would be <b>NULL</b>, resulting in a non-<b>NULL</b> setting for members used by chained third-party DLLs that would otherwise be unused.
 * @see https://learn.microsoft.com/windows/win32/api/dhcpssdk/ns-dhcpssdk-dhcp_callout_table
 * @namespace Windows.Win32.NetworkManagement.Dhcp
 */
export default struct DHCP_CALLOUT_TABLE {
    #StructPack 8

    /**
     * Pointer to a 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dhcpssdk/nc-dhcpssdk-lpdhcp_control">DhcpControlHook</a> function, implemented in a third-party DLL, to be called when Microsoft DHCP Server is started, stopped, paused, or continued. Set to <b>NULL</b> if notification is not required.
     */
    DhcpControlHook : IntPtr

    /**
     * Pointer to a 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dhcpssdk/nc-dhcpssdk-lpdhcp_newpkt">DhcpNewPktHook</a> function, implemented in a third-party DLL, to be called when Microsoft DHCP Server receives a packet that it attempts to process. Set to <b>NULL</b> if notification is not required.
     */
    DhcpNewPktHook : IntPtr

    /**
     * Pointer to a 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dhcpssdk/nc-dhcpssdk-lpdhcp_drop_send">DhcpPktDropHook</a> function, implemented in a third-party DLL, to be called when Microsoft DHCP Server drops a packet, and when a packet is completely processed by Microsoft DHCP Server. Set to <b>NULL</b> if notification is not required.
     */
    DhcpPktDropHook : IntPtr

    /**
     * Pointer to a 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa363294(v=vs.85)">DhcpPktSendHook</a> function, implemented in a third-party DLL, to be called directly before Microsoft DHCP Server submits a response to a client inquiry. Set to <b>NULL</b> if notification is not required.
     */
    DhcpPktSendHook : IntPtr

    /**
     * Pointer to a 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dhcpssdk/nc-dhcpssdk-lpdhcp_prob">DhcpAddressDelHook</a> function, implemented in a third-party DLL, to be called when a specified event in Microsoft DHCP Server results in a packet being dropped. Set to <b>NULL</b> if notification is not required.
     */
    DhcpAddressDelHook : IntPtr

    /**
     * Pointer to a 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dhcpssdk/nc-dhcpssdk-lpdhcp_give_address">DhcpAddressOfferHook</a> function, implemented in a third-party DLL, to be called directly before Microsoft DHCP Server submits a DHCP ACK message in response to a DHCP REQUEST message. Set to <b>NULL</b> if notification is not required.
     */
    DhcpAddressOfferHook : IntPtr

    /**
     * Pointer to a 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dhcpssdk/nc-dhcpssdk-lpdhcp_handle_options">DhcpHandleOptionsHook</a> function, implemented in a third-party DLL, that sends only parsed DHCP information to the third-party DLL, enabling the third-party DLL to avoid processing the entire DHCP packet. Set to <b>NULL</b> if notification is not required.
     */
    DhcpHandleOptionsHook : IntPtr

    /**
     * Pointer to a 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dhcpssdk/nc-dhcpssdk-lpdhcp_delete_client">DhcpDeleteClientHook</a> function, implemented in a third-party DLL, to be called directly before Microsoft DHCP Server deletes a client lease from its active leases database. Set to <b>NULL</b> if notification is not required.
     */
    DhcpDeleteClientHook : IntPtr

    /**
     * Reserved for future use.
     */
    DhcpExtensionHook : IntPtr

    /**
     * Reserved for future use.
     */
    DhcpReservedHook : IntPtr

}
