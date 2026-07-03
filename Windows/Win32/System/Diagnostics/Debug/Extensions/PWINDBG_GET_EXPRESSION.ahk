#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
export default struct PWINDBG_GET_EXPRESSION {
    value : IntPtr

    __value {
        set {
            if (value is PWINDBG_GET_EXPRESSION) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {PSTR} lpExpression 
     * @returns {Pointer} 
     */
    Call(lpExpression) {
        lpExpression := lpExpression is String ? StrPtr(lpExpression) : lpExpression

        result := DllCall(this.value, "ptr", lpExpression, IntPtr)
        return result
    }

    /**
     * A PWINDBG_GET_EXPRESSION that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PWINDBG_GET_EXPRESSION {
        /**
         * Creates a PWINDBG_GET_EXPRESSION pointer that invokes the given AHK function when called.
         * @param {Func(PSTR) => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [PSTR, IntPtr])
        }

        __Delete() => CallbackFree(this.value)
    }
}
