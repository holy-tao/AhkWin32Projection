#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * @namespace Windows.Win32.Graphics.Printing
 */
export default struct PFN_PRINTING_OPENPORT {
    value : IntPtr

    __value {
        set {
            if (value is PFN_PRINTING_OPENPORT) {
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
     * @param {Pointer<HANDLE>} param1 
     * @returns {BOOL} 
     */
    Call(param0, param1) {
        param0 := param0 is String ? StrPtr(param0) : param0

        result := DllCall(this.value, "ptr", param0, HANDLE.Ptr, param1, BOOL)
        return result
    }

    /**
     * A PFN_PRINTING_OPENPORT that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFN_PRINTING_OPENPORT {
        /**
         * Creates a PFN_PRINTING_OPENPORT pointer that invokes the given AHK function when called.
         * @param {Func(PWSTR, HANDLE) => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [PWSTR, HANDLE.Ptr, BOOL])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
