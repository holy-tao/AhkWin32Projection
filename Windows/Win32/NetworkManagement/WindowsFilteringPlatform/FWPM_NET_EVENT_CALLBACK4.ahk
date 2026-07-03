#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\FWPM_NET_EVENT5.ahk" { FWPM_NET_EVENT5 }

/**
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 */
export default struct FWPM_NET_EVENT_CALLBACK4 {
    value : IntPtr

    __value {
        set {
            if (value is FWPM_NET_EVENT_CALLBACK4) {
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
     * @param {Pointer<FWPM_NET_EVENT5>} event 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(_context, event) {
        _contextMarshal := _context is VarRef ? "ptr" : "ptr"

        DllCall(this.value, _contextMarshal, _context, FWPM_NET_EVENT5.Ptr, event)
    }

    /**
     * A FWPM_NET_EVENT_CALLBACK4 that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends FWPM_NET_EVENT_CALLBACK4 {
        /**
         * Creates a FWPM_NET_EVENT_CALLBACK4 pointer that invokes the given AHK function when called.
         * @param {Func("ptr", FWPM_NET_EVENT5) => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", FWPM_NET_EVENT5.Ptr, IntPtr])
        }

        __Delete() => CallbackFree(this.value)
    }
}
