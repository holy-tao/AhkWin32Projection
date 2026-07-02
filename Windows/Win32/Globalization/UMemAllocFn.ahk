#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Globalization
 */
export default struct UMemAllocFn {
    value : IntPtr

    __value {
        set {
            if (value is UMemAllocFn) {
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
     * @param {Pointer} _size 
     * @returns {Pointer<Void>} 
     */
    Call(_context, _size) {
        _contextMarshal := _context is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, _contextMarshal, _context, IntPtr, _size, IntPtr)
        return result
    }

    /**
     * A UMemAllocFn that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends UMemAllocFn {
        /**
         * Creates a UMemAllocFn pointer that invokes the given AHK function when called.
         * @param {Func("ptr", IntPtr) => "ptr"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, "cdecl", ["ptr", IntPtr, "ptr"])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
