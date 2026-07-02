#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * @namespace Windows.Win32.Devices.AllJoyn
 */
export default struct alljoyn_authlistener_authenticationcomplete_ptr {
    value : IntPtr

    __value {
        set {
            if (value is alljoyn_authlistener_authenticationcomplete_ptr) {
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
     * @param {PSTR} authMechanism 
     * @param {PSTR} peerName 
     * @param {Integer} success 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(_context, authMechanism, peerName, success) {
        authMechanism := authMechanism is String ? StrPtr(authMechanism) : authMechanism
        peerName := peerName is String ? StrPtr(peerName) : peerName

        _contextMarshal := _context is VarRef ? "ptr" : "ptr"

        DllCall(this.value, _contextMarshal, _context, "ptr", authMechanism, "ptr", peerName, Int32, success)
    }

    /**
     * A alljoyn_authlistener_authenticationcomplete_ptr that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends alljoyn_authlistener_authenticationcomplete_ptr {
        /**
         * Creates a alljoyn_authlistener_authenticationcomplete_ptr pointer that invokes the given AHK function when called.
         * @param {Func("ptr", PSTR, PSTR, Int32) => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", PSTR, PSTR, Int32, IntPtr])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
