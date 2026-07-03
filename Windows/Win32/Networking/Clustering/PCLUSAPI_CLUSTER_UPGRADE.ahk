#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\HCLUSTER.ahk" { HCLUSTER }

/**
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct PCLUSAPI_CLUSTER_UPGRADE {
    value : IntPtr

    __value {
        set {
            if (value is PCLUSAPI_CLUSTER_UPGRADE) {
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
     * @param {BOOL} perform 
     * @param {Pointer<PCLUSTER_UPGRADE_PROGRESS_CALLBACK>} pfnProgressCallback 
     * @param {Pointer<Void>} pvCallbackArg 
     * @returns {Integer} 
     */
    Call(_hCluster, perform, pfnProgressCallback, pvCallbackArg) {
        pvCallbackArgMarshal := pvCallbackArg is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, HCLUSTER, _hCluster, BOOL, perform, "ptr", pfnProgressCallback, pvCallbackArgMarshal, pvCallbackArg, UInt32)
        return result
    }

    /**
     * A PCLUSAPI_CLUSTER_UPGRADE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PCLUSAPI_CLUSTER_UPGRADE {
        /**
         * Creates a PCLUSAPI_CLUSTER_UPGRADE pointer that invokes the given AHK function when called.
         * @param {Func(HCLUSTER, BOOL, "ptr", "ptr") => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HCLUSTER, BOOL, "ptr", "ptr", UInt32])
        }

        __Delete() => CallbackFree(this.value)
    }
}
