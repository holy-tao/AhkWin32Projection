#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }

/**
 * @namespace Windows.Win32.System.SystemServices
 * @architecture X64
 */
export default struct PTERMINATION_HANDLER {
    value : IntPtr

    __value {
        set {
            if (value is PTERMINATION_HANDLER) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {BOOLEAN} _abnormal_termination 
     * @param {Pointer<Void>} EstablisherFrame 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(_abnormal_termination, EstablisherFrame) {
        EstablisherFrameMarshal := EstablisherFrame is VarRef ? "ptr" : "ptr"

        DllCall(this.value, BOOLEAN, _abnormal_termination, EstablisherFrameMarshal, EstablisherFrame)
    }

    /**
     * A PTERMINATION_HANDLER that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PTERMINATION_HANDLER {
        /**
         * Creates a PTERMINATION_HANDLER pointer that invokes the given AHK function when called.
         * @param {Func(BOOLEAN, "ptr") => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [BOOLEAN, "ptr", IntPtr])
        }

        __Delete() => CallbackFree(this.value)
    }
}
