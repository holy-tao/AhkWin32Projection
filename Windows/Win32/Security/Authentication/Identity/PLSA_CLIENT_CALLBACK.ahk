#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\NTSTATUS.ahk" { NTSTATUS }
#Import "..\..\..\Foundation\PSTR.ahk" { PSTR }
#Import ".\SecBuffer.ahk" { SecBuffer }

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct PLSA_CLIENT_CALLBACK {
    value : IntPtr

    __value {
        set {
            if (value is PLSA_CLIENT_CALLBACK) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {PSTR} Callback 
     * @param {Pointer} Argument1 
     * @param {Pointer} Argument2 
     * @param {Pointer<SecBuffer>} _Input 
     * @param {Pointer<SecBuffer>} Output 
     * @returns {NTSTATUS} 
     */
    Call(Callback, Argument1, Argument2, _Input, Output) {
        Callback := Callback is String ? StrPtr(Callback) : Callback

        result := DllCall(this.value, "ptr", Callback, IntPtr, Argument1, IntPtr, Argument2, SecBuffer.Ptr, _Input, SecBuffer.Ptr, Output, NTSTATUS)
        NTSTATUS.ThrowIfError(result.value)
        return result
    }

    /**
     * A PLSA_CLIENT_CALLBACK that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PLSA_CLIENT_CALLBACK {
        /**
         * Creates a PLSA_CLIENT_CALLBACK pointer that invokes the given AHK function when called.
         * @param {Func(PSTR, IntPtr, IntPtr, SecBuffer, SecBuffer) => NTSTATUS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 5)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 5 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [PSTR, IntPtr, IntPtr, SecBuffer.Ptr, SecBuffer.Ptr, NTSTATUS])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
