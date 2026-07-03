#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Environment
 */
export default struct VBS_BASIC_ENCLAVE_BASIC_CALL_RETURN_FROM_ENCLAVE {
    value : IntPtr

    __value {
        set {
            if (value is VBS_BASIC_ENCLAVE_BASIC_CALL_RETURN_FROM_ENCLAVE) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer} ReturnValue 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(ReturnValue) {
        DllCall(this.value, IntPtr, ReturnValue)
    }

    /**
     * A VBS_BASIC_ENCLAVE_BASIC_CALL_RETURN_FROM_ENCLAVE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends VBS_BASIC_ENCLAVE_BASIC_CALL_RETURN_FROM_ENCLAVE {
        /**
         * Creates a VBS_BASIC_ENCLAVE_BASIC_CALL_RETURN_FROM_ENCLAVE pointer that invokes the given AHK function when called.
         * @param {Func(IntPtr) => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [IntPtr, IntPtr])
        }

        __Delete() => CallbackFree(this.value)
    }
}
