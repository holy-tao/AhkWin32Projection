#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\HNETWORK.ahk" { HNETWORK }

/**
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct PCLUSAPI_CLOSE_CLUSTER_NETWORK {
    value : IntPtr

    __value {
        set {
            if (value is PCLUSAPI_CLOSE_CLUSTER_NETWORK) {
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
     * @returns {BOOL} 
     */
    Call(_hNetwork) {
        result := DllCall(this.value, HNETWORK, _hNetwork, BOOL)
        return result
    }

    /**
     * A PCLUSAPI_CLOSE_CLUSTER_NETWORK that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PCLUSAPI_CLOSE_CLUSTER_NETWORK {
        /**
         * Creates a PCLUSAPI_CLOSE_CLUSTER_NETWORK pointer that invokes the given AHK function when called.
         * @param {Func(HNETWORK) => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HNETWORK, BOOL])
        }

        __Delete() => CallbackFree(this.value)
    }
}
