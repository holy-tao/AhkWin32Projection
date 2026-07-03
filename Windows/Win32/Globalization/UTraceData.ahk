#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\Foundation\PSTR.ahk" { PSTR }

/**
 * @namespace Windows.Win32.Globalization
 */
export default struct UTraceData {
    value : IntPtr

    __value {
        set {
            if (value is UTraceData) {
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
     * @param {Integer} fnNumber 
     * @param {Integer} level 
     * @param {PSTR} fmt 
     * @param {Pointer<Integer>} args 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(_context, fnNumber, level, fmt, args) {
        fmt := fmt is String ? StrPtr(fmt) : fmt

        _contextMarshal := _context is VarRef ? "ptr" : "ptr"
        argsMarshal := args is VarRef ? "char*" : "ptr"

        DllCall(this.value, _contextMarshal, _context, Int32, fnNumber, Int32, level, "ptr", fmt, argsMarshal, args)
    }

    /**
     * A UTraceData that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends UTraceData {
        /**
         * Creates a UTraceData pointer that invokes the given AHK function when called.
         * @param {Func("ptr", Int32, Int32, PSTR, "char*") => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 5)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 5 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, "cdecl", ["ptr", Int32, Int32, PSTR, "char*", IntPtr])
        }

        __Delete() => CallbackFree(this.value)
    }
}
