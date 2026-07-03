#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\alljoyn_msgarg.ahk" { alljoyn_msgarg }
#Import ".\alljoyn_proxybusobject.ahk" { alljoyn_proxybusobject }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * @namespace Windows.Win32.Devices.AllJoyn
 */
export default struct alljoyn_proxybusobject_listener_propertieschanged_ptr {
    value : IntPtr

    __value {
        set {
            if (value is alljoyn_proxybusobject_listener_propertieschanged_ptr) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {alljoyn_proxybusobject} obj 
     * @param {PSTR} ifaceName 
     * @param {alljoyn_msgarg} changed 
     * @param {alljoyn_msgarg} invalidated 
     * @param {Pointer<Void>} _context 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(obj, ifaceName, changed, invalidated, _context) {
        ifaceName := ifaceName is String ? StrPtr(ifaceName) : ifaceName

        _contextMarshal := _context is VarRef ? "ptr" : "ptr"

        DllCall(this.value, alljoyn_proxybusobject, obj, "ptr", ifaceName, alljoyn_msgarg, changed, alljoyn_msgarg, invalidated, _contextMarshal, _context)
    }

    /**
     * A alljoyn_proxybusobject_listener_propertieschanged_ptr that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends alljoyn_proxybusobject_listener_propertieschanged_ptr {
        /**
         * Creates a alljoyn_proxybusobject_listener_propertieschanged_ptr pointer that invokes the given AHK function when called.
         * @param {Func(alljoyn_proxybusobject, PSTR, alljoyn_msgarg, alljoyn_msgarg, "ptr") => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 5)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 5 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [alljoyn_proxybusobject, PSTR, alljoyn_msgarg, alljoyn_msgarg, "ptr", IntPtr])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
