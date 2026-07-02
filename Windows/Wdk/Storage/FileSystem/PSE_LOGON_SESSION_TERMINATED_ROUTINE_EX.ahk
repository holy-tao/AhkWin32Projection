#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\Foundation\NTSTATUS.ahk" { NTSTATUS }

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 */
export default struct PSE_LOGON_SESSION_TERMINATED_ROUTINE_EX {
    value : IntPtr

    __value {
        set {
            if (value is PSE_LOGON_SESSION_TERMINATED_ROUTINE_EX) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @returns {NTSTATUS} 
     */
    Call() {
        result := DllCall(this.value, NTSTATUS)
        NTSTATUS.ThrowIfError(result.value)
        return result
    }

    /**
     * A PSE_LOGON_SESSION_TERMINATED_ROUTINE_EX that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PSE_LOGON_SESSION_TERMINATED_ROUTINE_EX {
        /**
         * Creates a PSE_LOGON_SESSION_TERMINATED_ROUTINE_EX pointer that invokes the given AHK function when called.
         * @param {Func() => NTSTATUS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 0)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 0 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [NTSTATUS])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
