#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CLUS_WORKER.ahk" { CLUS_WORKER }

/**
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct PCLUSAPI_CLUS_WORKER_CREATE {
    value : IntPtr

    __value {
        set {
            if (value is PCLUSAPI_CLUS_WORKER_CREATE) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<CLUS_WORKER>} lpWorker 
     * @param {Pointer<PWORKER_START_ROUTINE>} lpStartAddress 
     * @param {Pointer<Void>} lpParameter 
     * @returns {Integer} 
     */
    Call(lpWorker, lpStartAddress, lpParameter) {
        lpParameterMarshal := lpParameter is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, CLUS_WORKER.Ptr, lpWorker, "ptr", lpStartAddress, lpParameterMarshal, lpParameter, UInt32)
        return result
    }

    /**
     * A PCLUSAPI_CLUS_WORKER_CREATE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PCLUSAPI_CLUS_WORKER_CREATE {
        /**
         * Creates a PCLUSAPI_CLUS_WORKER_CREATE pointer that invokes the given AHK function when called.
         * @param {Func(CLUS_WORKER, "ptr", "ptr") => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [CLUS_WORKER.Ptr, "ptr", "ptr", UInt32])
        }

        __Delete() => CallbackFree(this.value)
    }
}
