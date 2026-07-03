#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * Provides a function pointer to the callback used by the WindowsInspectString function.
 * @remarks
 * Implement this callback when you use the <a href="https://docs.microsoft.com/windows/desktop/api/winstring/nf-winstring-windowsinspectstring">WindowsInspectString</a> function. You can do a cross-process read, read from a dump file, or read from a remote debug debugging session.
 * @see https://learn.microsoft.com/windows/win32/api/winstring/nc-winstring-pinspect_hstring_callback
 * @namespace Windows.Win32.System.WinRT
 */
export default struct PINSPECT_HSTRING_CALLBACK {
    value : IntPtr

    __value {
        set {
            if (value is PINSPECT_HSTRING_CALLBACK) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Void>} _context [in]
     * 
     * Custom context data provided to the <a href="https://docs.microsoft.com/windows/desktop/api/winstring/nf-winstring-windowsinspectstring">WindowsInspectString</a> function.
     * @param {Pointer} readAddress [in]
     * 
     * The address to read data from.
     * @param {Integer} length [in]
     * 
     * The number of bytes to read, starting at <i>readAddress</i>.
     * @returns {Integer} [out]
     * 
     * The buffer that receives a copy of the bytes that are read.
     */
    Call(_context, readAddress, length) {
        _contextMarshal := _context is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, _contextMarshal, _context, IntPtr, readAddress, UInt32, length, "char*", &_buffer := 0, "HRESULT")
        return _buffer
    }

    /**
     * A PINSPECT_HSTRING_CALLBACK that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PINSPECT_HSTRING_CALLBACK {
        /**
         * Creates a PINSPECT_HSTRING_CALLBACK pointer that invokes the given AHK function when called.
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
