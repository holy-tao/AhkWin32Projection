#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Globalization
 */
export default struct UCPMapValueFilter {
    value : IntPtr

    __value {
        set {
            if (value is UCPMapValueFilter) {
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
     * @param {Integer} value 
     * @returns {Integer} 
     */
    Call(_context, value) {
        _contextMarshal := _context is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, _contextMarshal, _context, UInt32, value, UInt32)
        return result
    }

    /**
     * A UCPMapValueFilter that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends UCPMapValueFilter {
        /**
         * Creates a UCPMapValueFilter pointer that invokes the given AHK function when called.
         * @param {Func("ptr", UInt32) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, "cdecl", ["ptr", UInt32, UInt32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
