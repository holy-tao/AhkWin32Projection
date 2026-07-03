#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\ENCLAVE_VBS_BASIC_KEY_REQUEST.ahk" { ENCLAVE_VBS_BASIC_KEY_REQUEST }

/**
 * @namespace Windows.Win32.System.Environment
 */
export default struct VBS_BASIC_ENCLAVE_BASIC_CALL_GENERATE_KEY {
    value : IntPtr

    __value {
        set {
            if (value is VBS_BASIC_ENCLAVE_BASIC_CALL_GENERATE_KEY) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<ENCLAVE_VBS_BASIC_KEY_REQUEST>} KeyRequest 
     * @param {Integer} RequestedKeySize 
     * @param {Pointer<Integer>} ReturnedKey 
     * @returns {Integer} 
     */
    Call(KeyRequest, RequestedKeySize, ReturnedKey) {
        ReturnedKeyMarshal := ReturnedKey is VarRef ? "char*" : "ptr"

        result := DllCall(this.value, ENCLAVE_VBS_BASIC_KEY_REQUEST.Ptr, KeyRequest, UInt32, RequestedKeySize, ReturnedKeyMarshal, ReturnedKey, Int32)
        return result
    }

    /**
     * A VBS_BASIC_ENCLAVE_BASIC_CALL_GENERATE_KEY that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends VBS_BASIC_ENCLAVE_BASIC_CALL_GENERATE_KEY {
        /**
         * Creates a VBS_BASIC_ENCLAVE_BASIC_CALL_GENERATE_KEY pointer that invokes the given AHK function when called.
         * @param {Func(ENCLAVE_VBS_BASIC_KEY_REQUEST, UInt32, "char*") => Int32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [ENCLAVE_VBS_BASIC_KEY_REQUEST.Ptr, UInt32, "char*", Int32])
        }

        __Delete() => CallbackFree(this.value)
    }
}
