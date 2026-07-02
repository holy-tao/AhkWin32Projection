#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\SecBuffer.ahk" { SecBuffer }
#Import "..\..\..\Foundation\NTSTATUS.ahk" { NTSTATUS }

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct PLSA_MAP_BUFFER {
    value : IntPtr

    __value {
        set {
            if (value is PLSA_MAP_BUFFER) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<SecBuffer>} InputBuffer 
     * @param {Pointer<SecBuffer>} OutputBuffer 
     * @returns {NTSTATUS} 
     */
    Call(InputBuffer, OutputBuffer) {
        result := DllCall(this.value, SecBuffer.Ptr, InputBuffer, SecBuffer.Ptr, OutputBuffer, NTSTATUS)
        NTSTATUS.ThrowIfError(result.value)
        return result
    }

    /**
     * A PLSA_MAP_BUFFER that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PLSA_MAP_BUFFER {
        /**
         * Creates a PLSA_MAP_BUFFER pointer that invokes the given AHK function when called.
         * @param {Func(SecBuffer, SecBuffer) => NTSTATUS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [SecBuffer.Ptr, SecBuffer.Ptr, NTSTATUS])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
