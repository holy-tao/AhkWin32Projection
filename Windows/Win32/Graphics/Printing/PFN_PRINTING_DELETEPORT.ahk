#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * @namespace Windows.Win32.Graphics.Printing
 */
export default struct PFN_PRINTING_DELETEPORT {
    value : IntPtr

    __value {
        set {
            if (value is PFN_PRINTING_DELETEPORT) {
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
     * @param {HWND} param1 
     * @param {PWSTR} param2 
     * @returns {BOOL} 
     */
    Call(param0, param1, param2) {
        param0 := param0 is String ? StrPtr(param0) : param0
        param2 := param2 is String ? StrPtr(param2) : param2

        result := DllCall(this.value, "ptr", param0, HWND, param1, "ptr", param2, BOOL)
        return result
    }

    /**
     * A PFN_PRINTING_DELETEPORT that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFN_PRINTING_DELETEPORT {
        /**
         * Creates a PFN_PRINTING_DELETEPORT pointer that invokes the given AHK function when called.
         * @param {Func(PWSTR, HWND, PWSTR) => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [PWSTR, HWND, PWSTR, BOOL])
        }

        __Delete() => CallbackFree(this.value)
    }
}
