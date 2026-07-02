#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Globalization
 */
export default struct URegexFindProgressCallback {
    value : IntPtr

    __value {
        set {
            if (value is URegexFindProgressCallback) {
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
     * @param {Integer} matchIndex 
     * @returns {Integer} 
     */
    Call(_context, matchIndex) {
        _contextMarshal := _context is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, _contextMarshal, _context, Int64, matchIndex, Int8)
        return result
    }

    /**
     * A URegexFindProgressCallback that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends URegexFindProgressCallback {
        /**
         * Creates a URegexFindProgressCallback pointer that invokes the given AHK function when called.
         * @param {Func("ptr", Int64) => Int8} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, "cdecl", ["ptr", Int64, Int8])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
