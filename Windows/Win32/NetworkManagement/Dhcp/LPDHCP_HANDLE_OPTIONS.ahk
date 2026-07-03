#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DHCP_SERVER_OPTIONS.ahk" { DHCP_SERVER_OPTIONS }

/**
 * The DhcpHandleOptionsHook function enables third-party DLLs to obtain commonly used options from a DHCP packet, avoiding the need to process the entire DHCP packet. The DhcpHandleOptionsHook function should not block.
 * @remarks
 * The 
 * <i>DhcpHandleOptionsHook</i> function is useful when developers of third-party DLLs want to avoid having to process an entire DHCP packet, and rather, could achieve the desired results by a set of commonly used server options. When third-party DLLs register for this event notification, the Microsoft DHCP Server parses the incoming packet, extracts commonly used server options, and passes them to the third-party DLL in the <i>ServerOptions</i> parameter.
 * 
 * If the <a href="https://docs.microsoft.com/windows/desktop/api/dhcpssdk/ns-dhcpssdk-dhcp_server_options">DHCP_SERVER_OPTIONS</a> structure pointed to in <i>ServerOptions</i> is needed beyond the completion of the 
 * <i>DhcpHandleOptionsHook</i> function call, third-party DLLs must make a copy of the structure.
 * 
 * The 
 * <i>DhcpHandleOptionsHook</i> function can be called multiple times for a single packet.
 * @see https://learn.microsoft.com/windows/win32/api/dhcpssdk/nc-dhcpssdk-lpdhcp_handle_options
 * @namespace Windows.Win32.NetworkManagement.Dhcp
 */
export default struct LPDHCP_HANDLE_OPTIONS {
    value : IntPtr

    __value {
        set {
            if (value is LPDHCP_HANDLE_OPTIONS) {
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
     * @param {Pointer<Void>} Reserved Reserve for future use.
     * @param {Pointer<Void>} PktContext Context identifying the packet, as provided in the <i>PktContext</i> parameter of a previous 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dhcpssdk/nc-dhcpssdk-lpdhcp_newpkt">DhcpNewPktHook</a> function call.
     * @param {Pointer<DHCP_SERVER_OPTIONS>} ServerOptions Structure of type <a href="https://docs.microsoft.com/windows/desktop/api/dhcpssdk/ns-dhcpssdk-dhcp_server_options">DHCP_SERVER_OPTIONS</a> containing the information parsed from the packet by Microsoft DHCP Server, and provided as the collection of commonly used server options.
     * @returns {Integer} Return values are defined by the application providing the callback.
     */
    Call(Packet, PacketSize, Reserved, PktContext, ServerOptions) {
        PacketMarshal := Packet is VarRef ? "char*" : "ptr"
        ReservedMarshal := Reserved is VarRef ? "ptr" : "ptr"
        PktContextMarshal := PktContext is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, PacketMarshal, Packet, UInt32, PacketSize, ReservedMarshal, Reserved, PktContextMarshal, PktContext, DHCP_SERVER_OPTIONS.Ptr, ServerOptions, UInt32)
        return result
    }

    /**
     * A LPDHCP_HANDLE_OPTIONS that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends LPDHCP_HANDLE_OPTIONS {
        /**
         * Creates a LPDHCP_HANDLE_OPTIONS pointer that invokes the given AHK function when called.
         * @param {Func("char*", UInt32, "ptr", "ptr", DHCP_SERVER_OPTIONS) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 5)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 5 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["char*", UInt32, "ptr", "ptr", DHCP_SERVER_OPTIONS.Ptr, UInt32])
        }

        __Delete() => CallbackFree(this.value)
    }
}
