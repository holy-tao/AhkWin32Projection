#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\HCLUSTER.ahk" { HCLUSTER }
#Import ".\HNETINTERFACE.ahk" { HNETINTERFACE }

/**
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct PCLUSAPI_GET_CLUSTER_FROM_NET_INTERFACE {
    value : IntPtr

    __value {
        set {
            if (value is PCLUSAPI_GET_CLUSTER_FROM_NET_INTERFACE) {
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
     * @returns {HCLUSTER} 
     */
    Call(_hNetInterface) {
        result := DllCall(this.value, HNETINTERFACE, _hNetInterface, HCLUSTER)
        return result
    }

    /**
     * A PCLUSAPI_GET_CLUSTER_FROM_NET_INTERFACE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PCLUSAPI_GET_CLUSTER_FROM_NET_INTERFACE {
        /**
         * Creates a PCLUSAPI_GET_CLUSTER_FROM_NET_INTERFACE pointer that invokes the given AHK function when called.
         * @param {Func(HNETINTERFACE) => HCLUSTER} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HNETINTERFACE, HCLUSTER])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
