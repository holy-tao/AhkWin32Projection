#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Globalization
 */
export default struct UTraceEntry {
    value : IntPtr

    __value {
        set {
            if (value is UTraceEntry) {
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
     * @returns {String} Nothing - always returns an empty string
     */
    Call(_context, fnNumber) {
        _contextMarshal := _context is VarRef ? "ptr" : "ptr"

        DllCall(this.value, _contextMarshal, _context, Int32, fnNumber)
    }

    /**
     * A UTraceEntry that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends UTraceEntry {
        /**
         * Creates a UTraceEntry pointer that invokes the given AHK function when called.
         * @param {Func("ptr", Int32) => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, "cdecl", ["ptr", Int32, IntPtr])
        }

        __Delete() => CallbackFree(this.value)
    }
}
