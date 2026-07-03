#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\alljoyn_sessionopts.ahk" { alljoyn_sessionopts }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * @namespace Windows.Win32.Devices.AllJoyn
 */
export default struct alljoyn_sessionportlistener_acceptsessionjoiner_ptr {
    value : IntPtr

    __value {
        set {
            if (value is alljoyn_sessionportlistener_acceptsessionjoiner_ptr) {
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
     * @param {Integer} sessionPort 
     * @param {PSTR} joiner 
     * @param {alljoyn_sessionopts} opts 
     * @returns {Integer} 
     */
    Call(_context, sessionPort, joiner, opts) {
        joiner := joiner is String ? StrPtr(joiner) : joiner

        _contextMarshal := _context is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, _contextMarshal, _context, UInt16, sessionPort, "ptr", joiner, alljoyn_sessionopts, opts, Int32)
        return result
    }

    /**
     * A alljoyn_sessionportlistener_acceptsessionjoiner_ptr that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends alljoyn_sessionportlistener_acceptsessionjoiner_ptr {
        /**
         * Creates a alljoyn_sessionportlistener_acceptsessionjoiner_ptr pointer that invokes the given AHK function when called.
         * @param {Func("ptr", UInt16, PSTR, alljoyn_sessionopts) => Int32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", UInt16, PSTR, alljoyn_sessionopts, Int32])
        }

        __Delete() => CallbackFree(this.value)
    }
}
