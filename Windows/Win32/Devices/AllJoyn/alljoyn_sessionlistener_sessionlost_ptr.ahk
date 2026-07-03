#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\alljoyn_sessionlostreason.ahk" { alljoyn_sessionlostreason }

/**
 * @namespace Windows.Win32.Devices.AllJoyn
 */
export default struct alljoyn_sessionlistener_sessionlost_ptr {
    value : IntPtr

    __value {
        set {
            if (value is alljoyn_sessionlistener_sessionlost_ptr) {
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
     * @param {Integer} sessionId 
     * @param {alljoyn_sessionlostreason} reason 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(_context, sessionId, reason) {
        _contextMarshal := _context is VarRef ? "ptr" : "ptr"

        DllCall(this.value, _contextMarshal, _context, UInt32, sessionId, alljoyn_sessionlostreason, reason)
    }

    /**
     * A alljoyn_sessionlistener_sessionlost_ptr that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends alljoyn_sessionlistener_sessionlost_ptr {
        /**
         * Creates a alljoyn_sessionlistener_sessionlost_ptr pointer that invokes the given AHK function when called.
         * @param {Func("ptr", UInt32, alljoyn_sessionlostreason) => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", UInt32, alljoyn_sessionlostreason, IntPtr])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
