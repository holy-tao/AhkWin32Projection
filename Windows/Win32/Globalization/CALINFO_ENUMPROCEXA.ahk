#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\Foundation\PSTR.ahk" { PSTR }
#Import "..\Foundation\BOOL.ahk" { BOOL }

/**
 * @namespace Windows.Win32.Globalization
 * @charset ANSI
 */
export default struct CALINFO_ENUMPROCEXA {
    value : IntPtr

    __value {
        set {
            if (value is CALINFO_ENUMPROCEXA) {
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
     * @param {Integer} param1 
     * @returns {BOOL} 
     */
    Call(param0, param1) {
        param0 := param0 is String ? StrPtr(param0) : param0

        result := DllCall(this.value, "ptr", param0, UInt32, param1, BOOL)
        return result
    }

    /**
     * A CALINFO_ENUMPROCEXA that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends CALINFO_ENUMPROCEXA {
        /**
         * Creates a CALINFO_ENUMPROCEXA pointer that invokes the given AHK function when called.
         * @param {Func(PSTR, UInt32) => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [PSTR, UInt32, BOOL])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
