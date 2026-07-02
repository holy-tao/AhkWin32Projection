#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\NTSTATUS.ahk" { NTSTATUS }
#Import ".\PLSA_CALLBACK_FUNCTION.ahk" { PLSA_CALLBACK_FUNCTION }

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct PLSA_REGISTER_CALLBACK {
    value : IntPtr

    __value {
        set {
            if (value is PLSA_REGISTER_CALLBACK) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Integer} CallbackId 
     * @param {Pointer<PLSA_CALLBACK_FUNCTION>} Callback 
     * @returns {NTSTATUS} 
     */
    Call(CallbackId, Callback) {
        result := DllCall(this.value, UInt32, CallbackId, PLSA_CALLBACK_FUNCTION, Callback, NTSTATUS)
        NTSTATUS.ThrowIfError(result.value)
        return result
    }

    /**
     * A PLSA_REGISTER_CALLBACK that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PLSA_REGISTER_CALLBACK {
        /**
         * Creates a PLSA_REGISTER_CALLBACK pointer that invokes the given AHK function when called.
         * @param {Func(UInt32, PLSA_CALLBACK_FUNCTION) => NTSTATUS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [UInt32, PLSA_CALLBACK_FUNCTION, NTSTATUS])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
