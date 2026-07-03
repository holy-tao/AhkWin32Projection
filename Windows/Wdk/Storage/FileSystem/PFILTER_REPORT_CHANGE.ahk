#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\Foundation\BOOLEAN.ahk" { BOOLEAN }

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 */
export default struct PFILTER_REPORT_CHANGE {
    value : IntPtr

    __value {
        set {
            if (value is PFILTER_REPORT_CHANGE) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Void>} NotifyContext 
     * @param {Pointer<Void>} FilterContext 
     * @returns {BOOLEAN} 
     */
    Call(NotifyContext, FilterContext) {
        NotifyContextMarshal := NotifyContext is VarRef ? "ptr" : "ptr"
        FilterContextMarshal := FilterContext is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, NotifyContextMarshal, NotifyContext, FilterContextMarshal, FilterContext, BOOLEAN)
        return result
    }

    /**
     * A PFILTER_REPORT_CHANGE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFILTER_REPORT_CHANGE {
        /**
         * Creates a PFILTER_REPORT_CHANGE pointer that invokes the given AHK function when called.
         * @param {Func("ptr", "ptr") => BOOLEAN} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", "ptr", BOOLEAN])
        }

        __Delete() => CallbackFree(this.value)
    }
}
