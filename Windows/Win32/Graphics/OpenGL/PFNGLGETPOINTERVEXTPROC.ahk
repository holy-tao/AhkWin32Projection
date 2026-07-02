#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Graphics.OpenGL
 */
export default struct PFNGLGETPOINTERVEXTPROC {
    value : IntPtr

    __value {
        set {
            if (value is PFNGLGETPOINTERVEXTPROC) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Integer} pname 
     * @param {Pointer<Pointer<Void>>} params 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(pname, params) {
        paramsMarshal := params is VarRef ? "ptr*" : "ptr"

        DllCall(this.value, UInt32, pname, paramsMarshal, params)
    }

    /**
     * A PFNGLGETPOINTERVEXTPROC that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFNGLGETPOINTERVEXTPROC {
        /**
         * Creates a PFNGLGETPOINTERVEXTPROC pointer that invokes the given AHK function when called.
         * @param {Func(UInt32, "ptr*") => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [UInt32, "ptr*", IntPtr])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
