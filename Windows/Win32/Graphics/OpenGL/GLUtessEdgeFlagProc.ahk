#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Graphics.OpenGL
 */
export default struct GLUtessEdgeFlagProc {
    value : IntPtr

    __value {
        set {
            if (value is GLUtessEdgeFlagProc) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Integer} param0 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(param0) {
        DllCall(this.value, Int8, param0)
    }

    /**
     * A GLUtessEdgeFlagProc that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends GLUtessEdgeFlagProc {
        /**
         * Creates a GLUtessEdgeFlagProc pointer that invokes the given AHK function when called.
         * @param {Func(Int8) => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [Int8, IntPtr])
        }

        __Delete() => CallbackFree(this.value)
    }
}
