#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Providers implement this function to provide custom memory management for PERFLIB.F
 * @remarks
 * If you used the <b>-MemoryRoutines</b> when calling <a href="https://docs.microsoft.com/windows/desktop/PerfCtrs/ctrpp">CTRPP</a>, you must implement this callback function. You pass the name of your callback function to <a href="https://docs.microsoft.com/windows/desktop/PerfCtrs/counterinitialize">CounterInitialize</a>.
 * 
 * <b>Windows Vista:  </b>The <a href="https://docs.microsoft.com/windows/desktop/PerfCtrs/counterinitialize">CounterInitialize</a> function is named <b>PerfAutoInitialize</b>.
 * @see https://learn.microsoft.com/windows/win32/api/perflib/nc-perflib-perf_mem_free
 * @namespace Windows.Win32.System.Performance
 */
export default struct PERF_MEM_FREE {
    value : IntPtr

    __value {
        set {
            if (value is PERF_MEM_FREE) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Void>} pBuffer Memory to free.
     * @param {Pointer<Void>} pContext Context information set in the <b>pMemContext</b> member of <a href="https://docs.microsoft.com/windows/win32/api/perflib/ns-perflib-perf_provider_context">PERF_PROVIDER_CONTEXT</a>.
     * @returns {String} Nothing - always returns an empty string
     */
    Call(pBuffer, pContext) {
        pBufferMarshal := pBuffer is VarRef ? "ptr" : "ptr"
        pContextMarshal := pContext is VarRef ? "ptr" : "ptr"

        DllCall(this.value, pBufferMarshal, pBuffer, pContextMarshal, pContext)
    }

    /**
     * A PERF_MEM_FREE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PERF_MEM_FREE {
        /**
         * Creates a PERF_MEM_FREE pointer that invokes the given AHK function when called.
         * @param {Func("ptr", "ptr") => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", "ptr", IntPtr])
        }

        __Delete() => CallbackFree(this.value)
    }
}
