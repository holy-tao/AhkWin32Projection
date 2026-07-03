#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Graphics.OpenGL
 */
export default struct GLUtessEdgeFlagDataProc {
    value : IntPtr

    __value {
        set {
            if (value is GLUtessEdgeFlagDataProc) {
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
     * @param {Pointer<Void>} param1 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(param0, param1) {
        param1Marshal := param1 is VarRef ? "ptr" : "ptr"

        DllCall(this.value, Int8, param0, param1Marshal, param1)
    }

    /**
     * A GLUtessEdgeFlagDataProc that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends GLUtessEdgeFlagDataProc {
        /**
         * Creates a GLUtessEdgeFlagDataProc pointer that invokes the given AHK function when called.
         * @param {Func(Int8, "ptr") => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [Int8, "ptr", IntPtr])
        }

        __Delete() => CallbackFree(this.value)
    }
}
