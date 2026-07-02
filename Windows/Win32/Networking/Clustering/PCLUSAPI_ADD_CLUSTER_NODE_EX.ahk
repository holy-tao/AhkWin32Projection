#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\PCLUSTER_SETUP_PROGRESS_CALLBACK.ahk" { PCLUSTER_SETUP_PROGRESS_CALLBACK }
#Import ".\HNODE.ahk" { HNODE }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\HCLUSTER.ahk" { HCLUSTER }

/**
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct PCLUSAPI_ADD_CLUSTER_NODE_EX {
    value : IntPtr

    __value {
        set {
            if (value is PCLUSAPI_ADD_CLUSTER_NODE_EX) {
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
     * @param {PWSTR} lpszNodeName 
     * @param {Integer} dwFlags 
     * @param {Pointer<PCLUSTER_SETUP_PROGRESS_CALLBACK>} pfnProgressCallback 
     * @param {Pointer<Void>} pvCallbackArg 
     * @returns {HNODE} 
     */
    Call(_hCluster, lpszNodeName, dwFlags, pfnProgressCallback, pvCallbackArg) {
        lpszNodeName := lpszNodeName is String ? StrPtr(lpszNodeName) : lpszNodeName

        pvCallbackArgMarshal := pvCallbackArg is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, HCLUSTER, _hCluster, "ptr", lpszNodeName, UInt32, dwFlags, PCLUSTER_SETUP_PROGRESS_CALLBACK, pfnProgressCallback, pvCallbackArgMarshal, pvCallbackArg, HNODE)
        return result
    }

    /**
     * A PCLUSAPI_ADD_CLUSTER_NODE_EX that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PCLUSAPI_ADD_CLUSTER_NODE_EX {
        /**
         * Creates a PCLUSAPI_ADD_CLUSTER_NODE_EX pointer that invokes the given AHK function when called.
         * @param {Func(HCLUSTER, PWSTR, UInt32, PCLUSTER_SETUP_PROGRESS_CALLBACK, "ptr") => HNODE} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 5)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 5 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HCLUSTER, PWSTR, UInt32, PCLUSTER_SETUP_PROGRESS_CALLBACK, "ptr", HNODE])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
