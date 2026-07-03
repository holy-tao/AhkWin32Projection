#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * @namespace Windows.Win32.Graphics.Printing
 */
export default struct PFN_PRINTING_STARTDOCPORT {
    value : IntPtr

    __value {
        set {
            if (value is PFN_PRINTING_STARTDOCPORT) {
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
     * @param {Integer} param3 
     * @param {Pointer<Integer>} param4 
     * @returns {BOOL} 
     */
    Call(param0, param1, param2, param3, param4) {
        param1 := param1 is String ? StrPtr(param1) : param1

        param4Marshal := param4 is VarRef ? "char*" : "ptr"

        result := DllCall(this.value, HANDLE, param0, "ptr", param1, UInt32, param2, UInt32, param3, param4Marshal, param4, BOOL)
        return result
    }

    /**
     * A PFN_PRINTING_STARTDOCPORT that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFN_PRINTING_STARTDOCPORT {
        /**
         * Creates a PFN_PRINTING_STARTDOCPORT pointer that invokes the given AHK function when called.
         * @param {Func(HANDLE, PWSTR, UInt32, UInt32, "char*") => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 5)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 5 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HANDLE, PWSTR, UInt32, UInt32, "char*", BOOL])
        }

        __Delete() => CallbackFree(this.value)
    }
}
