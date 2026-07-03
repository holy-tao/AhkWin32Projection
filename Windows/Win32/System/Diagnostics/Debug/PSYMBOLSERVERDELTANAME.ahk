#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug
 * @charset ANSI
 */
export default struct PSYMBOLSERVERDELTANAME {
    value : IntPtr

    __value {
        set {
            if (value is PSYMBOLSERVERDELTANAME) {
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
     * @param {Pointer<Void>} param1 
     * @param {Integer} param2 
     * @param {Integer} param3 
     * @param {Pointer<Void>} param4 
     * @param {Integer} param5 
     * @param {Integer} param6 
     * @param {PSTR} param7 
     * @param {Pointer} param8 
     * @returns {BOOL} 
     */
    Call(param0, param1, param2, param3, param4, param5, param6, param7, param8) {
        param0 := param0 is String ? StrPtr(param0) : param0
        param7 := param7 is String ? StrPtr(param7) : param7

        param1Marshal := param1 is VarRef ? "ptr" : "ptr"
        param4Marshal := param4 is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, "ptr", param0, param1Marshal, param1, UInt32, param2, UInt32, param3, param4Marshal, param4, UInt32, param5, UInt32, param6, "ptr", param7, IntPtr, param8, BOOL)
        return result
    }

    /**
     * A PSYMBOLSERVERDELTANAME that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PSYMBOLSERVERDELTANAME {
        /**
         * Creates a PSYMBOLSERVERDELTANAME pointer that invokes the given AHK function when called.
         * @param {Func(PSTR, "ptr", UInt32, UInt32, "ptr", UInt32, UInt32, PSTR, IntPtr) => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 9)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 9 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [PSTR, "ptr", UInt32, UInt32, "ptr", UInt32, UInt32, PSTR, IntPtr, BOOL])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
