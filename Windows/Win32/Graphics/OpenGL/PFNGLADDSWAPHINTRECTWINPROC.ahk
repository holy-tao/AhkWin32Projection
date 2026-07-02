#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Graphics.OpenGL
 */
export default struct PFNGLADDSWAPHINTRECTWINPROC {
    value : IntPtr

    __value {
        set {
            if (value is PFNGLADDSWAPHINTRECTWINPROC) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Integer} x 
     * @param {Integer} y 
     * @param {Integer} width 
     * @param {Integer} height 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(x, y, width, height) {
        DllCall(this.value, Int32, x, Int32, y, Int32, width, Int32, height)
    }

    /**
     * A PFNGLADDSWAPHINTRECTWINPROC that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFNGLADDSWAPHINTRECTWINPROC {
        /**
         * Creates a PFNGLADDSWAPHINTRECTWINPROC pointer that invokes the given AHK function when called.
         * @param {Func(Int32, Int32, Int32, Int32) => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [Int32, Int32, Int32, Int32, IntPtr])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
