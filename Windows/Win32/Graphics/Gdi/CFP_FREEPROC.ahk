#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Client-provided callback function, used by CreateFontPackage and MergeFontPackage to free memory.
 * @remarks
 * <a href="https://docs.microsoft.com/windows/desktop/DirectShow/cbaseallocator-free">free</a> conforms to this type; the application can either use <b>free</b> or a more specialized function. Whatever function is chosen, there must also be appropriate functions to allocate and to reallocate this memory.
 * @see https://learn.microsoft.com/windows/win32/api/fontsub/nc-fontsub-cfp_freeproc
 * @namespace Windows.Win32.Graphics.Gdi
 */
export default struct CFP_FREEPROC {
    value : IntPtr

    __value {
        set {
            if (value is CFP_FREEPROC) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Void>} param0 Previously allocated memory block to be freed.
     * @returns {String} Nothing - always returns an empty string
     */
    Call(param0) {
        param0Marshal := param0 is VarRef ? "ptr" : "ptr"

        DllCall(this.value, param0Marshal, param0)
    }

    /**
     * A CFP_FREEPROC that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends CFP_FREEPROC {
        /**
         * Creates a CFP_FREEPROC pointer that invokes the given AHK function when called.
         * @param {Func("ptr") => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, "cdecl", ["ptr", IntPtr])
        }

        __Delete() => CallbackFree(this.value)
    }
}
