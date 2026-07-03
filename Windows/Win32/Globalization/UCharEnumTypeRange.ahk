#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\UCharCategory.ahk" { UCharCategory }

/**
 * @namespace Windows.Win32.Globalization
 */
export default struct UCharEnumTypeRange {
    value : IntPtr

    __value {
        set {
            if (value is UCharEnumTypeRange) {
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
     * @param {Integer} start 
     * @param {Integer} limit 
     * @param {UCharCategory} type 
     * @returns {Integer} 
     */
    Call(_context, start, limit, type) {
        _contextMarshal := _context is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, _contextMarshal, _context, Int32, start, Int32, limit, UCharCategory, type, Int8)
        return result
    }

    /**
     * A UCharEnumTypeRange that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends UCharEnumTypeRange {
        /**
         * Creates a UCharEnumTypeRange pointer that invokes the given AHK function when called.
         * @param {Func("ptr", Int32, Int32, UCharCategory) => Int8} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, "cdecl", ["ptr", Int32, Int32, UCharCategory, Int8])
        }

        __Delete() => CallbackFree(this.value)
    }
}
