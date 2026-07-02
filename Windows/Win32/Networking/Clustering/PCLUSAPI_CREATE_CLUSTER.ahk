#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\PCLUSTER_SETUP_PROGRESS_CALLBACK.ahk" { PCLUSTER_SETUP_PROGRESS_CALLBACK }
#Import ".\CREATE_CLUSTER_CONFIG.ahk" { CREATE_CLUSTER_CONFIG }
#Import ".\HCLUSTER.ahk" { HCLUSTER }

/**
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct PCLUSAPI_CREATE_CLUSTER {
    value : IntPtr

    __value {
        set {
            if (value is PCLUSAPI_CREATE_CLUSTER) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<CREATE_CLUSTER_CONFIG>} pConfig 
     * @param {Pointer<PCLUSTER_SETUP_PROGRESS_CALLBACK>} pfnProgressCallback 
     * @param {Pointer<Void>} pvCallbackArg 
     * @returns {HCLUSTER} 
     */
    Call(pConfig, pfnProgressCallback, pvCallbackArg) {
        pvCallbackArgMarshal := pvCallbackArg is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, CREATE_CLUSTER_CONFIG.Ptr, pConfig, PCLUSTER_SETUP_PROGRESS_CALLBACK, pfnProgressCallback, pvCallbackArgMarshal, pvCallbackArg, HCLUSTER)
        return result
    }

    /**
     * A PCLUSAPI_CREATE_CLUSTER that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PCLUSAPI_CREATE_CLUSTER {
        /**
         * Creates a PCLUSAPI_CREATE_CLUSTER pointer that invokes the given AHK function when called.
         * @param {Func(CREATE_CLUSTER_CONFIG, PCLUSTER_SETUP_PROGRESS_CALLBACK, "ptr") => HCLUSTER} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [CREATE_CLUSTER_CONFIG.Ptr, PCLUSTER_SETUP_PROGRESS_CALLBACK, "ptr", HCLUSTER])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
