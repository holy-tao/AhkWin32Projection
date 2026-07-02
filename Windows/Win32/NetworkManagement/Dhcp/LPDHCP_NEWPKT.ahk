#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * The DhcpNewPktHook function is called by Microsoft DHCP Server shortly after it receives a DHCP packet slated for processing.
 * @remarks
 * If useful, third-party DLLs can modify the <i>Packet</i> buffer, or return a new packet buffer through appropriate modification of the <i>Packet</i> and <i>PacketSize</i> parameters.
 * 
 * If a third-party DLL needs to keep track of a given packet and its progress through Microsoft DHCP Server, it can provide a packet context in <i>PktContext</i>, and use internal structures that track the packet's progress through its DHCP processing. A context provided in <i>PktContext</i> will be passed as a parameter to many other DHCP Server API functions, enabling identification.
 * @see https://learn.microsoft.com/windows/win32/api/dhcpssdk/nc-dhcpssdk-lpdhcp_newpkt
 * @namespace Windows.Win32.NetworkManagement.Dhcp
 */
export default struct LPDHCP_NEWPKT {
    value : IntPtr

    __value {
        set {
            if (value is LPDHCP_NEWPKT) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Pointer<Integer>>} Packet Pointer to a 4Kb character buffer that contains the packet.
     * 
     * <div class="alert"><b>Note</b>  Writing to this buffer directly is not recommended.</div>
     * <div> </div>
     * @param {Pointer<Integer>} PacketSize Pointer to the size of the <i>Packet</i> parameter.
     * @param {Integer} IpAddress Pointer to the IP address of the socket on which the packet was received. The IP address is in host order.
     * @param {Pointer<Void>} Reserved Reserved for future use.
     * @param {Pointer<Pointer<Void>>} PktContext Pointer provided by the third-party DLL, and used by Microsoft DHCP Server in future references to this specific packet. Third-party DLLs interested in such tracking are responsible for providing and tracking this packet context.
     * @param {Pointer<BOOL>} ProcessIt Flag identifying whether Microsoft DHCP Server should continue processing the packet. Set to <b>TRUE</b> to indicate processing should proceed. Set to <b>FALSE</b> to have Microsoft DHCP Server drop the packet.
     * @returns {Integer} Return values are defined by the application providing the callback.
     */
    Call(Packet, PacketSize, IpAddress, Reserved, PktContext, ProcessIt) {
        PacketMarshal := Packet is VarRef ? "ptr*" : "ptr"
        PacketSizeMarshal := PacketSize is VarRef ? "uint*" : "ptr"
        ReservedMarshal := Reserved is VarRef ? "ptr" : "ptr"
        PktContextMarshal := PktContext is VarRef ? "ptr*" : "ptr"
        ProcessItMarshal := ProcessIt is VarRef ? "int*" : "ptr"

        result := DllCall(this.value, PacketMarshal, Packet, PacketSizeMarshal, PacketSize, UInt32, IpAddress, ReservedMarshal, Reserved, PktContextMarshal, PktContext, ProcessItMarshal, ProcessIt, UInt32)
        return result
    }

    /**
     * A LPDHCP_NEWPKT that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends LPDHCP_NEWPKT {
        /**
         * Creates a LPDHCP_NEWPKT pointer that invokes the given AHK function when called.
         * @param {Func("ptr*", "uint*", UInt32, "ptr", "ptr*", BOOL) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 6)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 6 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr*", "uint*", UInt32, "ptr", "ptr*", BOOL.Ptr, UInt32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
