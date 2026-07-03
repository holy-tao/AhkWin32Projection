#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
export default struct EXTS_JOB_PROCESS_CALLBACK {
    value : IntPtr

    __value {
        set {
            if (value is EXTS_JOB_PROCESS_CALLBACK) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Integer} Job 
     * @param {Integer} Process 
     * @param {Pointer<Void>} _Context 
     * @returns {BOOLEAN} 
     */
    Call(Job, Process, _Context) {
        _ContextMarshal := _Context is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, Int64, Job, Int64, Process, _ContextMarshal, _Context, BOOLEAN)
        return result
    }

    /**
     * A EXTS_JOB_PROCESS_CALLBACK that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends EXTS_JOB_PROCESS_CALLBACK {
        /**
         * Creates a EXTS_JOB_PROCESS_CALLBACK pointer that invokes the given AHK function when called.
         * @param {Func(Int64, Int64, "ptr") => BOOLEAN} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [Int64, Int64, "ptr", BOOLEAN])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
