#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\Foundation\BOOLEAN.ahk" { BOOLEAN }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct KSYNCHRONIZE_ROUTINE {
    value : IntPtr

    __value {
        set {
            if (value is KSYNCHRONIZE_ROUTINE) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Void>} SynchronizeContext 
     * @returns {BOOLEAN} 
     */
    Call(SynchronizeContext) {
        SynchronizeContextMarshal := SynchronizeContext is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, SynchronizeContextMarshal, SynchronizeContext, BOOLEAN)
        return result
    }

    /**
     * A KSYNCHRONIZE_ROUTINE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends KSYNCHRONIZE_ROUTINE {
        /**
         * Creates a KSYNCHRONIZE_ROUTINE pointer that invokes the given AHK function when called.
         * @param {Func("ptr") => BOOLEAN} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", BOOLEAN])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
