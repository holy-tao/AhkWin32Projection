#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug
 * @charset Unicode
 */
export default struct PSYMBOLSERVERGETSUPPLEMENTW {
    value : IntPtr

    __value {
        set {
            if (value is PSYMBOLSERVERGETSUPPLEMENTW) {
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
     * @returns {BOOL} 
     */
    Call(param0, param1, param2, param3, param4) {
        param0 := param0 is String ? StrPtr(param0) : param0
        param1 := param1 is String ? StrPtr(param1) : param1
        param2 := param2 is String ? StrPtr(param2) : param2
        param3 := param3 is String ? StrPtr(param3) : param3

        result := DllCall(this.value, "ptr", param0, "ptr", param1, "ptr", param2, "ptr", param3, IntPtr, param4, BOOL)
        return result
    }

    /**
     * A PSYMBOLSERVERGETSUPPLEMENTW that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PSYMBOLSERVERGETSUPPLEMENTW {
        /**
         * Creates a PSYMBOLSERVERGETSUPPLEMENTW pointer that invokes the given AHK function when called.
         * @param {Func(PWSTR, PWSTR, PWSTR, PWSTR, IntPtr) => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 5)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 5 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [PWSTR, PWSTR, PWSTR, PWSTR, IntPtr, BOOL])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
