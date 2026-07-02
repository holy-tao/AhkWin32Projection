#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\alljoyn_proxybusobject.ahk" { alljoyn_proxybusobject }
#Import ".\QStatus.ahk" { QStatus }

/**
 * @namespace Windows.Win32.Devices.AllJoyn
 */
export default struct alljoyn_proxybusobject_listener_introspectcb_ptr {
    value : IntPtr

    __value {
        set {
            if (value is alljoyn_proxybusobject_listener_introspectcb_ptr) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {QStatus} _status 
     * @param {alljoyn_proxybusobject} obj 
     * @param {Pointer<Void>} _context 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(_status, obj, _context) {
        _contextMarshal := _context is VarRef ? "ptr" : "ptr"

        DllCall(this.value, QStatus, _status, alljoyn_proxybusobject, obj, _contextMarshal, _context)
    }

    /**
     * A alljoyn_proxybusobject_listener_introspectcb_ptr that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends alljoyn_proxybusobject_listener_introspectcb_ptr {
        /**
         * Creates a alljoyn_proxybusobject_listener_introspectcb_ptr pointer that invokes the given AHK function when called.
         * @param {Func(QStatus, alljoyn_proxybusobject, "ptr") => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [QStatus, alljoyn_proxybusobject, "ptr", IntPtr])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
