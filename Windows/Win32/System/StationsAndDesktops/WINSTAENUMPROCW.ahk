#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\Foundation\LPARAM.ahk" { LPARAM }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * @namespace Windows.Win32.System.StationsAndDesktops
 * @charset Unicode
 */
export default struct WINSTAENUMPROCW {
    value : IntPtr

    __value {
        set {
            if (value is WINSTAENUMPROCW) {
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
     * @param {LPARAM} param1 
     * @returns {BOOL} 
     */
    Call(param0, param1) {
        param0 := param0 is String ? StrPtr(param0) : param0

        result := DllCall(this.value, "ptr", param0, LPARAM, param1, BOOL)
        return result
    }

    /**
     * A WINSTAENUMPROCW that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends WINSTAENUMPROCW {
        /**
         * Creates a WINSTAENUMPROCW pointer that invokes the given AHK function when called.
         * @param {Func(PWSTR, LPARAM) => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [PWSTR, LPARAM, BOOL])
        }

        __Delete() => CallbackFree(this.value)
    }
}
