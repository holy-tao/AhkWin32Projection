#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CLUSTER_NODE_STATE.ahk" { CLUSTER_NODE_STATE }
#Import ".\HNODE.ahk" { HNODE }
#Import ".\HCLUSTER.ahk" { HCLUSTER }

/**
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct LPNODE_CALLBACK {
    value : IntPtr

    __value {
        set {
            if (value is LPNODE_CALLBACK) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {HCLUSTER} param0 
     * @param {HNODE} param1 
     * @param {CLUSTER_NODE_STATE} param2 
     * @param {Pointer<Void>} param3 
     * @returns {Integer} 
     */
    Call(param0, param1, param2, param3) {
        param3Marshal := param3 is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, HCLUSTER, param0, HNODE, param1, CLUSTER_NODE_STATE, param2, param3Marshal, param3, UInt32)
        return result
    }

    /**
     * A LPNODE_CALLBACK that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends LPNODE_CALLBACK {
        /**
         * Creates a LPNODE_CALLBACK pointer that invokes the given AHK function when called.
         * @param {Func(HCLUSTER, HNODE, CLUSTER_NODE_STATE, "ptr") => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HCLUSTER, HNODE, CLUSTER_NODE_STATE, "ptr", UInt32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
