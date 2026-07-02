#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
export default struct PWINDBG_GET_EXPRESSION64 {
    value : IntPtr

    __value {
        set {
            if (value is PWINDBG_GET_EXPRESSION64) {
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
     * @returns {Integer} 
     */
    Call(lpExpression) {
        lpExpression := lpExpression is String ? StrPtr(lpExpression) : lpExpression

        result := DllCall(this.value, "ptr", lpExpression, Int64)
        return result
    }

    /**
     * A PWINDBG_GET_EXPRESSION64 that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PWINDBG_GET_EXPRESSION64 {
        /**
         * Creates a PWINDBG_GET_EXPRESSION64 pointer that invokes the given AHK function when called.
         * @param {Func(PSTR) => Int64} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [PSTR, Int64])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
