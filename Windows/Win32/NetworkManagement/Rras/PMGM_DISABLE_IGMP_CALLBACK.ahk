#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The PMGM_DISABLE_IGMP_CALLBACK callback is a call into IGMP to notify it that a routing protocol is taking or releasing ownership of an interface on which IGMP is enabled.
 * @see https://learn.microsoft.com/windows/win32/api/mgm/nc-mgm-pmgm_disable_igmp_callback
 * @namespace Windows.Win32.NetworkManagement.Rras
 */
export default struct PMGM_DISABLE_IGMP_CALLBACK {
    value : IntPtr

    __value {
        set {
            if (value is PMGM_DISABLE_IGMP_CALLBACK) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Integer} dwIfIndex Specifies the interface on which to disable IGMP.
     * @param {Integer} dwIfNextHopAddr Specifies the address of the next hop that corresponds to the index specified by <i>dwIfIndex</i>. The <i>dwIfIndex</i> and <i>dwIfNextHopIPAddr</i> parameters uniquely identify a next hop on point-to-multipoint interfaces. A point-to-multipoint interface is a connection where one interface connects to multiple networks. Examples of point-to-multipoint interfaces include non-broadcast multiple access (NBMA) interfaces and the internal interface on which all dial-up clients connect. 
     * 
     * 
     * 
     * 
     * For broadcast interfaces (such as Ethernet interfaces) or point-to-point interfaces, which are identified by only the value of <i>dwIfIndex</i>, specify zero.
     * @returns {Integer} RRAS does not expect the application to return any specific value; any value returned is ignored by RRAS.
     */
    Call(dwIfIndex, dwIfNextHopAddr) {
        result := DllCall(this.value, UInt32, dwIfIndex, UInt32, dwIfNextHopAddr, UInt32)
        return result
    }

    /**
     * A PMGM_DISABLE_IGMP_CALLBACK that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PMGM_DISABLE_IGMP_CALLBACK {
        /**
         * Creates a PMGM_DISABLE_IGMP_CALLBACK pointer that invokes the given AHK function when called.
         * @param {Func(UInt32, UInt32) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [UInt32, UInt32, UInt32])
        }

        __Delete() => CallbackFree(this.value)
    }
}
