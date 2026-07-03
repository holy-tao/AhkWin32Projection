#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\HGROUP.ahk" { HGROUP }
#Import ".\HNODE.ahk" { HNODE }

/**
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct PCLUSAPI_SET_CLUSTER_GROUP_NODE_LIST {
    value : IntPtr

    __value {
        set {
            if (value is PCLUSAPI_SET_CLUSTER_GROUP_NODE_LIST) {
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
     * @param {Integer} NodeCount 
     * @param {Pointer<HNODE>} NodeList 
     * @returns {Integer} 
     */
    Call(_hGroup, NodeCount, NodeList) {
        NodeListMarshal := NodeList is VarRef ? "ptr*" : "ptr"

        result := DllCall(this.value, HGROUP, _hGroup, UInt32, NodeCount, NodeListMarshal, NodeList, UInt32)
        return result
    }

    /**
     * A PCLUSAPI_SET_CLUSTER_GROUP_NODE_LIST that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PCLUSAPI_SET_CLUSTER_GROUP_NODE_LIST {
        /**
         * Creates a PCLUSAPI_SET_CLUSTER_GROUP_NODE_LIST pointer that invokes the given AHK function when called.
         * @param {Func(HGROUP, UInt32, HNODE) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HGROUP, UInt32, HNODE.Ptr, UInt32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
