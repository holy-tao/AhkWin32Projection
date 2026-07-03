#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\alljoyn_msgarg.ahk" { alljoyn_msgarg }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * @namespace Windows.Win32.Devices.AllJoyn
 */
export default struct alljoyn_buslistener_bus_prop_changed_ptr {
    value : IntPtr

    __value {
        set {
            if (value is alljoyn_buslistener_bus_prop_changed_ptr) {
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
     * @param {PSTR} prop_name 
     * @param {alljoyn_msgarg} prop_value 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(_context, prop_name, prop_value) {
        prop_name := prop_name is String ? StrPtr(prop_name) : prop_name

        _contextMarshal := _context is VarRef ? "ptr" : "ptr"

        DllCall(this.value, _contextMarshal, _context, "ptr", prop_name, alljoyn_msgarg, prop_value)
    }

    /**
     * A alljoyn_buslistener_bus_prop_changed_ptr that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends alljoyn_buslistener_bus_prop_changed_ptr {
        /**
         * Creates a alljoyn_buslistener_bus_prop_changed_ptr pointer that invokes the given AHK function when called.
         * @param {Func("ptr", PSTR, alljoyn_msgarg) => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", PSTR, alljoyn_msgarg, IntPtr])
        }

        __Delete() => CallbackFree(this.value)
    }
}
