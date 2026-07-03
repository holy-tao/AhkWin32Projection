#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PEPROCESS.ahk" { PEPROCESS }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct SECURE_DRIVER_PROCESS_REFERENCE {
    value : IntPtr

    __value {
        set {
            if (value is SECURE_DRIVER_PROCESS_REFERENCE) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Void>} InterfaceContext 
     * @returns {PEPROCESS} 
     */
    Call(InterfaceContext) {
        InterfaceContextMarshal := InterfaceContext is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, InterfaceContextMarshal, InterfaceContext, PEPROCESS)
        return result
    }

    /**
     * A SECURE_DRIVER_PROCESS_REFERENCE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends SECURE_DRIVER_PROCESS_REFERENCE {
        /**
         * Creates a SECURE_DRIVER_PROCESS_REFERENCE pointer that invokes the given AHK function when called.
         * @param {Func("ptr") => PEPROCESS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", PEPROCESS])
        }

        __Delete() => CallbackFree(this.value)
    }
}
