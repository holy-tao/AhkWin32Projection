#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\QStatus.ahk" { QStatus }

/**
 * @namespace Windows.Win32.Devices.AllJoyn
 */
export default struct alljoyn_busattachment_setlinktimeoutcb_ptr {
    value : IntPtr

    __value {
        set {
            if (value is alljoyn_busattachment_setlinktimeoutcb_ptr) {
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
     * @param {Integer} timeout 
     * @param {Pointer<Void>} _context 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(_status, timeout, _context) {
        _contextMarshal := _context is VarRef ? "ptr" : "ptr"

        DllCall(this.value, QStatus, _status, UInt32, timeout, _contextMarshal, _context)
    }

    /**
     * A alljoyn_busattachment_setlinktimeoutcb_ptr that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends alljoyn_busattachment_setlinktimeoutcb_ptr {
        /**
         * Creates a alljoyn_busattachment_setlinktimeoutcb_ptr pointer that invokes the given AHK function when called.
         * @param {Func(QStatus, UInt32, "ptr") => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [QStatus, UInt32, "ptr", IntPtr])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
