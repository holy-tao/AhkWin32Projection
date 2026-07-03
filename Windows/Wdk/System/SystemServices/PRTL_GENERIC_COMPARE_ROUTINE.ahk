#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\RTL_GENERIC_COMPARE_RESULTS.ahk" { RTL_GENERIC_COMPARE_RESULTS }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct PRTL_GENERIC_COMPARE_ROUTINE {
    value : IntPtr

    __value {
        set {
            if (value is PRTL_GENERIC_COMPARE_ROUTINE) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @returns {RTL_GENERIC_COMPARE_RESULTS} 
     */
    Call() {
        result := DllCall(this.value, RTL_GENERIC_COMPARE_RESULTS)
        return result
    }

    /**
     * A PRTL_GENERIC_COMPARE_ROUTINE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PRTL_GENERIC_COMPARE_ROUTINE {
        /**
         * Creates a PRTL_GENERIC_COMPARE_ROUTINE pointer that invokes the given AHK function when called.
         * @param {Func() => RTL_GENERIC_COMPARE_RESULTS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 0)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 0 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [RTL_GENERIC_COMPARE_RESULTS])
        }

        __Delete() => CallbackFree(this.value)
    }
}
