#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Graphics.OpenGL
 */
export default struct PFNGLARRAYELEMENTEXTPROC {
    value : IntPtr

    __value {
        set {
            if (value is PFNGLARRAYELEMENTEXTPROC) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Integer} i 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(i) {
        DllCall(this.value, Int32, i)
    }

    /**
     * A PFNGLARRAYELEMENTEXTPROC that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFNGLARRAYELEMENTEXTPROC {
        /**
         * Creates a PFNGLARRAYELEMENTEXTPROC pointer that invokes the given AHK function when called.
         * @param {Func(Int32) => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [Int32, IntPtr])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
