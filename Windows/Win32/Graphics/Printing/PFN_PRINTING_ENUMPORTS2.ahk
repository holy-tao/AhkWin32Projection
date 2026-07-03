#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * @namespace Windows.Win32.Graphics.Printing
 */
export default struct PFN_PRINTING_ENUMPORTS2 {
    value : IntPtr

    __value {
        set {
            if (value is PFN_PRINTING_ENUMPORTS2) {
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
     * @param {Integer} param2 
     * @param {Pointer<Integer>} param3 
     * @param {Integer} param4 
     * @param {Pointer<Integer>} param5 
     * @param {Pointer<Integer>} param6 
     * @returns {BOOL} 
     */
    Call(param0, param1, param2, param3, param4, param5, param6) {
        param1 := param1 is String ? StrPtr(param1) : param1

        param3Marshal := param3 is VarRef ? "char*" : "ptr"
        param5Marshal := param5 is VarRef ? "uint*" : "ptr"
        param6Marshal := param6 is VarRef ? "uint*" : "ptr"

        result := DllCall(this.value, HANDLE, param0, "ptr", param1, UInt32, param2, param3Marshal, param3, UInt32, param4, param5Marshal, param5, param6Marshal, param6, BOOL)
        return result
    }

    /**
     * A PFN_PRINTING_ENUMPORTS2 that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFN_PRINTING_ENUMPORTS2 {
        /**
         * Creates a PFN_PRINTING_ENUMPORTS2 pointer that invokes the given AHK function when called.
         * @param {Func(HANDLE, PWSTR, UInt32, "char*", UInt32, "uint*", "uint*") => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 7)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 7 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HANDLE, PWSTR, UInt32, "char*", UInt32, "uint*", "uint*", BOOL])
        }

        __Delete() => CallbackFree(this.value)
    }
}
