#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CLUSTER_NETWORK_STATE.ahk" { CLUSTER_NETWORK_STATE }
#Import ".\HNETWORK.ahk" { HNETWORK }

/**
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct PCLUSAPI_GET_CLUSTER_NETWORK_STATE {
    value : IntPtr

    __value {
        set {
            if (value is PCLUSAPI_GET_CLUSTER_NETWORK_STATE) {
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
     * @returns {CLUSTER_NETWORK_STATE} 
     */
    Call(_hNetwork) {
        result := DllCall(this.value, HNETWORK, _hNetwork, CLUSTER_NETWORK_STATE)
        return result
    }

    /**
     * A PCLUSAPI_GET_CLUSTER_NETWORK_STATE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PCLUSAPI_GET_CLUSTER_NETWORK_STATE {
        /**
         * Creates a PCLUSAPI_GET_CLUSTER_NETWORK_STATE pointer that invokes the given AHK function when called.
         * @param {Func(HNETWORK) => CLUSTER_NETWORK_STATE} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HNETWORK, CLUSTER_NETWORK_STATE])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
