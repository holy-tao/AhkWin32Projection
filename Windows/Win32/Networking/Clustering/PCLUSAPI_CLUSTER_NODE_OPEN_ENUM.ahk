#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\HNODEENUM.ahk" { HNODEENUM }
#Import ".\HNODE.ahk" { HNODE }

/**
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct PCLUSAPI_CLUSTER_NODE_OPEN_ENUM {
    value : IntPtr

    __value {
        set {
            if (value is PCLUSAPI_CLUSTER_NODE_OPEN_ENUM) {
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
     * @param {Integer} dwType 
     * @returns {HNODEENUM} 
     */
    Call(_hNode, dwType) {
        result := DllCall(this.value, HNODE, _hNode, UInt32, dwType, HNODEENUM)
        return result
    }

    /**
     * A PCLUSAPI_CLUSTER_NODE_OPEN_ENUM that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PCLUSAPI_CLUSTER_NODE_OPEN_ENUM {
        /**
         * Creates a PCLUSAPI_CLUSTER_NODE_OPEN_ENUM pointer that invokes the given AHK function when called.
         * @param {Func(HNODE, UInt32) => HNODEENUM} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HNODE, UInt32, HNODEENUM])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
