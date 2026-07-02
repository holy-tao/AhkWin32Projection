#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Environment
 */
export default struct VBS_BASIC_ENCLAVE_BASIC_CALL_VERIFY_REPORT {
    value : IntPtr

    __value {
        set {
            if (value is VBS_BASIC_ENCLAVE_BASIC_CALL_VERIFY_REPORT) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Integer} Report 
     * @param {Integer} ReportSize 
     * @returns {Integer} 
     */
    Call(Report, ReportSize) {
        result := DllCall(this.value, IntPtr, Report, UInt32, ReportSize, Int32)
        return result
    }

    /**
     * A VBS_BASIC_ENCLAVE_BASIC_CALL_VERIFY_REPORT that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends VBS_BASIC_ENCLAVE_BASIC_CALL_VERIFY_REPORT {
        /**
         * Creates a VBS_BASIC_ENCLAVE_BASIC_CALL_VERIFY_REPORT pointer that invokes the given AHK function when called.
         * @param {Func(IntPtr, UInt32) => Int32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [IntPtr, UInt32, Int32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
