#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\QStatus.ahk" { QStatus }
#Import ".\alljoyn_message.ahk" { alljoyn_message }

/**
 * @namespace Windows.Win32.Devices.AllJoyn
 */
export default struct alljoyn_authlistener_securityviolation_ptr {
    value : IntPtr

    __value {
        set {
            if (value is alljoyn_authlistener_securityviolation_ptr) {
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
     * @param {QStatus} _status 
     * @param {alljoyn_message} _msg 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(_context, _status, _msg) {
        _contextMarshal := _context is VarRef ? "ptr" : "ptr"

        DllCall(this.value, _contextMarshal, _context, QStatus, _status, alljoyn_message, _msg)
    }

    /**
     * A alljoyn_authlistener_securityviolation_ptr that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends alljoyn_authlistener_securityviolation_ptr {
        /**
         * Creates a alljoyn_authlistener_securityviolation_ptr pointer that invokes the given AHK function when called.
         * @param {Func("ptr", QStatus, alljoyn_message) => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", QStatus, alljoyn_message, IntPtr])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
