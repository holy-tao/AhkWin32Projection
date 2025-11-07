#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The DHCP_CALLOUT_TABLE structure is used by Microsoft DHCP Server and third-party DLLs to send notification requests for DHCP Server events.
 * @remarks
 * 
 * It is not necessary to implement all hooks available from Microsoft DHCP Server. If notification for a particular event is not required, set the member to <b>NULL</b>. Remember, however, that the initially loaded third-party DLL is responsible for loading subsequent third-party DLLs, and that subsequent DLLs may require notification of events that otherwise would be <b>NULL</b>, resulting in a non-<b>NULL</b> setting for members used by chained third-party DLLs that would otherwise be unused.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//dhcpssdk/ns-dhcpssdk-dhcp_callout_table
 * @namespace Windows.Win32.NetworkManagement.Dhcp
 * @version v4.0.30319
 */
class DHCP_CALLOUT_TABLE extends Win32Struct
{
    static sizeof => 80

    static packingSize => 8

    /**
     * Pointer to a 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dhcpssdk/nc-dhcpssdk-lpdhcp_control">DhcpControlHook</a> function, implemented in a third-party DLL, to be called when Microsoft DHCP Server is started, stopped, paused, or continued. Set to <b>NULL</b> if notification is not required.
     * @type {Pointer<LPDHCP_CONTROL>}
     */
    DhcpControlHook {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Pointer to a 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dhcpssdk/nc-dhcpssdk-lpdhcp_newpkt">DhcpNewPktHook</a> function, implemented in a third-party DLL, to be called when Microsoft DHCP Server receives a packet that it attempts to process. Set to <b>NULL</b> if notification is not required.
     * @type {Pointer<LPDHCP_NEWPKT>}
     */
    DhcpNewPktHook {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Pointer to a 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dhcpssdk/nc-dhcpssdk-lpdhcp_drop_send">DhcpPktDropHook</a> function, implemented in a third-party DLL, to be called when Microsoft DHCP Server drops a packet, and when a packet is completely processed by Microsoft DHCP Server. Set to <b>NULL</b> if notification is not required.
     * @type {Pointer<LPDHCP_DROP_SEND>}
     */
    DhcpPktDropHook {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Pointer to a 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa363294(v=vs.85)">DhcpPktSendHook</a> function, implemented in a third-party DLL, to be called directly before Microsoft DHCP Server submits a response to a client inquiry. Set to <b>NULL</b> if notification is not required.
     * @type {Pointer<LPDHCP_DROP_SEND>}
     */
    DhcpPktSendHook {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * Pointer to a 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dhcpssdk/nc-dhcpssdk-lpdhcp_prob">DhcpAddressDelHook</a> function, implemented in a third-party DLL, to be called when a specified event in Microsoft DHCP Server results in a packet being dropped. Set to <b>NULL</b> if notification is not required.
     * @type {Pointer<LPDHCP_PROB>}
     */
    DhcpAddressDelHook {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * Pointer to a 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dhcpssdk/nc-dhcpssdk-lpdhcp_give_address">DhcpAddressOfferHook</a> function, implemented in a third-party DLL, to be called directly before Microsoft DHCP Server submits a DHCP ACK message in response to a DHCP REQUEST message. Set to <b>NULL</b> if notification is not required.
     * @type {Pointer<LPDHCP_GIVE_ADDRESS>}
     */
    DhcpAddressOfferHook {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * Pointer to a 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dhcpssdk/nc-dhcpssdk-lpdhcp_handle_options">DhcpHandleOptionsHook</a> function, implemented in a third-party DLL, that sends only parsed DHCP information to the third-party DLL, enabling the third-party DLL to avoid processing the entire DHCP packet. Set to <b>NULL</b> if notification is not required.
     * @type {Pointer<LPDHCP_HANDLE_OPTIONS>}
     */
    DhcpHandleOptionsHook {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * Pointer to a 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dhcpssdk/nc-dhcpssdk-lpdhcp_delete_client">DhcpDeleteClientHook</a> function, implemented in a third-party DLL, to be called directly before Microsoft DHCP Server deletes a client lease from its active leases database. Set to <b>NULL</b> if notification is not required.
     * @type {Pointer<LPDHCP_DELETE_CLIENT>}
     */
    DhcpDeleteClientHook {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }

    /**
     * Reserved for future use.
     * @type {Pointer<Void>}
     */
    DhcpExtensionHook {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
    }

    /**
     * Reserved for future use.
     * @type {Pointer<Void>}
     */
    DhcpReservedHook {
        get => NumGet(this, 72, "ptr")
        set => NumPut("ptr", value, this, 72)
    }
}
