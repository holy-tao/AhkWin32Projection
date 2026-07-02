#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Graphics.OpenGL
 */
export default struct GLUtessCombineProc {
    value : IntPtr

    __value {
        set {
            if (value is GLUtessCombineProc) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Float>} param0 
     * @param {Pointer<Pointer<Void>>} param1 
     * @param {Pointer<Float>} param2 
     * @param {Pointer<Pointer<Void>>} param3 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(param0, param1, param2, param3) {
        param0Marshal := param0 is VarRef ? "double*" : "ptr"
        param1Marshal := param1 is VarRef ? "ptr*" : "ptr"
        param2Marshal := param2 is VarRef ? "float*" : "ptr"
        param3Marshal := param3 is VarRef ? "ptr*" : "ptr"

        DllCall(this.value, param0Marshal, param0, param1Marshal, param1, param2Marshal, param2, param3Marshal, param3)
    }

    /**
     * A GLUtessCombineProc that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends GLUtessCombineProc {
        /**
         * Creates a GLUtessCombineProc pointer that invokes the given AHK function when called.
         * @param {Func("double*", "ptr*", "float*", "ptr*") => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["double*", "ptr*", "float*", "ptr*", IntPtr])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
