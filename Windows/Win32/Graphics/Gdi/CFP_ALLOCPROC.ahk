#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Client-provided callback function, used by CreateFontPackage and MergeFontPackage to allocate memory.
 * @remarks
 * <a href="https://docs.microsoft.com/previous-versions/visualstudio/visual-studio-2010/6ewkz86d(v=vs.100)">malloc</a> conforms to this type; the application can either use <b>malloc</b> or a more specialized function for memory allocation. Whatever function is chosen, there must also be appropriate functions to reallocate and to free this memory.
 * @see https://learn.microsoft.com/windows/win32/api/fontsub/nc-fontsub-cfp_allocproc
 * @namespace Windows.Win32.Graphics.Gdi
 */
export default struct CFP_ALLOCPROC {
    value : IntPtr

    __value {
        set {
            if (value is CFP_ALLOCPROC) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer} param0 Number of bytes to allocate.
     * @returns {Pointer<Void>} Returns a void pointer to the allocated space, or <b>NULL</b> if there is insufficient memory available.
     */
    Call(param0) {
        result := DllCall(this.value, IntPtr, param0, IntPtr)
        return result
    }

    /**
     * A CFP_ALLOCPROC that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends CFP_ALLOCPROC {
        /**
         * Creates a CFP_ALLOCPROC pointer that invokes the given AHK function when called.
         * @param {Func(IntPtr) => "ptr"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, "cdecl", [IntPtr, "ptr"])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
