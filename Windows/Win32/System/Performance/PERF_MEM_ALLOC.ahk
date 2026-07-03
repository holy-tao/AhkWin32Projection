#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Providers implement this function to provide custom memory management for PERFLIB.A
 * @remarks
 * If you used the <b>-MemoryRoutines</b> when calling <a href="https://docs.microsoft.com/windows/desktop/PerfCtrs/ctrpp">CTRPP</a>, you must implement this callback function. You pass the name of your callback function to <a href="https://docs.microsoft.com/windows/desktop/PerfCtrs/counterinitialize">CounterInitialize</a>.
 * 
 * <b>Windows Vista:  </b>The <a href="https://docs.microsoft.com/windows/desktop/PerfCtrs/counterinitialize">CounterInitialize</a> function is named <b>PerfAutoInitialize</b>.
 * @see https://learn.microsoft.com/windows/win32/api/perflib/nc-perflib-perf_mem_alloc
 * @namespace Windows.Win32.System.Performance
 */
export default struct PERF_MEM_ALLOC {
    value : IntPtr

    __value {
        set {
            if (value is PERF_MEM_ALLOC) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer} AllocSize Number of bytes to allocate.
     * @param {Pointer<Void>} pContext Context information set in the <b>pMemContext</b> member of <a href="https://docs.microsoft.com/windows/win32/api/perflib/ns-perflib-perf_provider_context">PERF_PROVIDER_CONTEXT</a>.
     * @returns {Pointer<Void>} Pointer to the allocated memory or <b>NULL</b> if an error occurred.
     */
    Call(AllocSize, pContext) {
        pContextMarshal := pContext is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, IntPtr, AllocSize, pContextMarshal, pContext, IntPtr)
        return result
    }

    /**
     * A PERF_MEM_ALLOC that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PERF_MEM_ALLOC {
        /**
         * Creates a PERF_MEM_ALLOC pointer that invokes the given AHK function when called.
         * @param {Func(IntPtr, "ptr") => "ptr"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [IntPtr, "ptr", "ptr"])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
