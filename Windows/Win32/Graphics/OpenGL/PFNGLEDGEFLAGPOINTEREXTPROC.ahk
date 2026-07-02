#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Graphics.OpenGL
 */
export default struct PFNGLEDGEFLAGPOINTEREXTPROC {
    value : IntPtr

    __value {
        set {
            if (value is PFNGLEDGEFLAGPOINTEREXTPROC) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Integer} stride 
     * @param {Integer} count 
     * @param {Pointer<Integer>} pointer 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(stride, count, pointer) {
        pointerMarshal := pointer is VarRef ? "char*" : "ptr"

        DllCall(this.value, Int32, stride, Int32, count, pointerMarshal, pointer)
    }

    /**
     * A PFNGLEDGEFLAGPOINTEREXTPROC that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFNGLEDGEFLAGPOINTEREXTPROC {
        /**
         * Creates a PFNGLEDGEFLAGPOINTEREXTPROC pointer that invokes the given AHK function when called.
         * @param {Func(Int32, Int32, "char*") => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [Int32, Int32, "char*", IntPtr])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
