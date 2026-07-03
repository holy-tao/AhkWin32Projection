#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * @namespace Windows.Win32.Graphics.Printing
 */
export default struct PFN_PRINTING_ADDPORTEX {
    value : IntPtr

    __value {
        set {
            if (value is PFN_PRINTING_ADDPORTEX) {
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
     * @param {PWSTR} param3 
     * @returns {BOOL} 
     */
    Call(param0, param1, param2, param3) {
        param0 := param0 is String ? StrPtr(param0) : param0
        param3 := param3 is String ? StrPtr(param3) : param3

        param2Marshal := param2 is VarRef ? "char*" : "ptr"

        result := DllCall(this.value, "ptr", param0, UInt32, param1, param2Marshal, param2, "ptr", param3, BOOL)
        return result
    }

    /**
     * A PFN_PRINTING_ADDPORTEX that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFN_PRINTING_ADDPORTEX {
        /**
         * Creates a PFN_PRINTING_ADDPORTEX pointer that invokes the given AHK function when called.
         * @param {Func(PWSTR, UInt32, "char*", PWSTR) => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [PWSTR, UInt32, "char*", PWSTR, BOOL])
        }

        __Delete() => CallbackFree(this.value)
    }
}
