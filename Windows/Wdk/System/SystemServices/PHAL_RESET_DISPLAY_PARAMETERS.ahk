#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\Foundation\BOOLEAN.ahk" { BOOLEAN }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct PHAL_RESET_DISPLAY_PARAMETERS {
    value : IntPtr

    __value {
        set {
            if (value is PHAL_RESET_DISPLAY_PARAMETERS) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Integer} _Columns 
     * @param {Integer} Rows 
     * @returns {BOOLEAN} 
     */
    Call(_Columns, Rows) {
        result := DllCall(this.value, UInt32, _Columns, UInt32, Rows, BOOLEAN)
        return result
    }

    /**
     * A PHAL_RESET_DISPLAY_PARAMETERS that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PHAL_RESET_DISPLAY_PARAMETERS {
        /**
         * Creates a PHAL_RESET_DISPLAY_PARAMETERS pointer that invokes the given AHK function when called.
         * @param {Func(UInt32, UInt32) => BOOLEAN} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [UInt32, UInt32, BOOLEAN])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
