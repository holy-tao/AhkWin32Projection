#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\alljoyn_credentials.ahk" { alljoyn_credentials }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }
#Import ".\alljoyn_authlistener.ahk" { alljoyn_authlistener }
#Import ".\QStatus.ahk" { QStatus }

/**
 * @namespace Windows.Win32.Devices.AllJoyn
 */
export default struct alljoyn_authlistener_verifycredentialsasync_ptr {
    value : IntPtr

    __value {
        set {
            if (value is alljoyn_authlistener_verifycredentialsasync_ptr) {
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
     * @param {alljoyn_authlistener} listener 
     * @param {PSTR} authMechanism 
     * @param {PSTR} peerName 
     * @param {alljoyn_credentials} credentials 
     * @param {Pointer<Void>} authContext 
     * @returns {QStatus} 
     */
    Call(_context, listener, authMechanism, peerName, credentials, authContext) {
        authMechanism := authMechanism is String ? StrPtr(authMechanism) : authMechanism
        peerName := peerName is String ? StrPtr(peerName) : peerName

        _contextMarshal := _context is VarRef ? "ptr" : "ptr"
        authContextMarshal := authContext is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, _contextMarshal, _context, alljoyn_authlistener, listener, "ptr", authMechanism, "ptr", peerName, alljoyn_credentials, credentials, authContextMarshal, authContext, QStatus)
        return result
    }

    /**
     * A alljoyn_authlistener_verifycredentialsasync_ptr that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends alljoyn_authlistener_verifycredentialsasync_ptr {
        /**
         * Creates a alljoyn_authlistener_verifycredentialsasync_ptr pointer that invokes the given AHK function when called.
         * @param {Func("ptr", alljoyn_authlistener, PSTR, PSTR, alljoyn_credentials, "ptr") => QStatus} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 6)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 6 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", alljoyn_authlistener, PSTR, PSTR, alljoyn_credentials, "ptr", QStatus])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
