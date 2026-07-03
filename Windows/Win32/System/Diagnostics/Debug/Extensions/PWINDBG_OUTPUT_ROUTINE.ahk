#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
export default struct PWINDBG_OUTPUT_ROUTINE {
    value : IntPtr

    __value {
        set {
            if (value is PWINDBG_OUTPUT_ROUTINE) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {PSTR} lpFormat 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(lpFormat) {
        lpFormat := lpFormat is String ? StrPtr(lpFormat) : lpFormat

        DllCall(this.value, "ptr", lpFormat)
    }

    /**
     * A PWINDBG_OUTPUT_ROUTINE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PWINDBG_OUTPUT_ROUTINE {
        /**
         * Creates a PWINDBG_OUTPUT_ROUTINE pointer that invokes the given AHK function when called.
         * @param {Func(PSTR) => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, "cdecl", [PSTR, IntPtr])
        }

        __Delete() => CallbackFree(this.value)
    }
}
