#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\alljoyn_sessionopts.ahk" { alljoyn_sessionopts }
#Import ".\QStatus.ahk" { QStatus }

/**
 * @namespace Windows.Win32.Devices.AllJoyn
 */
export default struct alljoyn_busattachment_joinsessioncb_ptr {
    value : IntPtr

    __value {
        set {
            if (value is alljoyn_busattachment_joinsessioncb_ptr) {
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
     * @param {Integer} sessionId 
     * @param {alljoyn_sessionopts} opts 
     * @param {Pointer<Void>} _context 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(_status, sessionId, opts, _context) {
        _contextMarshal := _context is VarRef ? "ptr" : "ptr"

        DllCall(this.value, QStatus, _status, UInt32, sessionId, alljoyn_sessionopts, opts, _contextMarshal, _context)
    }

    /**
     * A alljoyn_busattachment_joinsessioncb_ptr that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends alljoyn_busattachment_joinsessioncb_ptr {
        /**
         * Creates a alljoyn_busattachment_joinsessioncb_ptr pointer that invokes the given AHK function when called.
         * @param {Func(QStatus, UInt32, alljoyn_sessionopts, "ptr") => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [QStatus, UInt32, alljoyn_sessionopts, "ptr", IntPtr])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
