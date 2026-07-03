#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * LPDHCP_DROP_SEND callback function
 * @remarks
 * The 
 * <b>DhcpPktDropHook</b> function is called by Microsoft DHCP Server when a DHCP packet is dropped, or a packet is completely processed. The 
 * <b>DhcpPktDropHook</b> is implemented by a third-party DLL that registers for notification of significant Microsoft DHCP Server events.
 * 
 * The 
 * <b>DhcpPktDropHook</b> function should not block.
 * 
 * Third-party DLLs that register for notification of this event should be prepared to have their 
 * <b>DhcpPktDropHook</b> function called multiple times for each packet. If a packet is dropped by Microsoft DHCP Server, this function is called twice for that packet: once to notify that the packet was dropped, and again to identify that the packet was completely processed.
 * 
 * The following table defines the possible control codes returned in the <i>ControlCode</i> parameter.
 * 
 * <table>
 * <tr>
 * <th>Control code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td>DHCP_DROP_DUPLICATE</td>
 * <td>The packet is a duplicate of another received by the DHCP server.</td>
 * </tr>
 * <tr>
 * <td>DHCP_DROP_NOMEM</td>
 * <td>There is not enough memory available to process the packet.</td>
 * </tr>
 * <tr>
 * <td>DHCP_DROP_INTERNAL_ERROR</td>
 * <td>An unexpected internal error has occurred.</td>
 * </tr>
 * <tr>
 * <td>DHCP_DROP_TIMEOUT</td>
 * <td>The packet is too old to process.</td>
 * </tr>
 * <tr>
 * <td>DHCP_DROP_UNAUTH</td>
 * <td>The server is not authorized to process this packet.</td>
 * </tr>
 * <tr>
 * <td>DHCP_DROP_PAUSED</td>
 * <td>The server is paused.</td>
 * </tr>
 * <tr>
 * <td>DHCP_DROP_NO_SUBNETS</td>
 * <td>There are no subnets configured, therefore there is no point in processing the packet.</td>
 * </tr>
 * <tr>
 * <td>DHCP_DROP_INVALID</td>
 * <td>The packet is invalid, or it was received on an invalid socket.</td>
 * </tr>
 * <tr>
 * <td>DHCP_DROP_WRONG_SERVER</td>
 * <td>The packet was sent to the wrong DHCP Server.</td>
 * </tr>
 * <tr>
 * <td>DHCP_DROP_NOADDRESS</td>
 * <td>There is no address to offer.</td>
 * </tr>
 * <tr>
 * <td>DHCP_DROP_PROCESSED</td>
 * <td>The packet has been processed.</td>
 * </tr>
 * <tr>
 * <td>DHCP_DROP_GEN_FAILURE</td>
 * <td>An unknown error has occurred.</td>
 * </tr>
 * </table>
 *  
 * 
 * The 
 * <b>DhcpPktSendHook</b> function is called by Microsoft DHCP Server directly before Microsoft DHCP Server sends a response to a client. Registering for notification of 
 * <b>DhcpPktSendHook</b> enables third-party developers to alter the response of the Microsoft DHCP Server by manipulation of the packet pointers. The 
 * <b>DhcpPktSendHook</b> is implemented by a third-party DLL that registers for notification of significant Microsoft DHCP Server events.
 * 
 * The 
 * <b>DhcpPktSendHook</b> function should not block.
 * 
 * The 
 * <b>DhcpPktSendHook</b> function should not block.
 * @see https://learn.microsoft.com/windows/win32/api/dhcpssdk/nc-dhcpssdk-lpdhcp_drop_send
 * @namespace Windows.Win32.NetworkManagement.Dhcp
 */
export default struct LPDHCP_DROP_SEND {
    value : IntPtr

    __value {
        set {
            if (value is LPDHCP_DROP_SEND) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Pointer<Integer>>} Packet Pointer to a buffer, 4Kb in size,  that contains the packet.
     * 
     * <div class="alert"><b>Note</b>  Writing to this buffer directly is not recommended.</div>
     * <div> </div>
     * @param {Pointer<Integer>} PacketSize Pointer to the size of the <i>Packet</i> parameter, in bytes.
     * @param {Integer} ControlCode Control code that specifies the reason for dropping. See Remarks.
     * @param {Integer} IpAddress Internet Protocol (IP) address of the socket on which the packet was received. The IP address is in host order.
     * @param {Pointer<Void>} Reserved Reserved for future use.
     * @param {Pointer<Void>} PktContext Context identifying the packet, as provided in the <i>PktContext</i> parameter of a previous 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dhcpssdk/nc-dhcpssdk-lpdhcp_newpkt">DhcpNewPktHook</a> function call.
     * @returns {Integer} Return values are defined by the application providing the callback.
     */
    Call(Packet, PacketSize, ControlCode, IpAddress, Reserved, PktContext) {
        PacketMarshal := Packet is VarRef ? "ptr*" : "ptr"
        PacketSizeMarshal := PacketSize is VarRef ? "uint*" : "ptr"
        ReservedMarshal := Reserved is VarRef ? "ptr" : "ptr"
        PktContextMarshal := PktContext is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, PacketMarshal, Packet, PacketSizeMarshal, PacketSize, UInt32, ControlCode, UInt32, IpAddress, ReservedMarshal, Reserved, PktContextMarshal, PktContext, UInt32)
        return result
    }

    /**
     * A LPDHCP_DROP_SEND that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends LPDHCP_DROP_SEND {
        /**
         * Creates a LPDHCP_DROP_SEND pointer that invokes the given AHK function when called.
         * @param {Func("ptr*", "uint*", UInt32, UInt32, "ptr", "ptr") => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 6)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 6 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr*", "uint*", UInt32, UInt32, "ptr", "ptr", UInt32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
