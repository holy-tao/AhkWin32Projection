#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\Foundation\BOOL.ahk" { BOOL }
#Import "..\Foundation\LPARAM.ahk" { LPARAM }
#Import "..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * @namespace Windows.Win32.Globalization
 */
export default struct DATEFMT_ENUMPROCEXEX {
    value : IntPtr

    __value {
        set {
            if (value is DATEFMT_ENUMPROCEXEX) {
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
     * @param {LPARAM} param2 
     * @returns {BOOL} 
     */
    Call(param0, param1, param2) {
        param0 := param0 is String ? StrPtr(param0) : param0

        result := DllCall(this.value, "ptr", param0, UInt32, param1, LPARAM, param2, BOOL)
        return result
    }

    /**
     * A DATEFMT_ENUMPROCEXEX that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends DATEFMT_ENUMPROCEXEX {
        /**
         * Creates a DATEFMT_ENUMPROCEXEX pointer that invokes the given AHK function when called.
         * @param {Func(PWSTR, UInt32, LPARAM) => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [PWSTR, UInt32, LPARAM, BOOL])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
