#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\HCLUSTER.ahk" { HCLUSTER }
#Import ".\HNODE.ahk" { HNODE }

/**
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct PCLUSAPI_OPEN_NODE_BY_ID {
    value : IntPtr

    __value {
        set {
            if (value is PCLUSAPI_OPEN_NODE_BY_ID) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {HCLUSTER} _hCluster 
     * @param {Integer} nodeId 
     * @returns {HNODE} 
     */
    Call(_hCluster, nodeId) {
        result := DllCall(this.value, HCLUSTER, _hCluster, UInt32, nodeId, HNODE)
        return result
    }

    /**
     * A PCLUSAPI_OPEN_NODE_BY_ID that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PCLUSAPI_OPEN_NODE_BY_ID {
        /**
         * Creates a PCLUSAPI_OPEN_NODE_BY_ID pointer that invokes the given AHK function when called.
         * @param {Func(HCLUSTER, UInt32) => HNODE} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HCLUSTER, UInt32, HNODE])
        }

        __Delete() => CallbackFree(this.value)
    }
}
