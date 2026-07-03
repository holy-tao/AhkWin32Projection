#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\HNETWORK.ahk" { HNETWORK }
#Import "..\..\System\Registry\HKEY.ahk" { HKEY }

/**
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct PCLUSAPI_GET_CLUSTER_NETWORK_KEY {
    value : IntPtr

    __value {
        set {
            if (value is PCLUSAPI_GET_CLUSTER_NETWORK_KEY) {
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
     * @param {Integer} samDesired 
     * @returns {HKEY} 
     */
    Call(_hNetwork, samDesired) {
        result := DllCall(this.value, HNETWORK, _hNetwork, UInt32, samDesired, HKEY.Owned)
        return result
    }

    /**
     * A PCLUSAPI_GET_CLUSTER_NETWORK_KEY that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PCLUSAPI_GET_CLUSTER_NETWORK_KEY {
        /**
         * Creates a PCLUSAPI_GET_CLUSTER_NETWORK_KEY pointer that invokes the given AHK function when called.
         * @param {Func(HNETWORK, UInt32) => HKEY} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HNETWORK, UInt32, HKEY])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
