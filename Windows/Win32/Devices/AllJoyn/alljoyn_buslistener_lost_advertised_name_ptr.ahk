#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * @namespace Windows.Win32.Devices.AllJoyn
 */
export default struct alljoyn_buslistener_lost_advertised_name_ptr {
    value : IntPtr

    __value {
        set {
            if (value is alljoyn_buslistener_lost_advertised_name_ptr) {
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
     * @param {PSTR} name 
     * @param {Integer} transport 
     * @param {PSTR} namePrefix 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(_context, name, transport, namePrefix) {
        name := name is String ? StrPtr(name) : name
        namePrefix := namePrefix is String ? StrPtr(namePrefix) : namePrefix

        _contextMarshal := _context is VarRef ? "ptr" : "ptr"

        DllCall(this.value, _contextMarshal, _context, "ptr", name, UInt16, transport, "ptr", namePrefix)
    }

    /**
     * A alljoyn_buslistener_lost_advertised_name_ptr that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends alljoyn_buslistener_lost_advertised_name_ptr {
        /**
         * Creates a alljoyn_buslistener_lost_advertised_name_ptr pointer that invokes the given AHK function when called.
         * @param {Func("ptr", PSTR, UInt16, PSTR) => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", PSTR, UInt16, PSTR, IntPtr])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
