#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct PCLUSAPI_GET_NODE_CLUSTER_STATE {
    value : IntPtr

    __value {
        set {
            if (value is PCLUSAPI_GET_NODE_CLUSTER_STATE) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {PWSTR} lpszNodeName 
     * @param {Pointer<Integer>} pdwClusterState 
     * @returns {Integer} 
     */
    Call(lpszNodeName, pdwClusterState) {
        lpszNodeName := lpszNodeName is String ? StrPtr(lpszNodeName) : lpszNodeName

        pdwClusterStateMarshal := pdwClusterState is VarRef ? "uint*" : "ptr"

        result := DllCall(this.value, "ptr", lpszNodeName, pdwClusterStateMarshal, pdwClusterState, UInt32)
        return result
    }

    /**
     * A PCLUSAPI_GET_NODE_CLUSTER_STATE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PCLUSAPI_GET_NODE_CLUSTER_STATE {
        /**
         * Creates a PCLUSAPI_GET_NODE_CLUSTER_STATE pointer that invokes the given AHK function when called.
         * @param {Func(PWSTR, "uint*") => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [PWSTR, "uint*", UInt32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
