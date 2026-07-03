#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\Foundation\BOOL.ahk" { BOOL }
#Import "..\Foundation\LPARAM.ahk" { LPARAM }
#Import "..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * @namespace Windows.Win32.Globalization
 */
export default struct CALINFO_ENUMPROCEXEX {
    value : IntPtr

    __value {
        set {
            if (value is CALINFO_ENUMPROCEXEX) {
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
     * @param {Integer} param1 
     * @param {PWSTR} param2 
     * @param {LPARAM} param3 
     * @returns {BOOL} 
     */
    Call(param0, param1, param2, param3) {
        param0 := param0 is String ? StrPtr(param0) : param0
        param2 := param2 is String ? StrPtr(param2) : param2

        result := DllCall(this.value, "ptr", param0, UInt32, param1, "ptr", param2, LPARAM, param3, BOOL)
        return result
    }

    /**
     * A CALINFO_ENUMPROCEXEX that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends CALINFO_ENUMPROCEXEX {
        /**
         * Creates a CALINFO_ENUMPROCEXEX pointer that invokes the given AHK function when called.
         * @param {Func(PWSTR, UInt32, PWSTR, LPARAM) => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [PWSTR, UInt32, PWSTR, LPARAM, BOOL])
        }

        __Delete() => CallbackFree(this.value)
    }
}
