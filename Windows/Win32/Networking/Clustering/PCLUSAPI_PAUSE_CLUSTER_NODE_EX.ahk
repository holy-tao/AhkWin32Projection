#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\HNODE.ahk" { HNODE }

/**
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct PCLUSAPI_PAUSE_CLUSTER_NODE_EX {
    value : IntPtr

    __value {
        set {
            if (value is PCLUSAPI_PAUSE_CLUSTER_NODE_EX) {
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
     * @param {BOOL} bDrainNode 
     * @param {Integer} dwPauseFlags 
     * @param {HNODE} hNodeDrainTarget 
     * @returns {Integer} 
     */
    Call(_hNode, bDrainNode, dwPauseFlags, hNodeDrainTarget) {
        result := DllCall(this.value, HNODE, _hNode, BOOL, bDrainNode, UInt32, dwPauseFlags, HNODE, hNodeDrainTarget, UInt32)
        return result
    }

    /**
     * A PCLUSAPI_PAUSE_CLUSTER_NODE_EX that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PCLUSAPI_PAUSE_CLUSTER_NODE_EX {
        /**
         * Creates a PCLUSAPI_PAUSE_CLUSTER_NODE_EX pointer that invokes the given AHK function when called.
         * @param {Func(HNODE, BOOL, UInt32, HNODE) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HNODE, BOOL, UInt32, HNODE, UInt32])
        }

        __Delete() => CallbackFree(this.value)
    }
}
