#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\HNODE.ahk" { HNODE }

/**
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct PCLUSAPI_CLOSE_CLUSTER_NODE {
    value : IntPtr

    __value {
        set {
            if (value is PCLUSAPI_CLOSE_CLUSTER_NODE) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {HNODE} _hNode 
     * @returns {BOOL} 
     */
    Call(_hNode) {
        result := DllCall(this.value, HNODE, _hNode, BOOL)
        return result
    }

    /**
     * A PCLUSAPI_CLOSE_CLUSTER_NODE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PCLUSAPI_CLOSE_CLUSTER_NODE {
        /**
         * Creates a PCLUSAPI_CLOSE_CLUSTER_NODE pointer that invokes the given AHK function when called.
         * @param {Func(HNODE) => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HNODE, BOOL])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
