#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * @namespace Windows.Win32.Graphics.Printing
 */
export default struct PFN_PRINTING_NOTIFYUNUSEDPORTS2 {
    value : IntPtr

    __value {
        set {
            if (value is PFN_PRINTING_NOTIFYUNUSEDPORTS2) {
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
     * @param {PWSTR} param2 
     * @returns {Integer} 
     */
    Call(param0, param1, param2) {
        param2 := param2 is String ? StrPtr(param2) : param2

        result := DllCall(this.value, HANDLE, param0, UInt32, param1, "ptr", param2, UInt32)
        return result
    }

    /**
     * A PFN_PRINTING_NOTIFYUNUSEDPORTS2 that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFN_PRINTING_NOTIFYUNUSEDPORTS2 {
        /**
         * Creates a PFN_PRINTING_NOTIFYUNUSEDPORTS2 pointer that invokes the given AHK function when called.
         * @param {Func(HANDLE, UInt32, PWSTR) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HANDLE, UInt32, PWSTR, UInt32])
        }

        __Delete() => CallbackFree(this.value)
    }
}
