#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\HNETWORK.ahk" { HNETWORK }
#Import ".\HCLUSTER.ahk" { HCLUSTER }

/**
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct PCLUSAPI_GET_CLUSTER_FROM_NETWORK {
    value : IntPtr

    __value {
        set {
            if (value is PCLUSAPI_GET_CLUSTER_FROM_NETWORK) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {HNETWORK} _hNetwork 
     * @returns {HCLUSTER} 
     */
    Call(_hNetwork) {
        result := DllCall(this.value, HNETWORK, _hNetwork, HCLUSTER)
        return result
    }

    /**
     * A PCLUSAPI_GET_CLUSTER_FROM_NETWORK that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PCLUSAPI_GET_CLUSTER_FROM_NETWORK {
        /**
         * Creates a PCLUSAPI_GET_CLUSTER_FROM_NETWORK pointer that invokes the given AHK function when called.
         * @param {Func(HNETWORK) => HCLUSTER} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HNETWORK, HCLUSTER])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
