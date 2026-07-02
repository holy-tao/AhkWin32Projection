#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * @namespace Windows.Win32.Graphics.Printing
 */
export default struct PFN_PRINTING_ADDPORT2 {
    value : IntPtr

    __value {
        set {
            if (value is PFN_PRINTING_ADDPORT2) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {HANDLE} param0 
     * @param {PWSTR} param1 
     * @param {HWND} param2 
     * @param {PWSTR} param3 
     * @returns {BOOL} 
     */
    Call(param0, param1, param2, param3) {
        param1 := param1 is String ? StrPtr(param1) : param1
        param3 := param3 is String ? StrPtr(param3) : param3

        result := DllCall(this.value, HANDLE, param0, "ptr", param1, HWND, param2, "ptr", param3, BOOL)
        return result
    }

    /**
     * A PFN_PRINTING_ADDPORT2 that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFN_PRINTING_ADDPORT2 {
        /**
         * Creates a PFN_PRINTING_ADDPORT2 pointer that invokes the given AHK function when called.
         * @param {Func(HANDLE, PWSTR, HWND, PWSTR) => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HANDLE, PWSTR, HWND, PWSTR, BOOL])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
