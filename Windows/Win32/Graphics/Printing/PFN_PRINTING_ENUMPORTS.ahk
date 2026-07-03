#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * @namespace Windows.Win32.Graphics.Printing
 */
export default struct PFN_PRINTING_ENUMPORTS {
    value : IntPtr

    __value {
        set {
            if (value is PFN_PRINTING_ENUMPORTS) {
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
     * @param {Integer} param1 
     * @param {Pointer<Integer>} param2 
     * @param {Integer} param3 
     * @param {Pointer<Integer>} param4 
     * @param {Pointer<Integer>} param5 
     * @returns {BOOL} 
     */
    Call(param0, param1, param2, param3, param4, param5) {
        param0 := param0 is String ? StrPtr(param0) : param0

        param2Marshal := param2 is VarRef ? "char*" : "ptr"
        param4Marshal := param4 is VarRef ? "uint*" : "ptr"
        param5Marshal := param5 is VarRef ? "uint*" : "ptr"

        result := DllCall(this.value, "ptr", param0, UInt32, param1, param2Marshal, param2, UInt32, param3, param4Marshal, param4, param5Marshal, param5, BOOL)
        return result
    }

    /**
     * A PFN_PRINTING_ENUMPORTS that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFN_PRINTING_ENUMPORTS {
        /**
         * Creates a PFN_PRINTING_ENUMPORTS pointer that invokes the given AHK function when called.
         * @param {Func(PWSTR, UInt32, "char*", UInt32, "uint*", "uint*") => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 6)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 6 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [PWSTR, UInt32, "char*", UInt32, "uint*", "uint*", BOOL])
        }

        __Delete() => CallbackFree(this.value)
    }
}
