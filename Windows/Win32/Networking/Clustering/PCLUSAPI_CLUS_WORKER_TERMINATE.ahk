#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CLUS_WORKER.ahk" { CLUS_WORKER }

/**
 * Terminates a worker thread. The PCLUSAPI_CLUS_WORKER_TERMINATE type defines a pointer to this function.
 * @remarks
 * The <i>ClusWorkerTerminate</i> utility function checks 
 *      the <b>hThread</b> and <b>Terminate</b> members of the 
 *      <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/resapi/ns-resapi-clus_worker">CLUS_WORKER</a> structure pointed to by 
 *      <i>lpWorker</i>. If <b>hThread</b> is not <b>NULL</b> 
 *      and <b>Terminate</b> is set to <b>FALSE</b>, indicating that this is your 
 *      first call to <i>ClusWorkerTerminate</i>, the function 
 *      waits for the thread to exit before returning. Otherwise, if you have called 
 *      <i>ClusWorkerTerminate</i> previously, indicated by 
 *      <b>Terminate</b> being set to <b>TRUE</b>, the function may return before 
 *      the thread has terminated.
 * @see https://learn.microsoft.com/windows/win32/api/resapi/nc-resapi-pclusapi_clus_worker_terminate
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct PCLUSAPI_CLUS_WORKER_TERMINATE {
    value : IntPtr

    __value {
        set {
            if (value is PCLUSAPI_CLUS_WORKER_TERMINATE) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<CLUS_WORKER>} lpWorker Pointer to a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/resapi/ns-resapi-clus_worker">CLUS_WORKER</a> structure describing the 
     *        thread to terminate.
     * @returns {String} Nothing - always returns an empty string
     */
    Call(lpWorker) {
        DllCall(this.value, CLUS_WORKER.Ptr, lpWorker)
    }

    /**
     * A PCLUSAPI_CLUS_WORKER_TERMINATE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PCLUSAPI_CLUS_WORKER_TERMINATE {
        /**
         * Creates a PCLUSAPI_CLUS_WORKER_TERMINATE pointer that invokes the given AHK function when called.
         * @param {Func(CLUS_WORKER) => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [CLUS_WORKER.Ptr, IntPtr])
        }

        __Delete() => CallbackFree(this.value)
    }
}
