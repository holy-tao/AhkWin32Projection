#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Graphics.OpenGL
 */
export default struct PFNGLGETCOLORTABLEPARAMETERIVEXTPROC {
    value : IntPtr

    __value {
        set {
            if (value is PFNGLGETCOLORTABLEPARAMETERIVEXTPROC) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Integer} target 
     * @param {Integer} pname 
     * @param {Pointer<Integer>} params 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(target, pname, params) {
        paramsMarshal := params is VarRef ? "int*" : "ptr"

        DllCall(this.value, UInt32, target, UInt32, pname, paramsMarshal, params)
    }

    /**
     * A PFNGLGETCOLORTABLEPARAMETERIVEXTPROC that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFNGLGETCOLORTABLEPARAMETERIVEXTPROC {
        /**
         * Creates a PFNGLGETCOLORTABLEPARAMETERIVEXTPROC pointer that invokes the given AHK function when called.
         * @param {Func(UInt32, UInt32, "int*") => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [UInt32, UInt32, "int*", IntPtr])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
