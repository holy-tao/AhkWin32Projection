#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\Foundation\BOOL.ahk" { BOOL }
#Import "..\Foundation\PSTR.ahk" { PSTR }

/**
 * @namespace Windows.Win32.Globalization
 * @charset ANSI
 */
export default struct CALINFO_ENUMPROCA {
    value : IntPtr

    __value {
        set {
            if (value is CALINFO_ENUMPROCA) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {PSTR} param0 
     * @returns {BOOL} 
     */
    Call(param0) {
        param0 := param0 is String ? StrPtr(param0) : param0

        result := DllCall(this.value, "ptr", param0, BOOL)
        return result
    }

    /**
     * A CALINFO_ENUMPROCA that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends CALINFO_ENUMPROCA {
        /**
         * Creates a CALINFO_ENUMPROCA pointer that invokes the given AHK function when called.
         * @param {Func(PSTR) => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [PSTR, BOOL])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
