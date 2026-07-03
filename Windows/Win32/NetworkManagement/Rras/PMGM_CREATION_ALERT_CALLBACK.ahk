#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\MGM_IF_ENTRY.ahk" { MGM_IF_ENTRY }

/**
 * The PMGM_CREATION_ALERT_CALLBACK callback is a call into a routing protocol. This call determines the subset of interfaces owned by the routing protocol on which a multicast packet from a new source should be forwarded.
 * @see https://learn.microsoft.com/windows/win32/api/mgm/nc-mgm-pmgm_creation_alert_callback
 * @namespace Windows.Win32.NetworkManagement.Rras
 */
export default struct PMGM_CREATION_ALERT_CALLBACK {
    value : IntPtr

    __value {
        set {
            if (value is PMGM_CREATION_ALERT_CALLBACK) {
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
     * 
     * 
     * 
     * 
     * To specify a range of source addresses, the multicast group manager specifies the source network using <i>dwSourceAddr</i>, and specifies a subnet mask using <i>dwSourceMask</i>.
     * @param {Integer} dwSourceMask Specifies the subnet mask that corresponds to <i>dwSourceAddr</i>. The <i>dwSourceAddr</i> and <i>dwSourceMask</i> parameters are used together to define a range of sources from which to receive multicast data. 
     * 
     * 
     * 
     * 
     * The multicast group manager specifies zero for this parameter if it also specified zero for <i>dwSourceAddr</i> (a wildcard receiver).
     * @param {Integer} dwGroupAddr Specifies the multicast group for which the data is destined. Zero indicates that all groups are received (a wildcard receiver); otherwise, the value of <i>dwGroupAddr</i> is the IP address of the group. 
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
     * @param {Integer} dwInIfIndex Specifies the interface on which the multicast data from the source should arrive.
     * @param {Integer} dwInIfNextHopAddr Specifies the address of the next hop that corresponds to the index specified by <i>dwIfIndex</i>. The <i>dwIfIndex</i> and <i>dwIfNextHopIPAddr</i> parameters uniquely identify a next hop on point-to-multipoint interfaces. A point-to-multipoint interface is a connection where one interface connects to multiple networks. Examples of point-to-multipoint interfaces include non-broadcast multiple access (NBMA) interfaces and the internal interface on which all dial-up clients connect. 
     * 
     * 
     * 
     * 
     * For broadcast interfaces (such as Ethernet interfaces) or point-to-point interfaces, which are identified by only the value of <i>dwIfIndex</i>, specify zero.
     * @param {Integer} dwIfCount Specifies the number of interfaces in the buffer pointed to by <i>pmieOutIfList</i>.
     * @param {Pointer<MGM_IF_ENTRY>} pmieOutIfList On input, a pointer to a buffer that contains the set of interfaces owned by the protocol on which data will be forwarded. 
     * 
     * 
     * 
     * 
     * On output, the client can set the <b>bIsEnabled</b> member of the corresponding 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mgm/ns-mgm-mgm_if_entry">MGM_IF_ENTRY</a> structure to <b>FALSE</b> to prevent forwarding on any of its interfaces. A client may not be required to prevent forwarding; such a client would accept the default value of <b>bIsEnabled</b>.
     * @returns {Integer} RRAS does not expect the application to return any specific value; any value returned is ignored by RRAS.
     */
    Call(dwSourceAddr, dwSourceMask, dwGroupAddr, dwGroupMask, dwInIfIndex, dwInIfNextHopAddr, dwIfCount, pmieOutIfList) {
        result := DllCall(this.value, UInt32, dwSourceAddr, UInt32, dwSourceMask, UInt32, dwGroupAddr, UInt32, dwGroupMask, UInt32, dwInIfIndex, UInt32, dwInIfNextHopAddr, UInt32, dwIfCount, MGM_IF_ENTRY.Ptr, pmieOutIfList, UInt32)
        return result
    }

    /**
     * A PMGM_CREATION_ALERT_CALLBACK that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PMGM_CREATION_ALERT_CALLBACK {
        /**
         * Creates a PMGM_CREATION_ALERT_CALLBACK pointer that invokes the given AHK function when called.
         * @param {Func(UInt32, UInt32, UInt32, UInt32, UInt32, UInt32, UInt32, MGM_IF_ENTRY) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 8)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 8 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [UInt32, UInt32, UInt32, UInt32, UInt32, UInt32, UInt32, MGM_IF_ENTRY.Ptr, UInt32])
        }

        __Delete() => CallbackFree(this.value)
    }
}
