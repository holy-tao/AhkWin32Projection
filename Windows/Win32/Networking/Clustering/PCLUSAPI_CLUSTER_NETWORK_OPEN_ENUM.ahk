#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\HNETWORK.ahk" { HNETWORK }
#Import ".\HNETWORKENUM.ahk" { HNETWORKENUM }

/**
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct PCLUSAPI_CLUSTER_NETWORK_OPEN_ENUM {
    value : IntPtr

    __value {
        set {
            if (value is PCLUSAPI_CLUSTER_NETWORK_OPEN_ENUM) {
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
     * @param {Integer} dwType 
     * @returns {HNETWORKENUM} 
     */
    Call(_hNetwork, dwType) {
        result := DllCall(this.value, HNETWORK, _hNetwork, UInt32, dwType, HNETWORKENUM)
        return result
    }

    /**
     * A PCLUSAPI_CLUSTER_NETWORK_OPEN_ENUM that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PCLUSAPI_CLUSTER_NETWORK_OPEN_ENUM {
        /**
         * Creates a PCLUSAPI_CLUSTER_NETWORK_OPEN_ENUM pointer that invokes the given AHK function when called.
         * @param {Func(HNETWORK, UInt32) => HNETWORKENUM} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HNETWORK, UInt32, HNETWORKENUM])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
