#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\Foundation\PSTR.ahk" { PSTR }
#Import ".\UCharNameChoice.ahk" { UCharNameChoice }

/**
 * @namespace Windows.Win32.Globalization
 */
export default struct UEnumCharNamesFn {
    value : IntPtr

    __value {
        set {
            if (value is UEnumCharNamesFn) {
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
     * @param {Integer} code 
     * @param {UCharNameChoice} nameChoice 
     * @param {PSTR} name 
     * @param {Integer} length 
     * @returns {Integer} 
     */
    Call(_context, code, nameChoice, name, length) {
        name := name is String ? StrPtr(name) : name

        _contextMarshal := _context is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, _contextMarshal, _context, Int32, code, UCharNameChoice, nameChoice, "ptr", name, Int32, length, Int8)
        return result
    }

    /**
     * A UEnumCharNamesFn that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends UEnumCharNamesFn {
        /**
         * Creates a UEnumCharNamesFn pointer that invokes the given AHK function when called.
         * @param {Func("ptr", Int32, UCharNameChoice, PSTR, Int32) => Int8} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 5)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 5 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, "cdecl", ["ptr", Int32, UCharNameChoice, PSTR, Int32, Int8])
        }

        __Delete() => CallbackFree(this.value)
    }
}
