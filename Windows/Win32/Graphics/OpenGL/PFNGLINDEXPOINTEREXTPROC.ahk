#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Graphics.OpenGL
 */
export default struct PFNGLINDEXPOINTEREXTPROC {
    value : IntPtr

    __value {
        set {
            if (value is PFNGLINDEXPOINTEREXTPROC) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Integer} type 
     * @param {Integer} stride 
     * @param {Integer} count 
     * @param {Pointer<Void>} pointer 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(type, stride, count, pointer) {
        pointerMarshal := pointer is VarRef ? "ptr" : "ptr"

        DllCall(this.value, UInt32, type, Int32, stride, Int32, count, pointerMarshal, pointer)
    }

    /**
     * A PFNGLINDEXPOINTEREXTPROC that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFNGLINDEXPOINTEREXTPROC {
        /**
         * Creates a PFNGLINDEXPOINTEREXTPROC pointer that invokes the given AHK function when called.
         * @param {Func(UInt32, Int32, Int32, "ptr") => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [UInt32, Int32, Int32, "ptr", IntPtr])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
