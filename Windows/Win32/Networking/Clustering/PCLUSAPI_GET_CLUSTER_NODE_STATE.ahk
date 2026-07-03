#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CLUSTER_NODE_STATE.ahk" { CLUSTER_NODE_STATE }
#Import ".\HNODE.ahk" { HNODE }

/**
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct PCLUSAPI_GET_CLUSTER_NODE_STATE {
    value : IntPtr

    __value {
        set {
            if (value is PCLUSAPI_GET_CLUSTER_NODE_STATE) {
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
     * @returns {CLUSTER_NODE_STATE} 
     */
    Call(_hNode) {
        result := DllCall(this.value, HNODE, _hNode, CLUSTER_NODE_STATE)
        return result
    }

    /**
     * A PCLUSAPI_GET_CLUSTER_NODE_STATE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PCLUSAPI_GET_CLUSTER_NODE_STATE {
        /**
         * Creates a PCLUSAPI_GET_CLUSTER_NODE_STATE pointer that invokes the given AHK function when called.
         * @param {Func(HNODE) => CLUSTER_NODE_STATE} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HNODE, CLUSTER_NODE_STATE])
        }

        __Delete() => CallbackFree(this.value)
    }
}
