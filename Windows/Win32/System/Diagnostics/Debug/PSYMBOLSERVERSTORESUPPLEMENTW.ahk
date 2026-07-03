#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug
 * @charset Unicode
 */
export default struct PSYMBOLSERVERSTORESUPPLEMENTW {
    value : IntPtr

    __value {
        set {
            if (value is PSYMBOLSERVERSTORESUPPLEMENTW) {
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
     * @param {PWSTR} param1 
     * @param {PWSTR} param2 
     * @param {PWSTR} param3 
     * @param {Pointer} param4 
     * @param {Integer} param5 
     * @returns {BOOL} 
     */
    Call(param0, param1, param2, param3, param4, param5) {
        param0 := param0 is String ? StrPtr(param0) : param0
        param1 := param1 is String ? StrPtr(param1) : param1
        param2 := param2 is String ? StrPtr(param2) : param2
        param3 := param3 is String ? StrPtr(param3) : param3

        result := DllCall(this.value, "ptr", param0, "ptr", param1, "ptr", param2, "ptr", param3, IntPtr, param4, UInt32, param5, BOOL)
        return result
    }

    /**
     * A PSYMBOLSERVERSTORESUPPLEMENTW that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PSYMBOLSERVERSTORESUPPLEMENTW {
        /**
         * Creates a PSYMBOLSERVERSTORESUPPLEMENTW pointer that invokes the given AHK function when called.
         * @param {Func(PWSTR, PWSTR, PWSTR, PWSTR, IntPtr, UInt32) => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 6)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 6 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [PWSTR, PWSTR, PWSTR, PWSTR, IntPtr, UInt32, BOOL])
        }

        __Delete() => CallbackFree(this.value)
    }
}
