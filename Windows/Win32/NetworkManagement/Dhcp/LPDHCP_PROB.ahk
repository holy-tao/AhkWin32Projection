#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The DhcpAddressDelHook function is called by Microsoft DHCP Server when one of the following four defined events occurs.
 * @remarks
 * The following table defines the four defined events that trigger Microsoft DHCP Server to call the 
 * <b>DhcpAddressDelHook</b> function in a third-party DLL.
 * 
 * <table>
 * <tr>
 * <th>Control code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td>DHCP_PROB_CONFLICT</td>
 * <td>The address attempted to be offered, as provided in <i>AltAddress</i>, is already in use on the network.</td>
 * </tr>
 * <tr>
 * <td>DHCP_PROB_DECLINE</td>
 * <td>The packet was a DECLINE message for the address specified in <i>AltAddress</i>.</td>
 * </tr>
 * <tr>
 * <td>DHCP_PROB_RELEASE</td>
 * <td>The packet was a RELEASE message for the address specified in <i>AltAddress</i>.</td>
 * </tr>
 * <tr>
 * <td>DHCP_PROB_NACKED</td>
 * <td>The packet was a REQUEST message for the address specified in <i>AltAddress</i>, and the request was declined by Microsoft DHCP Server.</td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/dhcpssdk/nc-dhcpssdk-lpdhcp_prob
 * @namespace Windows.Win32.NetworkManagement.Dhcp
 */
export default struct LPDHCP_PROB {
    value : IntPtr

    __value {
        set {
            if (value is LPDHCP_PROB) {
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
     * @param {Integer} ControlCode Specifies the event. See Remarks for control code definitions.
     * @param {Integer} IpAddress Internet Protocol (IP) address of the socket on which the packet was received. The IP address is in host order.
     * @param {Integer} AltAddress Internet Protocol (IP) address used to provide additional information about the event. The meaning of <i>AltAddress</i> varies based on the value of <i>ControlCode</i>. See Remarks.
     * @param {Pointer<Void>} Reserved Reserve for future use.
     * @param {Pointer<Void>} PktContext Context identifying the packet, as provided in the <i>PktContext</i> parameter of a previous 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dhcpssdk/nc-dhcpssdk-lpdhcp_newpkt">DhcpNewPktHook</a> function call.
     * @returns {Integer} Return values are defined by the application providing the callback.
     */
    Call(Packet, PacketSize, ControlCode, IpAddress, AltAddress, Reserved, PktContext) {
        PacketMarshal := Packet is VarRef ? "char*" : "ptr"
        ReservedMarshal := Reserved is VarRef ? "ptr" : "ptr"
        PktContextMarshal := PktContext is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, PacketMarshal, Packet, UInt32, PacketSize, UInt32, ControlCode, UInt32, IpAddress, UInt32, AltAddress, ReservedMarshal, Reserved, PktContextMarshal, PktContext, UInt32)
        return result
    }

    /**
     * A LPDHCP_PROB that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends LPDHCP_PROB {
        /**
         * Creates a LPDHCP_PROB pointer that invokes the given AHK function when called.
         * @param {Func("char*", UInt32, UInt32, UInt32, UInt32, "ptr", "ptr") => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 7)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 7 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["char*", UInt32, UInt32, UInt32, UInt32, "ptr", "ptr", UInt32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
