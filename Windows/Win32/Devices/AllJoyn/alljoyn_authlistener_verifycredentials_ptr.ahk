#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\alljoyn_credentials.ahk" { alljoyn_credentials }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * @namespace Windows.Win32.Devices.AllJoyn
 */
export default struct alljoyn_authlistener_verifycredentials_ptr {
    value : IntPtr

    __value {
        set {
            if (value is alljoyn_authlistener_verifycredentials_ptr) {
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
     * @param {alljoyn_credentials} credentials 
     * @returns {Integer} 
     */
    Call(_context, authMechanism, peerName, credentials) {
        authMechanism := authMechanism is String ? StrPtr(authMechanism) : authMechanism
        peerName := peerName is String ? StrPtr(peerName) : peerName

        _contextMarshal := _context is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, _contextMarshal, _context, "ptr", authMechanism, "ptr", peerName, alljoyn_credentials, credentials, Int32)
        return result
    }

    /**
     * A alljoyn_authlistener_verifycredentials_ptr that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends alljoyn_authlistener_verifycredentials_ptr {
        /**
         * Creates a alljoyn_authlistener_verifycredentials_ptr pointer that invokes the given AHK function when called.
         * @param {Func("ptr", PSTR, PSTR, alljoyn_credentials) => Int32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", PSTR, PSTR, alljoyn_credentials, Int32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
