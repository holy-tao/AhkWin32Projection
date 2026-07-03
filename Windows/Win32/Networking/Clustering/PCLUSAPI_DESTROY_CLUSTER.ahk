#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\HCLUSTER.ahk" { HCLUSTER }
#Import ".\PCLUSTER_SETUP_PROGRESS_CALLBACK.ahk" { PCLUSTER_SETUP_PROGRESS_CALLBACK }

/**
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct PCLUSAPI_DESTROY_CLUSTER {
    value : IntPtr

    __value {
        set {
            if (value is PCLUSAPI_DESTROY_CLUSTER) {
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
     * @param {Pointer<PCLUSTER_SETUP_PROGRESS_CALLBACK>} pfnProgressCallback 
     * @param {Pointer<Void>} pvCallbackArg 
     * @param {BOOL} fdeleteVirtualComputerObjects 
     * @returns {Integer} 
     */
    Call(_hCluster, pfnProgressCallback, pvCallbackArg, fdeleteVirtualComputerObjects) {
        pvCallbackArgMarshal := pvCallbackArg is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, HCLUSTER, _hCluster, PCLUSTER_SETUP_PROGRESS_CALLBACK, pfnProgressCallback, pvCallbackArgMarshal, pvCallbackArg, BOOL, fdeleteVirtualComputerObjects, UInt32)
        return result
    }

    /**
     * A PCLUSAPI_DESTROY_CLUSTER that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PCLUSAPI_DESTROY_CLUSTER {
        /**
         * Creates a PCLUSAPI_DESTROY_CLUSTER pointer that invokes the given AHK function when called.
         * @param {Func(HCLUSTER, PCLUSTER_SETUP_PROGRESS_CALLBACK, "ptr", BOOL) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HCLUSTER, PCLUSTER_SETUP_PROGRESS_CALLBACK, "ptr", BOOL, UInt32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
