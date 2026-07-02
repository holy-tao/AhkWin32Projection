#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * Provides a function pointer to the callback used by the RoInspectCapturedStackBackTrace function.
 * @see https://learn.microsoft.com/windows/win32/api/roerrorapi/nc-roerrorapi-pinspect_memory_callback
 * @namespace Windows.Win32.System.WinRT
 */
export default struct PINSPECT_MEMORY_CALLBACK {
    value : IntPtr

    __value {
        set {
            if (value is PINSPECT_MEMORY_CALLBACK) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Void>} _context Custom context data provided to the <a href="https://docs.microsoft.com/windows/desktop/api/roerrorapi/nf-roerrorapi-roinspectcapturedstackbacktrace">RoInspectCapturedStackBackTrace</a> function.
     * @param {Pointer} readAddress The address to read data from.
     * @param {Integer} length The number of bytes to read, starting at <i>readAddress</i>.
     * @returns {Integer} The buffer that receives a copy of the bytes that are read.
     */
    Call(_context, readAddress, length) {
        _contextMarshal := _context is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, _contextMarshal, _context, IntPtr, readAddress, UInt32, length, "char*", &_buffer := 0, "HRESULT")
        return _buffer
    }

    /**
     * A PINSPECT_MEMORY_CALLBACK that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PINSPECT_MEMORY_CALLBACK {
        /**
         * Creates a PINSPECT_MEMORY_CALLBACK pointer that invokes the given AHK function when called.
         * @param {Func("ptr", IntPtr, UInt32) => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", IntPtr, UInt32, "int"])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
