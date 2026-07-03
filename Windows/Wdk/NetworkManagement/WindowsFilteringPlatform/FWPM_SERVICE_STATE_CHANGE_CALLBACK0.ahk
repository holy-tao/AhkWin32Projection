#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\NetworkManagement\WindowsFilteringPlatform\FWPM_SERVICE_STATE.ahk" { FWPM_SERVICE_STATE }

/**
 * @namespace Windows.Wdk.NetworkManagement.WindowsFilteringPlatform
 */
export default struct FWPM_SERVICE_STATE_CHANGE_CALLBACK0 {
    value : IntPtr

    __value {
        set {
            if (value is FWPM_SERVICE_STATE_CHANGE_CALLBACK0) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Void>} _context 
     * @param {FWPM_SERVICE_STATE} newState 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(_context, newState) {
        _contextMarshal := _context is VarRef ? "ptr" : "ptr"

        DllCall(this.value, _contextMarshal, _context, FWPM_SERVICE_STATE, newState)
    }

    /**
     * A FWPM_SERVICE_STATE_CHANGE_CALLBACK0 that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends FWPM_SERVICE_STATE_CHANGE_CALLBACK0 {
        /**
         * Creates a FWPM_SERVICE_STATE_CHANGE_CALLBACK0 pointer that invokes the given AHK function when called.
         * @param {Func("ptr", FWPM_SERVICE_STATE) => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", FWPM_SERVICE_STATE, IntPtr])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
