#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Graphics.OpenGL
 */
export default struct PFNGLDRAWRANGEELEMENTSWINPROC {
    value : IntPtr

    __value {
        set {
            if (value is PFNGLDRAWRANGEELEMENTSWINPROC) {
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
     * @param {Integer} start 
     * @param {Integer} end 
     * @param {Integer} count 
     * @param {Integer} type 
     * @param {Pointer<Void>} indices 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(_mode, start, end, count, type, indices) {
        indicesMarshal := indices is VarRef ? "ptr" : "ptr"

        DllCall(this.value, UInt32, _mode, UInt32, start, UInt32, end, Int32, count, UInt32, type, indicesMarshal, indices)
    }

    /**
     * A PFNGLDRAWRANGEELEMENTSWINPROC that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFNGLDRAWRANGEELEMENTSWINPROC {
        /**
         * Creates a PFNGLDRAWRANGEELEMENTSWINPROC pointer that invokes the given AHK function when called.
         * @param {Func(UInt32, UInt32, UInt32, Int32, UInt32, "ptr") => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 6)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 6 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [UInt32, UInt32, UInt32, Int32, UInt32, "ptr", IntPtr])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
