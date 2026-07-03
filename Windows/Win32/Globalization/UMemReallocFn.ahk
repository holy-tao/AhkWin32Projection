#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Globalization
 */
export default struct UMemReallocFn {
    value : IntPtr

    __value {
        set {
            if (value is UMemReallocFn) {
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
     * @param {Pointer<Void>} mem 
     * @param {Pointer} _size 
     * @returns {Pointer<Void>} 
     */
    Call(_context, mem, _size) {
        _contextMarshal := _context is VarRef ? "ptr" : "ptr"
        memMarshal := mem is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, _contextMarshal, _context, memMarshal, mem, IntPtr, _size, IntPtr)
        return result
    }

    /**
     * A UMemReallocFn that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends UMemReallocFn {
        /**
         * Creates a UMemReallocFn pointer that invokes the given AHK function when called.
         * @param {Func("ptr", "ptr", IntPtr) => "ptr"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, "cdecl", ["ptr", "ptr", IntPtr, "ptr"])
        }

        __Delete() => CallbackFree(this.value)
    }
}
