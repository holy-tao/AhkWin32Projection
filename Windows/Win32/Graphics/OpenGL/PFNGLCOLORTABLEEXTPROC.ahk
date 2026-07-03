#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Graphics.OpenGL
 */
export default struct PFNGLCOLORTABLEEXTPROC {
    value : IntPtr

    __value {
        set {
            if (value is PFNGLCOLORTABLEEXTPROC) {
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
     * @param {Integer} internalFormat 
     * @param {Integer} width 
     * @param {Integer} format 
     * @param {Integer} type 
     * @param {Pointer<Void>} data 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(target, internalFormat, width, format, type, data) {
        dataMarshal := data is VarRef ? "ptr" : "ptr"

        DllCall(this.value, UInt32, target, UInt32, internalFormat, Int32, width, UInt32, format, UInt32, type, dataMarshal, data)
    }

    /**
     * A PFNGLCOLORTABLEEXTPROC that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFNGLCOLORTABLEEXTPROC {
        /**
         * Creates a PFNGLCOLORTABLEEXTPROC pointer that invokes the given AHK function when called.
         * @param {Func(UInt32, UInt32, Int32, UInt32, UInt32, "ptr") => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 6)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 6 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [UInt32, UInt32, Int32, UInt32, UInt32, "ptr", IntPtr])
        }

        __Delete() => CallbackFree(this.value)
    }
}
