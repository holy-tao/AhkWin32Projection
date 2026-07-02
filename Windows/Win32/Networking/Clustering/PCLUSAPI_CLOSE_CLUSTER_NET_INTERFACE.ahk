#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\HNETINTERFACE.ahk" { HNETINTERFACE }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct PCLUSAPI_CLOSE_CLUSTER_NET_INTERFACE {
    value : IntPtr

    __value {
        set {
            if (value is PCLUSAPI_CLOSE_CLUSTER_NET_INTERFACE) {
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
     * @returns {BOOL} 
     */
    Call(_hNetInterface) {
        result := DllCall(this.value, HNETINTERFACE, _hNetInterface, BOOL)
        return result
    }

    /**
     * A PCLUSAPI_CLOSE_CLUSTER_NET_INTERFACE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PCLUSAPI_CLOSE_CLUSTER_NET_INTERFACE {
        /**
         * Creates a PCLUSAPI_CLOSE_CLUSTER_NET_INTERFACE pointer that invokes the given AHK function when called.
         * @param {Func(HNETINTERFACE) => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HNETINTERFACE, BOOL])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
