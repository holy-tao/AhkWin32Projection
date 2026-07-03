#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug
 * @charset ANSI
 */
export default struct PSYMBOLSERVERSTORESUPPLEMENT {
    value : IntPtr

    __value {
        set {
            if (value is PSYMBOLSERVERSTORESUPPLEMENT) {
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
     * @param {PSTR} param1 
     * @param {PSTR} param2 
     * @param {PSTR} param3 
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
     * A PSYMBOLSERVERSTORESUPPLEMENT that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PSYMBOLSERVERSTORESUPPLEMENT {
        /**
         * Creates a PSYMBOLSERVERSTORESUPPLEMENT pointer that invokes the given AHK function when called.
         * @param {Func(PSTR, PSTR, PSTR, PSTR, IntPtr, UInt32) => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 6)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 6 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [PSTR, PSTR, PSTR, PSTR, IntPtr, UInt32, BOOL])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
