#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * @namespace Windows.Win32.Devices.AllJoyn
 */
export default struct alljoyn_autopinger_destination_found_ptr {
    value : IntPtr

    __value {
        set {
            if (value is alljoyn_autopinger_destination_found_ptr) {
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
     * @param {PSTR} group 
     * @param {PSTR} destination 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(_context, group, destination) {
        group := group is String ? StrPtr(group) : group
        destination := destination is String ? StrPtr(destination) : destination

        _contextMarshal := _context is VarRef ? "ptr" : "ptr"

        DllCall(this.value, _contextMarshal, _context, "ptr", group, "ptr", destination)
    }

    /**
     * A alljoyn_autopinger_destination_found_ptr that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends alljoyn_autopinger_destination_found_ptr {
        /**
         * Creates a alljoyn_autopinger_destination_found_ptr pointer that invokes the given AHK function when called.
         * @param {Func("ptr", PSTR, PSTR) => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", PSTR, PSTR, IntPtr])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
