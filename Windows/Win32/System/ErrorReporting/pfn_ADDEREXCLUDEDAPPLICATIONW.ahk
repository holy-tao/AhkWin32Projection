#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\EFaultRepRetVal.ahk" { EFaultRepRetVal }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * @namespace Windows.Win32.System.ErrorReporting
 * @charset Unicode
 */
export default struct pfn_ADDEREXCLUDEDAPPLICATIONW {
    value : IntPtr

    __value {
        set {
            if (value is pfn_ADDEREXCLUDEDAPPLICATIONW) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {PWSTR} param0 
     * @returns {EFaultRepRetVal} 
     */
    Call(param0) {
        param0 := param0 is String ? StrPtr(param0) : param0

        result := DllCall(this.value, "ptr", param0, EFaultRepRetVal)
        return result
    }

    /**
     * A pfn_ADDEREXCLUDEDAPPLICATIONW that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends pfn_ADDEREXCLUDEDAPPLICATIONW {
        /**
         * Creates a pfn_ADDEREXCLUDEDAPPLICATIONW pointer that invokes the given AHK function when called.
         * @param {Func(PWSTR) => EFaultRepRetVal} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [PWSTR, EFaultRepRetVal])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
