#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The PMGM_LOCAL_LEAVE_CALLBACK callback is a call into a routing protocol to notify the routing protocol that the IGMP has detected that it no longer has receivers for a group on an interface that is currently owned by the routing protocol.
 * @remarks
 * This version of the Multicast Group Manager API supports only wildcard sources (*, g) or specific sources (s, g), not a range of sources. The same restriction applies to groups (that is, no group ranges are permitted).
 * @see https://learn.microsoft.com/windows/win32/api/mgm/nc-mgm-pmgm_local_leave_callback
 * @namespace Windows.Win32.NetworkManagement.Rras
 */
export default struct PMGM_LOCAL_LEAVE_CALLBACK {
    value : IntPtr

    __value {
        set {
            if (value is PMGM_LOCAL_LEAVE_CALLBACK) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Integer} dwSourceAddr Specifies the source address from which to stop receiving multicast data. Zero indicates to stop receiving data from all sources (a wildcard receiver for a group); otherwise, the value of <i>dwSourceAddr</i> is the IP address of the source or source network. 
     * 
     * 
     * 
     * 
     * To specify a range of source addresses, the multicast group manager specifies the source network using <i>dwSourceAddr</i>, and specifies a subnet mask using <i>dwSourceMask</i>.
     * @param {Integer} dwSourceMask Specifies the subnet mask that corresponds to <i>dwSourceAddr</i>. The <i>dwSourceAddr</i> and <i>dwSourceMask</i> parameters are used together to define a range of sources from which to stop receiving multicast data. 
     * 
     * 
     * 
     * 
     * The multicast group manager specifies zero for this parameter if it also specified zero for <i>dwSourceAddr</i> (a wildcard receiver).
     * @param {Integer} dwGroupAddr Specifies the multicast group for which to stop receiving data. Zero indicates to stop receiving data for all groups (a wildcard receiver); otherwise, the value of <i>dwGroupAddr</i> is the IP address of the group. 
     * 
     * 
     * 
     * 
     * To specify a range of group addresses, the multicast group manager specifies the group address using <i>dwGroupAddr</i>, and specifies a subnet mask using <i>dwGroupMask</i>.
     * @param {Integer} dwGroupMask Specifies the subnet mask that corresponds to <i>dwGroupAddr</i>. The <i>dwGroupAddr</i> and <i>dwGroupMask</i> parameters are used together to define a range of multicast groups. 
     * 
     * 
     * 
     * 
     * The multicast group manager specifies zero for this parameter if it also specified zero for <i>dwGroupAddr</i> (a wildcard receiver).
     * @param {Integer} dwIfIndex Specifies the interface on which to stop receiving multicast data.
     * @param {Integer} dwIfNextHopAddr Specifies the address of the next hop that corresponds to the index specified by <i>dwIfIndex</i>. The <i>dwIfIndex</i> and <i>dwIfNextHopIPAddr</i> parameters uniquely identify a next hop on point-to-multipoint interfaces. A point-to-multipoint interface is a connection where one interface connects to multiple networks. Examples of point-to-multipoint interfaces include non-broadcast multiple access (NBMA) interfaces and the internal interface on which all dial-up clients connect. 
     * 
     * 
     * 
     * 
     * For broadcast interfaces (such as Ethernet interfaces) or point-to-point interfaces, which are identified by only the value of <i>dwIfIndex</i>, specify zero.
     * @returns {Integer} RRAS does not expect the application to return any specific value; any value returned is ignored by RRAS.
     */
    Call(dwSourceAddr, dwSourceMask, dwGroupAddr, dwGroupMask, dwIfIndex, dwIfNextHopAddr) {
        result := DllCall(this.value, UInt32, dwSourceAddr, UInt32, dwSourceMask, UInt32, dwGroupAddr, UInt32, dwGroupMask, UInt32, dwIfIndex, UInt32, dwIfNextHopAddr, UInt32)
        return result
    }

    /**
     * A PMGM_LOCAL_LEAVE_CALLBACK that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PMGM_LOCAL_LEAVE_CALLBACK {
        /**
         * Creates a PMGM_LOCAL_LEAVE_CALLBACK pointer that invokes the given AHK function when called.
         * @param {Func(UInt32, UInt32, UInt32, UInt32, UInt32, UInt32) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 6)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 6 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [UInt32, UInt32, UInt32, UInt32, UInt32, UInt32, UInt32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
