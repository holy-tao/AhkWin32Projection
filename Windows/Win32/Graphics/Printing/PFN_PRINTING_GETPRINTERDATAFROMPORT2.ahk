#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * @namespace Windows.Win32.Graphics.Printing
 */
export default struct PFN_PRINTING_GETPRINTERDATAFROMPORT2 {
    value : IntPtr

    __value {
        set {
            if (value is PFN_PRINTING_GETPRINTERDATAFROMPORT2) {
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
     * @param {Integer} param1 
     * @param {PWSTR} param2 
     * @param {PWSTR} param3 
     * @param {Integer} param4 
     * @param {PWSTR} param5 
     * @param {Integer} param6 
     * @param {Pointer<Integer>} param7 
     * @returns {BOOL} 
     */
    Call(param0, param1, param2, param3, param4, param5, param6, param7) {
        param2 := param2 is String ? StrPtr(param2) : param2
        param3 := param3 is String ? StrPtr(param3) : param3
        param5 := param5 is String ? StrPtr(param5) : param5

        param7Marshal := param7 is VarRef ? "uint*" : "ptr"

        result := DllCall(this.value, HANDLE, param0, UInt32, param1, "ptr", param2, "ptr", param3, UInt32, param4, "ptr", param5, UInt32, param6, param7Marshal, param7, BOOL)
        return result
    }

    /**
     * A PFN_PRINTING_GETPRINTERDATAFROMPORT2 that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFN_PRINTING_GETPRINTERDATAFROMPORT2 {
        /**
         * Creates a PFN_PRINTING_GETPRINTERDATAFROMPORT2 pointer that invokes the given AHK function when called.
         * @param {Func(HANDLE, UInt32, PWSTR, PWSTR, UInt32, PWSTR, UInt32, "uint*") => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 8)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 8 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HANDLE, UInt32, PWSTR, PWSTR, UInt32, PWSTR, UInt32, "uint*", BOOL])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
