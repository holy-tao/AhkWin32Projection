#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The DhcpAddressOfferHook function is called by Microsoft DHCP Server directly before Microsoft DHCP Server sends an acknowledgment (ACK) to a DHCP REQUEST message.
 * @remarks
 * Implementations of the 
 * <b>DhcpAddressOfferHook</b> should not block.
 * @see https://learn.microsoft.com/windows/win32/api/dhcpssdk/nc-dhcpssdk-lpdhcp_give_address
 * @namespace Windows.Win32.NetworkManagement.Dhcp
 */
export default struct LPDHCP_GIVE_ADDRESS {
    value : IntPtr

    __value {
        set {
            if (value is LPDHCP_GIVE_ADDRESS) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Integer>} Packet Buffer for the packet being processed.
     * @param {Integer} PacketSize Size of the <i>Packet</i> parameter, in bytes.
     * @param {Integer} ControlCode Specifies the type of lease being approved. If the acknowledgment is for a new lease, <i>ControlCode</i> is DHCP_GIVE_ADDRESS_NEW. If the acknowledgment is for the renewal of an existing lease, <i>ControlCode</i> is DHCP_GIVE_ADDRESS_OLD.
     * @param {Integer} IpAddress Internet Protocol (IP) address of the socket on which the packet was received. The IP address is in host order.
     * @param {Integer} AltAddress Internet Protocol (IP) address being handed out in the lease.
     * @param {Integer} AddrType Specifies whether the address is a DHCP or BOOTP address. The default value is DHCP_CLIENT_DHCP.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="DHCP_CLIENT_DHCP_"></a><a id="dhcp_client_dhcp_"></a><dl>
     * <dt><b>DHCP_CLIENT_DHCP </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The address is a DHCP-served address.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="DHCP_CLIENT_BOOTP_"></a><a id="dhcp_client_bootp_"></a><dl>
     * <dt><b>DHCP_CLIENT_BOOTP </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The address is a BOOTP-served address.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Integer} LeaseTime Lease duration being passed, in seconds.
     * @param {Pointer<Void>} Reserved Reserve for future use.
     * @param {Pointer<Void>} PktContext Context identifying the packet, as provided in the <i>PktContext</i> parameter of a previous 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dhcpssdk/nc-dhcpssdk-lpdhcp_newpkt">DhcpNewPktHook</a> function call.
     * @returns {Integer} Return values are defined by the application providing the callback.
     */
    Call(Packet, PacketSize, ControlCode, IpAddress, AltAddress, AddrType, LeaseTime, Reserved, PktContext) {
        PacketMarshal := Packet is VarRef ? "char*" : "ptr"
        ReservedMarshal := Reserved is VarRef ? "ptr" : "ptr"
        PktContextMarshal := PktContext is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, PacketMarshal, Packet, UInt32, PacketSize, UInt32, ControlCode, UInt32, IpAddress, UInt32, AltAddress, UInt32, AddrType, UInt32, LeaseTime, ReservedMarshal, Reserved, PktContextMarshal, PktContext, UInt32)
        return result
    }

    /**
     * A LPDHCP_GIVE_ADDRESS that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends LPDHCP_GIVE_ADDRESS {
        /**
         * Creates a LPDHCP_GIVE_ADDRESS pointer that invokes the given AHK function when called.
         * @param {Func("char*", UInt32, UInt32, UInt32, UInt32, UInt32, UInt32, "ptr", "ptr") => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 9)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 9 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["char*", UInt32, UInt32, UInt32, UInt32, UInt32, UInt32, "ptr", "ptr", UInt32])
        }

        __Delete() => CallbackFree(this.value)
    }
}
