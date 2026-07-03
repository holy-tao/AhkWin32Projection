#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug
 * @charset Unicode
 */
export default struct PSYMBOLSERVERPROCW {
    value : IntPtr

    __value {
        set {
            if (value is PSYMBOLSERVERPROCW) {
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
     * @param {Pointer<Void>} param2 
     * @param {Integer} param3 
     * @param {Integer} param4 
     * @param {PWSTR} param5 
     * @returns {BOOL} 
     */
    Call(param0, param1, param2, param3, param4, param5) {
        param0 := param0 is String ? StrPtr(param0) : param0
        param1 := param1 is String ? StrPtr(param1) : param1
        param5 := param5 is String ? StrPtr(param5) : param5

        param2Marshal := param2 is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, "ptr", param0, "ptr", param1, param2Marshal, param2, UInt32, param3, UInt32, param4, "ptr", param5, BOOL)
        return result
    }

    /**
     * A PSYMBOLSERVERPROCW that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PSYMBOLSERVERPROCW {
        /**
         * Creates a PSYMBOLSERVERPROCW pointer that invokes the given AHK function when called.
         * @param {Func(PWSTR, PWSTR, "ptr", UInt32, UInt32, PWSTR) => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 6)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 6 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [PWSTR, PWSTR, "ptr", UInt32, UInt32, PWSTR, BOOL])
        }

        __Delete() => CallbackFree(this.value)
    }
}
