#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CLUSTER_NETINTERFACE_STATE.ahk" { CLUSTER_NETINTERFACE_STATE }
#Import ".\HNETINTERFACE.ahk" { HNETINTERFACE }

/**
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct PCLUSAPI_GET_CLUSTER_NET_INTERFACE_STATE {
    value : IntPtr

    __value {
        set {
            if (value is PCLUSAPI_GET_CLUSTER_NET_INTERFACE_STATE) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {HNETINTERFACE} _hNetInterface 
     * @returns {CLUSTER_NETINTERFACE_STATE} 
     */
    Call(_hNetInterface) {
        result := DllCall(this.value, HNETINTERFACE, _hNetInterface, CLUSTER_NETINTERFACE_STATE)
        return result
    }

    /**
     * A PCLUSAPI_GET_CLUSTER_NET_INTERFACE_STATE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PCLUSAPI_GET_CLUSTER_NET_INTERFACE_STATE {
        /**
         * Creates a PCLUSAPI_GET_CLUSTER_NET_INTERFACE_STATE pointer that invokes the given AHK function when called.
         * @param {Func(HNETINTERFACE) => CLUSTER_NETINTERFACE_STATE} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HNETINTERFACE, CLUSTER_NETINTERFACE_STATE])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
