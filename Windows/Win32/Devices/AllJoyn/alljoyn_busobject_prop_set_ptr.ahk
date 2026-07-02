#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PSTR.ahk" { PSTR }
#Import ".\alljoyn_msgarg.ahk" { alljoyn_msgarg }
#Import ".\QStatus.ahk" { QStatus }

/**
 * @namespace Windows.Win32.Devices.AllJoyn
 */
export default struct alljoyn_busobject_prop_set_ptr {
    value : IntPtr

    __value {
        set {
            if (value is alljoyn_busobject_prop_set_ptr) {
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
     * @param {PSTR} ifcName 
     * @param {PSTR} propName 
     * @param {alljoyn_msgarg} _val 
     * @returns {QStatus} 
     */
    Call(_context, ifcName, propName, _val) {
        ifcName := ifcName is String ? StrPtr(ifcName) : ifcName
        propName := propName is String ? StrPtr(propName) : propName

        _contextMarshal := _context is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, _contextMarshal, _context, "ptr", ifcName, "ptr", propName, alljoyn_msgarg, _val, QStatus)
        return result
    }

    /**
     * A alljoyn_busobject_prop_set_ptr that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends alljoyn_busobject_prop_set_ptr {
        /**
         * Creates a alljoyn_busobject_prop_set_ptr pointer that invokes the given AHK function when called.
         * @param {Func("ptr", PSTR, PSTR, alljoyn_msgarg) => QStatus} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", PSTR, PSTR, alljoyn_msgarg, QStatus])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
