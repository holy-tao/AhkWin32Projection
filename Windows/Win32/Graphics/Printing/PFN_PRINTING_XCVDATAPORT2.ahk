#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * @namespace Windows.Win32.Graphics.Printing
 */
export default struct PFN_PRINTING_XCVDATAPORT2 {
    value : IntPtr

    __value {
        set {
            if (value is PFN_PRINTING_XCVDATAPORT2) {
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
     * @param {Pointer<Integer>} param2 
     * @param {Integer} param3 
     * @param {Pointer<Integer>} param4 
     * @param {Integer} param5 
     * @param {Pointer<Integer>} param6 
     * @returns {Integer} 
     */
    Call(param0, param1, param2, param3, param4, param5, param6) {
        param1 := param1 is String ? StrPtr(param1) : param1

        param2Marshal := param2 is VarRef ? "char*" : "ptr"
        param4Marshal := param4 is VarRef ? "char*" : "ptr"
        param6Marshal := param6 is VarRef ? "uint*" : "ptr"

        result := DllCall(this.value, HANDLE, param0, "ptr", param1, param2Marshal, param2, UInt32, param3, param4Marshal, param4, UInt32, param5, param6Marshal, param6, UInt32)
        return result
    }

    /**
     * A PFN_PRINTING_XCVDATAPORT2 that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFN_PRINTING_XCVDATAPORT2 {
        /**
         * Creates a PFN_PRINTING_XCVDATAPORT2 pointer that invokes the given AHK function when called.
         * @param {Func(HANDLE, PWSTR, "char*", UInt32, "char*", UInt32, "uint*") => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 7)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 7 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HANDLE, PWSTR, "char*", UInt32, "char*", UInt32, "uint*", UInt32])
        }

        __Delete() => CallbackFree(this.value)
    }
}
