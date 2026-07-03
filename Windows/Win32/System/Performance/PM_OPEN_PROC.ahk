#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * @namespace Windows.Win32.System.Performance
 */
export default struct PM_OPEN_PROC {
    value : IntPtr

    __value {
        set {
            if (value is PM_OPEN_PROC) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {PWSTR} pContext 
     * @returns {Integer} 
     */
    Call(pContext) {
        pContext := pContext is String ? StrPtr(pContext) : pContext

        result := DllCall(this.value, "ptr", pContext, UInt32)
        return result
    }

    /**
     * A PM_OPEN_PROC that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PM_OPEN_PROC {
        /**
         * Creates a PM_OPEN_PROC pointer that invokes the given AHK function when called.
         * @param {Func(PWSTR) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [PWSTR, UInt32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
