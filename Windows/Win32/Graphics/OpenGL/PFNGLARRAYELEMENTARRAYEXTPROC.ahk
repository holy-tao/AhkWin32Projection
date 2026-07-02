#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Graphics.OpenGL
 */
export default struct PFNGLARRAYELEMENTARRAYEXTPROC {
    value : IntPtr

    __value {
        set {
            if (value is PFNGLARRAYELEMENTARRAYEXTPROC) {
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
     * @param {Integer} count 
     * @param {Pointer<Void>} pi 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(_mode, count, pi) {
        piMarshal := pi is VarRef ? "ptr" : "ptr"

        DllCall(this.value, UInt32, _mode, Int32, count, piMarshal, pi)
    }

    /**
     * A PFNGLARRAYELEMENTARRAYEXTPROC that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFNGLARRAYELEMENTARRAYEXTPROC {
        /**
         * Creates a PFNGLARRAYELEMENTARRAYEXTPROC pointer that invokes the given AHK function when called.
         * @param {Func(UInt32, Int32, "ptr") => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [UInt32, Int32, "ptr", IntPtr])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
