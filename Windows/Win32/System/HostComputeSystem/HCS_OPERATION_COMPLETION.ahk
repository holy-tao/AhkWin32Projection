#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\HCS_OPERATION.ahk" { HCS_OPERATION }

/**
 * @namespace Windows.Win32.System.HostComputeSystem
 */
export default struct HCS_OPERATION_COMPLETION {
    value : IntPtr

    __value {
        set {
            if (value is HCS_OPERATION_COMPLETION) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {HCS_OPERATION} operation 
     * @param {Pointer<Void>} _context 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(operation, _context) {
        _contextMarshal := _context is VarRef ? "ptr" : "ptr"

        DllCall(this.value, HCS_OPERATION, operation, _contextMarshal, _context)
    }

    /**
     * A HCS_OPERATION_COMPLETION that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends HCS_OPERATION_COMPLETION {
        /**
         * Creates a HCS_OPERATION_COMPLETION pointer that invokes the given AHK function when called.
         * @param {Func(HCS_OPERATION, "ptr") => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HCS_OPERATION, "ptr", IntPtr])
        }

        __Delete() => CallbackFree(this.value)
    }
}
