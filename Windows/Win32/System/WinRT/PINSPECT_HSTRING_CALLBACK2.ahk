#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.System.WinRT
 */
export default struct PINSPECT_HSTRING_CALLBACK2 {
    value : IntPtr

    __value {
        set {
            if (value is PINSPECT_HSTRING_CALLBACK2) {
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
     * @param {Integer} readAddress 
     * @param {Integer} length 
     * @returns {Integer} 
     */
    Call(_context, readAddress, length) {
        _contextMarshal := _context is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, _contextMarshal, _context, Int64, readAddress, UInt32, length, "char*", &_buffer := 0, "HRESULT")
        return _buffer
    }

    /**
     * A PINSPECT_HSTRING_CALLBACK2 that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PINSPECT_HSTRING_CALLBACK2 {
        /**
         * Creates a PINSPECT_HSTRING_CALLBACK2 pointer that invokes the given AHK function when called.
         * @param {Func("ptr", Int64, UInt32) => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", Int64, UInt32, "int"])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
