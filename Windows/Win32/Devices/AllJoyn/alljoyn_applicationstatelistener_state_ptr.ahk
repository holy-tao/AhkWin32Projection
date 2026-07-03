#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\alljoyn_applicationstate.ahk" { alljoyn_applicationstate }

/**
 * @namespace Windows.Win32.Devices.AllJoyn
 */
export default struct alljoyn_applicationstatelistener_state_ptr {
    value : IntPtr

    __value {
        set {
            if (value is alljoyn_applicationstatelistener_state_ptr) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Integer>} busName 
     * @param {Pointer<Integer>} publicKey 
     * @param {alljoyn_applicationstate} applicationState 
     * @param {Pointer<Void>} _context 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(busName, publicKey, applicationState, _context) {
        busNameMarshal := busName is VarRef ? "char*" : "ptr"
        publicKeyMarshal := publicKey is VarRef ? "char*" : "ptr"
        _contextMarshal := _context is VarRef ? "ptr" : "ptr"

        DllCall(this.value, busNameMarshal, busName, publicKeyMarshal, publicKey, alljoyn_applicationstate, applicationState, _contextMarshal, _context)
    }

    /**
     * A alljoyn_applicationstatelistener_state_ptr that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends alljoyn_applicationstatelistener_state_ptr {
        /**
         * Creates a alljoyn_applicationstatelistener_state_ptr pointer that invokes the given AHK function when called.
         * @param {Func("char*", "char*", alljoyn_applicationstate, "ptr") => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["char*", "char*", alljoyn_applicationstate, "ptr", IntPtr])
        }

        __Delete() => CallbackFree(this.value)
    }
}
