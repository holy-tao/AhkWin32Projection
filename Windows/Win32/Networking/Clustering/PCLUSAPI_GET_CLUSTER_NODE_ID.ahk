#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\HNODE.ahk" { HNODE }

/**
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct PCLUSAPI_GET_CLUSTER_NODE_ID {
    value : IntPtr

    __value {
        set {
            if (value is PCLUSAPI_GET_CLUSTER_NODE_ID) {
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
     * @param {PWSTR} lpszNodeId 
     * @param {Pointer<Integer>} lpcchName 
     * @returns {Integer} 
     */
    Call(_hNode, lpszNodeId, lpcchName) {
        lpszNodeId := lpszNodeId is String ? StrPtr(lpszNodeId) : lpszNodeId

        lpcchNameMarshal := lpcchName is VarRef ? "uint*" : "ptr"

        result := DllCall(this.value, HNODE, _hNode, "ptr", lpszNodeId, lpcchNameMarshal, lpcchName, UInt32)
        return result
    }

    /**
     * A PCLUSAPI_GET_CLUSTER_NODE_ID that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PCLUSAPI_GET_CLUSTER_NODE_ID {
        /**
         * Creates a PCLUSAPI_GET_CLUSTER_NODE_ID pointer that invokes the given AHK function when called.
         * @param {Func(HNODE, PWSTR, "uint*") => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HNODE, PWSTR, "uint*", UInt32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
