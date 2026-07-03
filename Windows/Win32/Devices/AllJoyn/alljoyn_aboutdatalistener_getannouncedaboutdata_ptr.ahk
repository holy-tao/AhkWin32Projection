#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\QStatus.ahk" { QStatus }
#Import ".\alljoyn_msgarg.ahk" { alljoyn_msgarg }

/**
 * @namespace Windows.Win32.Devices.AllJoyn
 */
export default struct alljoyn_aboutdatalistener_getannouncedaboutdata_ptr {
    value : IntPtr

    __value {
        set {
            if (value is alljoyn_aboutdatalistener_getannouncedaboutdata_ptr) {
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
     * @param {alljoyn_msgarg} msgArg 
     * @returns {QStatus} 
     */
    Call(_context, msgArg) {
        _contextMarshal := _context is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, _contextMarshal, _context, alljoyn_msgarg, msgArg, QStatus)
        return result
    }

    /**
     * A alljoyn_aboutdatalistener_getannouncedaboutdata_ptr that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends alljoyn_aboutdatalistener_getannouncedaboutdata_ptr {
        /**
         * Creates a alljoyn_aboutdatalistener_getannouncedaboutdata_ptr pointer that invokes the given AHK function when called.
         * @param {Func("ptr", alljoyn_msgarg) => QStatus} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", alljoyn_msgarg, QStatus])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
