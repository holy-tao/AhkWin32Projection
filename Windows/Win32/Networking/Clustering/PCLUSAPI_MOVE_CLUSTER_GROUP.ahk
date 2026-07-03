#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\HGROUP.ahk" { HGROUP }
#Import ".\HNODE.ahk" { HNODE }

/**
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct PCLUSAPI_MOVE_CLUSTER_GROUP {
    value : IntPtr

    __value {
        set {
            if (value is PCLUSAPI_MOVE_CLUSTER_GROUP) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {HGROUP} _hGroup 
     * @param {HNODE} hDestinationNode 
     * @returns {Integer} 
     */
    Call(_hGroup, hDestinationNode) {
        result := DllCall(this.value, HGROUP, _hGroup, HNODE, hDestinationNode, UInt32)
        return result
    }

    /**
     * A PCLUSAPI_MOVE_CLUSTER_GROUP that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PCLUSAPI_MOVE_CLUSTER_GROUP {
        /**
         * Creates a PCLUSAPI_MOVE_CLUSTER_GROUP pointer that invokes the given AHK function when called.
         * @param {Func(HGROUP, HNODE) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HGROUP, HNODE, UInt32])
        }

        __Delete() => CallbackFree(this.value)
    }
}
