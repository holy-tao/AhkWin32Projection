#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\alljoyn_keystorelistener.ahk" { alljoyn_keystorelistener }

/**
 * @namespace Windows.Win32.Devices.AllJoyn
 */
export default struct alljoyn_keystorelistener_releaseexclusivelock_ptr {
    value : IntPtr

    __value {
        set {
            if (value is alljoyn_keystorelistener_releaseexclusivelock_ptr) {
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
     * @param {alljoyn_keystorelistener} listener 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(_context, listener) {
        _contextMarshal := _context is VarRef ? "ptr" : "ptr"

        DllCall(this.value, _contextMarshal, _context, alljoyn_keystorelistener, listener)
    }

    /**
     * A alljoyn_keystorelistener_releaseexclusivelock_ptr that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends alljoyn_keystorelistener_releaseexclusivelock_ptr {
        /**
         * Creates a alljoyn_keystorelistener_releaseexclusivelock_ptr pointer that invokes the given AHK function when called.
         * @param {Func("ptr", alljoyn_keystorelistener) => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", alljoyn_keystorelistener, IntPtr])
        }

        __Delete() => CallbackFree(this.value)
    }
}
