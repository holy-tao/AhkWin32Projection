#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\Foundation\LPARAM.ahk" { LPARAM }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * @namespace Windows.Win32.System.StationsAndDesktops
 * @charset ANSI
 */
export default struct WINSTAENUMPROCA {
    value : IntPtr

    __value {
        set {
            if (value is WINSTAENUMPROCA) {
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
     * @param {LPARAM} param1 
     * @returns {BOOL} 
     */
    Call(param0, param1) {
        param0 := param0 is String ? StrPtr(param0) : param0

        result := DllCall(this.value, "ptr", param0, LPARAM, param1, BOOL)
        return result
    }

    /**
     * A WINSTAENUMPROCA that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends WINSTAENUMPROCA {
        /**
         * Creates a WINSTAENUMPROCA pointer that invokes the given AHK function when called.
         * @param {Func(PSTR, LPARAM) => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [PSTR, LPARAM, BOOL])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
