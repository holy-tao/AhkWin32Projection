#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\CLUS_WORKER.ahk" { CLUS_WORKER }

/**
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct PCLUSAPIClusWorkerCheckTerminate {
    value : IntPtr

    __value {
        set {
            if (value is PCLUSAPIClusWorkerCheckTerminate) {
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
     * @returns {BOOL} 
     */
    Call(lpWorker) {
        result := DllCall(this.value, CLUS_WORKER.Ptr, lpWorker, BOOL)
        return result
    }

    /**
     * A PCLUSAPIClusWorkerCheckTerminate that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PCLUSAPIClusWorkerCheckTerminate {
        /**
         * Creates a PCLUSAPIClusWorkerCheckTerminate pointer that invokes the given AHK function when called.
         * @param {Func(CLUS_WORKER) => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [CLUS_WORKER.Ptr, BOOL])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
