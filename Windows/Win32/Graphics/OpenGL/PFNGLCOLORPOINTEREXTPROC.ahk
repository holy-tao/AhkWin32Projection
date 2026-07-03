#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Graphics.OpenGL
 */
export default struct PFNGLCOLORPOINTEREXTPROC {
    value : IntPtr

    __value {
        set {
            if (value is PFNGLCOLORPOINTEREXTPROC) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Integer} _size 
     * @param {Integer} type 
     * @param {Integer} stride 
     * @param {Integer} count 
     * @param {Pointer<Void>} pointer 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(_size, type, stride, count, pointer) {
        pointerMarshal := pointer is VarRef ? "ptr" : "ptr"

        DllCall(this.value, Int32, _size, UInt32, type, Int32, stride, Int32, count, pointerMarshal, pointer)
    }

    /**
     * A PFNGLCOLORPOINTEREXTPROC that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFNGLCOLORPOINTEREXTPROC {
        /**
         * Creates a PFNGLCOLORPOINTEREXTPROC pointer that invokes the given AHK function when called.
         * @param {Func(Int32, UInt32, Int32, Int32, "ptr") => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 5)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 5 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [Int32, UInt32, Int32, Int32, "ptr", IntPtr])
        }

        __Delete() => CallbackFree(this.value)
    }
}
