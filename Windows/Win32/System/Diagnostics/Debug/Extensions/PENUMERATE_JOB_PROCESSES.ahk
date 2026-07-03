#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\EXTS_JOB_PROCESS_CALLBACK.ahk" { EXTS_JOB_PROCESS_CALLBACK }
#Import ".\IDebugClient.ahk" { IDebugClient }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
export default struct PENUMERATE_JOB_PROCESSES {
    value : IntPtr

    __value {
        set {
            if (value is PENUMERATE_JOB_PROCESSES) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {IDebugClient} Client 
     * @param {Integer} Job 
     * @param {Pointer<EXTS_JOB_PROCESS_CALLBACK>} Callback 
     * @param {Pointer<Void>} _Context 
     * @returns {HRESULT} 
     */
    Call(Client, Job, Callback, _Context) {
        _ContextMarshal := _Context is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, "ptr", Client, Int64, Job, EXTS_JOB_PROCESS_CALLBACK, Callback, _ContextMarshal, _Context, "HRESULT")
        return result
    }

    /**
     * A PENUMERATE_JOB_PROCESSES that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PENUMERATE_JOB_PROCESSES {
        /**
         * Creates a PENUMERATE_JOB_PROCESSES pointer that invokes the given AHK function when called.
         * @param {Func("ptr", Int64, EXTS_JOB_PROCESS_CALLBACK, "ptr") => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", Int64, EXTS_JOB_PROCESS_CALLBACK, "ptr", "int"])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
