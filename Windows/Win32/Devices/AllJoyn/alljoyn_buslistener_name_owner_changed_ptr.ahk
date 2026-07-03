#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * @namespace Windows.Win32.Devices.AllJoyn
 */
export default struct alljoyn_buslistener_name_owner_changed_ptr {
    value : IntPtr

    __value {
        set {
            if (value is alljoyn_buslistener_name_owner_changed_ptr) {
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
     * @param {PSTR} busName 
     * @param {PSTR} previousOwner 
     * @param {PSTR} newOwner 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(_context, busName, previousOwner, newOwner) {
        busName := busName is String ? StrPtr(busName) : busName
        previousOwner := previousOwner is String ? StrPtr(previousOwner) : previousOwner
        newOwner := newOwner is String ? StrPtr(newOwner) : newOwner

        _contextMarshal := _context is VarRef ? "ptr" : "ptr"

        DllCall(this.value, _contextMarshal, _context, "ptr", busName, "ptr", previousOwner, "ptr", newOwner)
    }

    /**
     * A alljoyn_buslistener_name_owner_changed_ptr that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends alljoyn_buslistener_name_owner_changed_ptr {
        /**
         * Creates a alljoyn_buslistener_name_owner_changed_ptr pointer that invokes the given AHK function when called.
         * @param {Func("ptr", PSTR, PSTR, PSTR) => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", PSTR, PSTR, PSTR, IntPtr])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
