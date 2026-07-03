#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Client-provided callback function, used by CreateFontPackage and MergeFontPackage to reallocate memory when the size of an allocated buffer needs to change.
 * @remarks
 * <a href="https://docs.microsoft.com/previous-versions/visualstudio/visual-studio-2010/xbebcx7d(v=vs.100)">realloc</a> conforms to this type; the application can either use <b>realloc</b> or a more specialized function for memory reallocation. Whatever function is chosen, there must also be appropriate functions for initial allocation and to free this memory.
 * @see https://learn.microsoft.com/windows/win32/api/fontsub/nc-fontsub-cfp_reallocproc
 * @namespace Windows.Win32.Graphics.Gdi
 */
export default struct CFP_REALLOCPROC {
    value : IntPtr

    __value {
        set {
            if (value is CFP_REALLOCPROC) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Void>} param0 Pointer to previously allocated memory block.
     * @param {Pointer} param1 New size in bytes.
     * @returns {Pointer<Void>} Returns a void pointer to the reallocated (and possibly moved) memory block. The return value should be <b>NULL</b> if the size is zero and the <i>memblock</i> argument is not <b>NULL</b>, or if there is not enough available memory to expand the block to the given size. In the first case, the original block should be freed. In the second, the original block should be unchanged.
     */
    Call(param0, param1) {
        param0Marshal := param0 is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, param0Marshal, param0, IntPtr, param1, IntPtr)
        return result
    }

    /**
     * A CFP_REALLOCPROC that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends CFP_REALLOCPROC {
        /**
         * Creates a CFP_REALLOCPROC pointer that invokes the given AHK function when called.
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
