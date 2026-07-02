#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\HNODE.ahk" { HNODE }
#Import ".\HCLUSTER.ahk" { HCLUSTER }

/**
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct PCLUSAPI_GET_CLUSTER_FROM_NODE {
    value : IntPtr

    __value {
        set {
            if (value is PCLUSAPI_GET_CLUSTER_FROM_NODE) {
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
     * @returns {HCLUSTER} 
     */
    Call(_hNode) {
        result := DllCall(this.value, HNODE, _hNode, HCLUSTER)
        return result
    }

    /**
     * A PCLUSAPI_GET_CLUSTER_FROM_NODE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PCLUSAPI_GET_CLUSTER_FROM_NODE {
        /**
         * Creates a PCLUSAPI_GET_CLUSTER_FROM_NODE pointer that invokes the given AHK function when called.
         * @param {Func(HNODE) => HCLUSTER} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HNODE, HCLUSTER])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
