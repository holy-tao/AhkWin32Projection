#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug
 */
export default struct SYMADDSOURCESTREAMA {
    value : IntPtr

    __value {
        set {
            if (value is SYMADDSOURCESTREAMA) {
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
     * @param {Integer} param1 
     * @param {PSTR} param2 
     * @param {Pointer<Integer>} param3 
     * @param {Pointer} param4 
     * @returns {BOOL} 
     */
    Call(param0, param1, param2, param3, param4) {
        param2 := param2 is String ? StrPtr(param2) : param2

        param3Marshal := param3 is VarRef ? "char*" : "ptr"

        result := DllCall(this.value, HANDLE, param0, Int64, param1, "ptr", param2, param3Marshal, param3, IntPtr, param4, BOOL)
        return result
    }

    /**
     * A SYMADDSOURCESTREAMA that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends SYMADDSOURCESTREAMA {
        /**
         * Creates a SYMADDSOURCESTREAMA pointer that invokes the given AHK function when called.
         * @param {Func(HANDLE, Int64, PSTR, "char*", IntPtr) => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 5)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 5 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HANDLE, Int64, PSTR, "char*", IntPtr, BOOL])
        }

        __Delete() => CallbackFree(this.value)
    }
}
