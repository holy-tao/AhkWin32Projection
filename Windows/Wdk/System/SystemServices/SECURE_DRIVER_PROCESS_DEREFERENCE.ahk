#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PEPROCESS.ahk" { PEPROCESS }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct SECURE_DRIVER_PROCESS_DEREFERENCE {
    value : IntPtr

    __value {
        set {
            if (value is SECURE_DRIVER_PROCESS_DEREFERENCE) {
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
     * @param {PEPROCESS} Process 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(InterfaceContext, Process) {
        InterfaceContextMarshal := InterfaceContext is VarRef ? "ptr" : "ptr"

        DllCall(this.value, InterfaceContextMarshal, InterfaceContext, PEPROCESS, Process)
    }

    /**
     * A SECURE_DRIVER_PROCESS_DEREFERENCE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends SECURE_DRIVER_PROCESS_DEREFERENCE {
        /**
         * Creates a SECURE_DRIVER_PROCESS_DEREFERENCE pointer that invokes the given AHK function when called.
         * @param {Func("ptr", PEPROCESS) => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", PEPROCESS, IntPtr])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
