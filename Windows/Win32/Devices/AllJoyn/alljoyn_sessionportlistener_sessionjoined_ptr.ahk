#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * @namespace Windows.Win32.Devices.AllJoyn
 */
export default struct alljoyn_sessionportlistener_sessionjoined_ptr {
    value : IntPtr

    __value {
        set {
            if (value is alljoyn_sessionportlistener_sessionjoined_ptr) {
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
     * @param {Integer} sessionPort 
     * @param {Integer} id 
     * @param {PSTR} joiner 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(_context, sessionPort, id, joiner) {
        joiner := joiner is String ? StrPtr(joiner) : joiner

        _contextMarshal := _context is VarRef ? "ptr" : "ptr"

        DllCall(this.value, _contextMarshal, _context, UInt16, sessionPort, UInt32, id, "ptr", joiner)
    }

    /**
     * A alljoyn_sessionportlistener_sessionjoined_ptr that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends alljoyn_sessionportlistener_sessionjoined_ptr {
        /**
         * Creates a alljoyn_sessionportlistener_sessionjoined_ptr pointer that invokes the given AHK function when called.
         * @param {Func("ptr", UInt16, UInt32, PSTR) => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", UInt16, UInt32, PSTR, IntPtr])
        }

        __Delete() => CallbackFree(this.value)
    }
}
