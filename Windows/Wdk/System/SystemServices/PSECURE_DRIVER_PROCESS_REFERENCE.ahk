#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PEPROCESS.ahk" { PEPROCESS }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct PSECURE_DRIVER_PROCESS_REFERENCE {
    value : IntPtr

    __value {
        set {
            if (value is PSECURE_DRIVER_PROCESS_REFERENCE) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @returns {PEPROCESS} 
     */
    Call() {
        result := DllCall(this.value, PEPROCESS)
        return result
    }

    /**
     * A PSECURE_DRIVER_PROCESS_REFERENCE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PSECURE_DRIVER_PROCESS_REFERENCE {
        /**
         * Creates a PSECURE_DRIVER_PROCESS_REFERENCE pointer that invokes the given AHK function when called.
         * @param {Func() => PEPROCESS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 0)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 0 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [PEPROCESS])
        }

        __Delete() => CallbackFree(this.value)
    }
}
