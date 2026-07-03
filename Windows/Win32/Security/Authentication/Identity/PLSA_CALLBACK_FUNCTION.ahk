#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\NTSTATUS.ahk" { NTSTATUS }
#Import ".\SecBuffer.ahk" { SecBuffer }

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct PLSA_CALLBACK_FUNCTION {
    value : IntPtr

    __value {
        set {
            if (value is PLSA_CALLBACK_FUNCTION) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer} Argument1 
     * @param {Pointer} Argument2 
     * @param {Pointer<SecBuffer>} InputBuffer 
     * @param {Pointer<SecBuffer>} OutputBuffer 
     * @returns {NTSTATUS} 
     */
    Call(Argument1, Argument2, InputBuffer, OutputBuffer) {
        result := DllCall(this.value, IntPtr, Argument1, IntPtr, Argument2, SecBuffer.Ptr, InputBuffer, SecBuffer.Ptr, OutputBuffer, NTSTATUS)
        NTSTATUS.ThrowIfError(result.value)
        return result
    }

    /**
     * A PLSA_CALLBACK_FUNCTION that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PLSA_CALLBACK_FUNCTION {
        /**
         * Creates a PLSA_CALLBACK_FUNCTION pointer that invokes the given AHK function when called.
         * @param {Func(IntPtr, IntPtr, SecBuffer, SecBuffer) => NTSTATUS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [IntPtr, IntPtr, SecBuffer.Ptr, SecBuffer.Ptr, NTSTATUS])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
