#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Graphics.OpenGL
 */
export default struct PFNGLDRAWARRAYSEXTPROC {
    value : IntPtr

    __value {
        set {
            if (value is PFNGLDRAWARRAYSEXTPROC) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Integer} _mode 
     * @param {Integer} first 
     * @param {Integer} count 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(_mode, first, count) {
        DllCall(this.value, UInt32, _mode, Int32, first, Int32, count)
    }

    /**
     * A PFNGLDRAWARRAYSEXTPROC that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFNGLDRAWARRAYSEXTPROC {
        /**
         * Creates a PFNGLDRAWARRAYSEXTPROC pointer that invokes the given AHK function when called.
         * @param {Func(UInt32, Int32, Int32) => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [UInt32, Int32, Int32, IntPtr])
        }

        __Delete() => CallbackFree(this.value)
    }
}
