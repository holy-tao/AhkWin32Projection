#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The PMGM_WRONG_IF_CALLBACK is a call into a routing protocol to notify the protocol that a packet has been received from the specified source and for the specified group on the wrong interface.
 * @remarks
 * This callback is not currently available.
 * @see https://learn.microsoft.com/windows/win32/api/mgm/nc-mgm-pmgm_wrong_if_callback
 * @namespace Windows.Win32.NetworkManagement.Rras
 */
export default struct PMGM_WRONG_IF_CALLBACK {
    value : IntPtr

    __value {
        set {
            if (value is PMGM_WRONG_IF_CALLBACK) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Integer} dwSourceAddr Specifies the source address from which the multicast data was received. Zero indicates that data is received from all sources (a wildcard receiver for a group); otherwise, the value of <i>dwSourceAddr</i> is the IP address of the source or source network.
     * @param {Integer} dwGroupAddr Specifies the multicast group for which the data is destined. Zero indicates that all groups are received (a wildcard receiver); otherwise, the value of <i>dwGroupAddr</i> is the IP address of the group.
     * @param {Integer} dwIfIndex Specifies the interface on which the packet arrived.
     * @param {Integer} dwIfNextHopAddr Specifies the address of the next hop that corresponds to the index specified by <i>dwIfIndex</i>. The <i>dwIfIndex</i> and <i>dwIfNextHopIPAddr</i> parameters uniquely identify a next hop on point-to-multipoint interfaces. A point-to-multipoint interface is a connection where one interface connects to multiple networks. Examples of point-to-multipoint interfaces include non-broadcast multiple access (NBMA) interfaces and the internal interface on which all dial-up clients connect. 
     * 
     * 
     * 
     * 
     * For broadcast interfaces (such as Ethernet interfaces) or point-to-point interfaces, which are identified by only the value of <i>dwIfIndex</i>, specify zero.
     * @param {Integer} dwHdrSize Specifies, in bytes, the size of the buffer pointed to by <i>pbPacketHdr</i>.
     * @param {Pointer<Integer>} pbPacketHdr Pointer to a buffer that contains the IP header of the packet, including the IP options and a fragment of the data. This parameter is used by those protocols that examine the contents of the packet header.
     * @returns {Integer} RRAS does not expect the application to return any specific value; any value returned is ignored by RRAS.
     */
    Call(dwSourceAddr, dwGroupAddr, dwIfIndex, dwIfNextHopAddr, dwHdrSize, pbPacketHdr) {
        pbPacketHdrMarshal := pbPacketHdr is VarRef ? "char*" : "ptr"

        result := DllCall(this.value, UInt32, dwSourceAddr, UInt32, dwGroupAddr, UInt32, dwIfIndex, UInt32, dwIfNextHopAddr, UInt32, dwHdrSize, pbPacketHdrMarshal, pbPacketHdr, UInt32)
        return result
    }

    /**
     * A PMGM_WRONG_IF_CALLBACK that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PMGM_WRONG_IF_CALLBACK {
        /**
         * Creates a PMGM_WRONG_IF_CALLBACK pointer that invokes the given AHK function when called.
         * @param {Func(UInt32, UInt32, UInt32, UInt32, UInt32, "char*") => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 6)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 6 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [UInt32, UInt32, UInt32, UInt32, UInt32, "char*", UInt32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
