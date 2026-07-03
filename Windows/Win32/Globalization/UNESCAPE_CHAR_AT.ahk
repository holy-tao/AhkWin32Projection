#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Globalization
 */
export default struct UNESCAPE_CHAR_AT {
    value : IntPtr

    __value {
        set {
            if (value is UNESCAPE_CHAR_AT) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Integer} offset 
     * @param {Pointer<Void>} _context 
     * @returns {Integer} 
     */
    Call(offset, _context) {
        _contextMarshal := _context is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, Int32, offset, _contextMarshal, _context, UInt16)
        return result
    }

    /**
     * A UNESCAPE_CHAR_AT that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends UNESCAPE_CHAR_AT {
        /**
         * Creates a UNESCAPE_CHAR_AT pointer that invokes the given AHK function when called.
         * @param {Func(Int32, "ptr") => UInt16} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, "cdecl", [Int32, "ptr", UInt16])
        }

        __Delete() => CallbackFree(this.value)
    }
}
