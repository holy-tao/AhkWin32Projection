#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CREATE_CLUSTER_NAME_ACCOUNT.ahk" { CREATE_CLUSTER_NAME_ACCOUNT }
#Import ".\HCLUSTER.ahk" { HCLUSTER }

/**
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct PCLUSAPI_CREATE_CLUSTER_NAME_ACCOUNT {
    value : IntPtr

    __value {
        set {
            if (value is PCLUSAPI_CREATE_CLUSTER_NAME_ACCOUNT) {
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
     * @param {Pointer<CREATE_CLUSTER_NAME_ACCOUNT>} pConfig 
     * @param {Pointer<PCLUSTER_SETUP_PROGRESS_CALLBACK>} pfnProgressCallback 
     * @param {Pointer<Void>} pvCallbackArg 
     * @returns {Integer} 
     */
    Call(_hCluster, pConfig, pfnProgressCallback, pvCallbackArg) {
        pvCallbackArgMarshal := pvCallbackArg is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, HCLUSTER, _hCluster, CREATE_CLUSTER_NAME_ACCOUNT.Ptr, pConfig, "ptr", pfnProgressCallback, pvCallbackArgMarshal, pvCallbackArg, UInt32)
        return result
    }

    /**
     * A PCLUSAPI_CREATE_CLUSTER_NAME_ACCOUNT that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PCLUSAPI_CREATE_CLUSTER_NAME_ACCOUNT {
        /**
         * Creates a PCLUSAPI_CREATE_CLUSTER_NAME_ACCOUNT pointer that invokes the given AHK function when called.
         * @param {Func(HCLUSTER, CREATE_CLUSTER_NAME_ACCOUNT, "ptr", "ptr") => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HCLUSTER, CREATE_CLUSTER_NAME_ACCOUNT.Ptr, "ptr", "ptr", UInt32])
        }

        __Delete() => CallbackFree(this.value)
    }
}
