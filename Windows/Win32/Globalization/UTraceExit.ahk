#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\Foundation\PSTR.ahk" { PSTR }

/**
 * @namespace Windows.Win32.Globalization
 */
export default struct UTraceExit {
    value : IntPtr

    __value {
        set {
            if (value is UTraceExit) {
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
     * @param {PSTR} fmt 
     * @param {Pointer<Integer>} args 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(_context, fnNumber, fmt, args) {
        fmt := fmt is String ? StrPtr(fmt) : fmt

        _contextMarshal := _context is VarRef ? "ptr" : "ptr"
        argsMarshal := args is VarRef ? "char*" : "ptr"

        DllCall(this.value, _contextMarshal, _context, Int32, fnNumber, "ptr", fmt, argsMarshal, args)
    }

    /**
     * A UTraceExit that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends UTraceExit {
        /**
         * Creates a UTraceExit pointer that invokes the given AHK function when called.
         * @param {Func("ptr", Int32, PSTR, "char*") => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, "cdecl", ["ptr", Int32, PSTR, "char*", IntPtr])
        }

        __Delete() => CallbackFree(this.value)
    }
}
