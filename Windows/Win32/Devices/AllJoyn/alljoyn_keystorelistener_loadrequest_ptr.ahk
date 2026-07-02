#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\alljoyn_keystorelistener.ahk" { alljoyn_keystorelistener }
#Import ".\alljoyn_keystore.ahk" { alljoyn_keystore }
#Import ".\QStatus.ahk" { QStatus }

/**
 * @namespace Windows.Win32.Devices.AllJoyn
 */
export default struct alljoyn_keystorelistener_loadrequest_ptr {
    value : IntPtr

    __value {
        set {
            if (value is alljoyn_keystorelistener_loadrequest_ptr) {
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
     * @param {alljoyn_keystore} keyStore 
     * @returns {QStatus} 
     */
    Call(_context, listener, keyStore) {
        _contextMarshal := _context is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, _contextMarshal, _context, alljoyn_keystorelistener, listener, alljoyn_keystore, keyStore, QStatus)
        return result
    }

    /**
     * A alljoyn_keystorelistener_loadrequest_ptr that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends alljoyn_keystorelistener_loadrequest_ptr {
        /**
         * Creates a alljoyn_keystorelistener_loadrequest_ptr pointer that invokes the given AHK function when called.
         * @param {Func("ptr", alljoyn_keystorelistener, alljoyn_keystore) => QStatus} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", alljoyn_keystorelistener, alljoyn_keystore, QStatus])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
