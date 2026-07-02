#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PSTR.ahk" { PSTR }
#Import ".\alljoyn_msgarg.ahk" { alljoyn_msgarg }

/**
 * @namespace Windows.Win32.Devices.AllJoyn
 */
export default struct alljoyn_about_announced_ptr {
    value : IntPtr

    __value {
        set {
            if (value is alljoyn_about_announced_ptr) {
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
     * @param {Integer} _version 
     * @param {Integer} port 
     * @param {alljoyn_msgarg} objectDescriptionArg 
     * @param {alljoyn_msgarg} aboutDataArg 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(_context, busName, _version, port, objectDescriptionArg, aboutDataArg) {
        busName := busName is String ? StrPtr(busName) : busName

        _contextMarshal := _context is VarRef ? "ptr" : "ptr"

        DllCall(this.value, _contextMarshal, _context, "ptr", busName, UInt16, _version, UInt16, port, alljoyn_msgarg, objectDescriptionArg, alljoyn_msgarg, aboutDataArg)
    }

    /**
     * A alljoyn_about_announced_ptr that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends alljoyn_about_announced_ptr {
        /**
         * Creates a alljoyn_about_announced_ptr pointer that invokes the given AHK function when called.
         * @param {Func("ptr", PSTR, UInt16, UInt16, alljoyn_msgarg, alljoyn_msgarg) => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 6)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 6 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", PSTR, UInt16, UInt16, alljoyn_msgarg, alljoyn_msgarg, IntPtr])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
