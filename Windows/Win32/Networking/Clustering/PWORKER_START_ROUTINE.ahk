#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CLUS_WORKER.ahk" { CLUS_WORKER }

/**
 * Initializes a worker thread with the specified callback routine. The PWORKER_START_ROUTINE type defines a pointer to this function.
 * @remarks
 * The pointer to this  callback function is used as an input parameter for the <a href="https://docs.microsoft.com/windows/desktop/api/resapi/nf-resapi-clusworkercreate">ClusWorkerCreate</a> function.
 * @see https://learn.microsoft.com/windows/win32/api/resapi/nc-resapi-pworker_start_routine
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct PWORKER_START_ROUTINE {
    value : IntPtr

    __value {
        set {
            if (value is PWORKER_START_ROUTINE) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<CLUS_WORKER>} pWorker A pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/resapi/ns-resapi-clus_worker">CLUS_WORKER</a> structure that represents the worker thread.
     * @param {Pointer<Void>} lpThreadParameter A pointer to the callback routine to use to initialize the worker thread.
     * @returns {Integer} Returns <b>ERROR_SUCCESS</b> (0), if the operation succeeds; otherwise returns a system error code.
     */
    Call(pWorker, lpThreadParameter) {
        lpThreadParameterMarshal := lpThreadParameter is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, CLUS_WORKER.Ptr, pWorker, lpThreadParameterMarshal, lpThreadParameter, UInt32)
        return result
    }

    /**
     * A PWORKER_START_ROUTINE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PWORKER_START_ROUTINE {
        /**
         * Creates a PWORKER_START_ROUTINE pointer that invokes the given AHK function when called.
         * @param {Func(CLUS_WORKER, "ptr") => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [CLUS_WORKER.Ptr, "ptr", UInt32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
