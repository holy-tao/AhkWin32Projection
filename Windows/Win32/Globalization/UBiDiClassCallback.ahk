#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\UCharDirection.ahk" { UCharDirection }

/**
 * @namespace Windows.Win32.Globalization
 */
export default struct UBiDiClassCallback {
    value : IntPtr

    __value {
        set {
            if (value is UBiDiClassCallback) {
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
     * @param {Integer} c 
     * @returns {UCharDirection} 
     */
    Call(_context, c) {
        _contextMarshal := _context is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, _contextMarshal, _context, Int32, c, UCharDirection)
        return result
    }

    /**
     * A UBiDiClassCallback that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends UBiDiClassCallback {
        /**
         * Creates a UBiDiClassCallback pointer that invokes the given AHK function when called.
         * @param {Func("ptr", Int32) => UCharDirection} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, "cdecl", ["ptr", Int32, UCharDirection])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
