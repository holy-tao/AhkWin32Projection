#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Graphics.OpenGL
 */
export default struct PFNGLGETCOLORTABLEPARAMETERFVEXTPROC {
    value : IntPtr

    __value {
        set {
            if (value is PFNGLGETCOLORTABLEPARAMETERFVEXTPROC) {
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
     * @param {Pointer<Float>} params 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(target, pname, params) {
        paramsMarshal := params is VarRef ? "float*" : "ptr"

        DllCall(this.value, UInt32, target, UInt32, pname, paramsMarshal, params)
    }

    /**
     * A PFNGLGETCOLORTABLEPARAMETERFVEXTPROC that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFNGLGETCOLORTABLEPARAMETERFVEXTPROC {
        /**
         * Creates a PFNGLGETCOLORTABLEPARAMETERFVEXTPROC pointer that invokes the given AHK function when called.
         * @param {Func(UInt32, UInt32, "float*") => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [UInt32, UInt32, "float*", IntPtr])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
