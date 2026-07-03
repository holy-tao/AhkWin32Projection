#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\HCLUSTER.ahk" { HCLUSTER }
#Import ".\HNODE.ahk" { HNODE }

/**
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct PCLUSAPI_ADD_CLUSTER_NODE {
    value : IntPtr

    __value {
        set {
            if (value is PCLUSAPI_ADD_CLUSTER_NODE) {
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
     * @param {Pointer<PCLUSTER_SETUP_PROGRESS_CALLBACK>} pfnProgressCallback 
     * @param {Pointer<Void>} pvCallbackArg 
     * @returns {HNODE} 
     */
    Call(_hCluster, lpszNodeName, pfnProgressCallback, pvCallbackArg) {
        lpszNodeName := lpszNodeName is String ? StrPtr(lpszNodeName) : lpszNodeName

        pvCallbackArgMarshal := pvCallbackArg is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, HCLUSTER, _hCluster, "ptr", lpszNodeName, "ptr", pfnProgressCallback, pvCallbackArgMarshal, pvCallbackArg, HNODE)
        return result
    }

    /**
     * A PCLUSAPI_ADD_CLUSTER_NODE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PCLUSAPI_ADD_CLUSTER_NODE {
        /**
         * Creates a PCLUSAPI_ADD_CLUSTER_NODE pointer that invokes the given AHK function when called.
         * @param {Func(HCLUSTER, PWSTR, "ptr", "ptr") => HNODE} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HCLUSTER, PWSTR, "ptr", "ptr", HNODE])
        }

        __Delete() => CallbackFree(this.value)
    }
}
