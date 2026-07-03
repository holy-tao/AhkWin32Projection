#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CLUSTER_NODE_RESUME_FAILBACK_TYPE.ahk" { CLUSTER_NODE_RESUME_FAILBACK_TYPE }
#Import ".\HNODE.ahk" { HNODE }

/**
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct PCLUSAPI_RESUME_CLUSTER_NODE_EX {
    value : IntPtr

    __value {
        set {
            if (value is PCLUSAPI_RESUME_CLUSTER_NODE_EX) {
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
     * @param {CLUSTER_NODE_RESUME_FAILBACK_TYPE} eResumeFailbackType 
     * @param {Integer} dwResumeFlagsReserved 
     * @returns {Integer} 
     */
    Call(_hNode, eResumeFailbackType, dwResumeFlagsReserved) {
        result := DllCall(this.value, HNODE, _hNode, CLUSTER_NODE_RESUME_FAILBACK_TYPE, eResumeFailbackType, UInt32, dwResumeFlagsReserved, UInt32)
        return result
    }

    /**
     * A PCLUSAPI_RESUME_CLUSTER_NODE_EX that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PCLUSAPI_RESUME_CLUSTER_NODE_EX {
        /**
         * Creates a PCLUSAPI_RESUME_CLUSTER_NODE_EX pointer that invokes the given AHK function when called.
         * @param {Func(HNODE, CLUSTER_NODE_RESUME_FAILBACK_TYPE, UInt32) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HNODE, CLUSTER_NODE_RESUME_FAILBACK_TYPE, UInt32, UInt32])
        }

        __Delete() => CallbackFree(this.value)
    }
}
