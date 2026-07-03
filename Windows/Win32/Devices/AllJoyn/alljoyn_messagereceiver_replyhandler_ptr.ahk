#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\alljoyn_message.ahk" { alljoyn_message }

/**
 * @namespace Windows.Win32.Devices.AllJoyn
 */
export default struct alljoyn_messagereceiver_replyhandler_ptr {
    value : IntPtr

    __value {
        set {
            if (value is alljoyn_messagereceiver_replyhandler_ptr) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {alljoyn_message} message 
     * @param {Pointer<Void>} _context 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(message, _context) {
        _contextMarshal := _context is VarRef ? "ptr" : "ptr"

        DllCall(this.value, alljoyn_message, message, _contextMarshal, _context)
    }

    /**
     * A alljoyn_messagereceiver_replyhandler_ptr that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends alljoyn_messagereceiver_replyhandler_ptr {
        /**
         * Creates a alljoyn_messagereceiver_replyhandler_ptr pointer that invokes the given AHK function when called.
         * @param {Func(alljoyn_message, "ptr") => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [alljoyn_message, "ptr", IntPtr])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
