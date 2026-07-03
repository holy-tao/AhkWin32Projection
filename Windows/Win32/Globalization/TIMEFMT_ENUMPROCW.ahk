#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\Foundation\BOOL.ahk" { BOOL }
#Import "..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * @namespace Windows.Win32.Globalization
 * @charset Unicode
 */
export default struct TIMEFMT_ENUMPROCW {
    value : IntPtr

    __value {
        set {
            if (value is TIMEFMT_ENUMPROCW) {
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
     * @returns {BOOL} 
     */
    Call(param0) {
        param0 := param0 is String ? StrPtr(param0) : param0

        result := DllCall(this.value, "ptr", param0, BOOL)
        return result
    }

    /**
     * A TIMEFMT_ENUMPROCW that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends TIMEFMT_ENUMPROCW {
        /**
         * Creates a TIMEFMT_ENUMPROCW pointer that invokes the given AHK function when called.
         * @param {Func(PWSTR) => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [PWSTR, BOOL])
        }

        __Delete() => CallbackFree(this.value)
    }
}
