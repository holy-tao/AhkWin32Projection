#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\MONITOR2.ahk" { MONITOR2 }

/**
 * @namespace Windows.Win32.Graphics.Printing
 */
export default struct PFN_PRINTING_OPENPORTEX2 {
    value : IntPtr

    __value {
        set {
            if (value is PFN_PRINTING_OPENPORTEX2) {
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
     * @param {HANDLE} param1 
     * @param {PWSTR} param2 
     * @param {PWSTR} param3 
     * @param {Pointer<HANDLE>} param4 
     * @param {Pointer<MONITOR2>} param5 
     * @returns {BOOL} 
     */
    Call(param0, param1, param2, param3, param4, param5) {
        param2 := param2 is String ? StrPtr(param2) : param2
        param3 := param3 is String ? StrPtr(param3) : param3

        result := DllCall(this.value, HANDLE, param0, HANDLE, param1, "ptr", param2, "ptr", param3, HANDLE.Ptr, param4, MONITOR2.Ptr, param5, BOOL)
        return result
    }

    /**
     * A PFN_PRINTING_OPENPORTEX2 that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFN_PRINTING_OPENPORTEX2 {
        /**
         * Creates a PFN_PRINTING_OPENPORTEX2 pointer that invokes the given AHK function when called.
         * @param {Func(HANDLE, HANDLE, PWSTR, PWSTR, HANDLE, MONITOR2) => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 6)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 6 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HANDLE, HANDLE, PWSTR, PWSTR, HANDLE.Ptr, MONITOR2.Ptr, BOOL])
        }

        __Delete() => CallbackFree(this.value)
    }
}
