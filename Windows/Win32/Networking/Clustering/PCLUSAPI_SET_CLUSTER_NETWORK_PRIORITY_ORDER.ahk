#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\HCLUSTER.ahk" { HCLUSTER }
#Import ".\HNETWORK.ahk" { HNETWORK }

/**
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct PCLUSAPI_SET_CLUSTER_NETWORK_PRIORITY_ORDER {
    value : IntPtr

    __value {
        set {
            if (value is PCLUSAPI_SET_CLUSTER_NETWORK_PRIORITY_ORDER) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {HCLUSTER} _hCluster 
     * @param {Integer} NetworkCount 
     * @param {Pointer<HNETWORK>} NetworkList 
     * @returns {Integer} 
     */
    Call(_hCluster, NetworkCount, NetworkList) {
        NetworkListMarshal := NetworkList is VarRef ? "ptr*" : "ptr"

        result := DllCall(this.value, HCLUSTER, _hCluster, UInt32, NetworkCount, NetworkListMarshal, NetworkList, UInt32)
        return result
    }

    /**
     * A PCLUSAPI_SET_CLUSTER_NETWORK_PRIORITY_ORDER that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PCLUSAPI_SET_CLUSTER_NETWORK_PRIORITY_ORDER {
        /**
         * Creates a PCLUSAPI_SET_CLUSTER_NETWORK_PRIORITY_ORDER pointer that invokes the given AHK function when called.
         * @param {Func(HCLUSTER, UInt32, HNETWORK) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HCLUSTER, UInt32, HNETWORK.Ptr, UInt32])
        }

        __Delete() => CallbackFree(this.value)
    }
}
