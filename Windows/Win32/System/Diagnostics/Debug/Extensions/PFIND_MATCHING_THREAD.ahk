#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\KDEXT_THREAD_FIND_PARAMS.ahk" { KDEXT_THREAD_FIND_PARAMS }
#Import "..\..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IDebugClient.ahk" { IDebugClient }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
export default struct PFIND_MATCHING_THREAD {
    value : IntPtr

    __value {
        set {
            if (value is PFIND_MATCHING_THREAD) {
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
     * @param {Pointer<KDEXT_THREAD_FIND_PARAMS>} ThreadInfo 
     * @returns {HRESULT} 
     */
    Call(Client, ThreadInfo) {
        result := DllCall(this.value, "ptr", Client, KDEXT_THREAD_FIND_PARAMS.Ptr, ThreadInfo, "HRESULT")
        return result
    }

    /**
     * A PFIND_MATCHING_THREAD that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFIND_MATCHING_THREAD {
        /**
         * Creates a PFIND_MATCHING_THREAD pointer that invokes the given AHK function when called.
         * @param {Func("ptr", KDEXT_THREAD_FIND_PARAMS) => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", KDEXT_THREAD_FIND_PARAMS.Ptr, "int"])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
