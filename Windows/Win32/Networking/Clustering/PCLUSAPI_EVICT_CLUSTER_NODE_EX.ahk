#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\HNODE.ahk" { HNODE }

/**
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct PCLUSAPI_EVICT_CLUSTER_NODE_EX {
    value : IntPtr

    __value {
        set {
            if (value is PCLUSAPI_EVICT_CLUSTER_NODE_EX) {
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
     * @param {Integer} dwTimeOut 
     * @param {Pointer<HRESULT>} phrCleanupStatus 
     * @returns {Integer} 
     */
    Call(_hNode, dwTimeOut, phrCleanupStatus) {
        phrCleanupStatusMarshal := phrCleanupStatus is VarRef ? "int*" : "ptr"

        result := DllCall(this.value, HNODE, _hNode, UInt32, dwTimeOut, phrCleanupStatusMarshal, phrCleanupStatus, UInt32)
        return result
    }

    /**
     * A PCLUSAPI_EVICT_CLUSTER_NODE_EX that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PCLUSAPI_EVICT_CLUSTER_NODE_EX {
        /**
         * Creates a PCLUSAPI_EVICT_CLUSTER_NODE_EX pointer that invokes the given AHK function when called.
         * @param {Func(HNODE, UInt32, "int*") => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HNODE, UInt32, "int*", UInt32])
        }

        __Delete() => CallbackFree(this.value)
    }
}
