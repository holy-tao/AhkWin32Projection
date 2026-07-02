#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Graphics.OpenGL
 */
export default struct GLUtessCombineDataProc {
    value : IntPtr

    __value {
        set {
            if (value is GLUtessCombineDataProc) {
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
     * @param {Pointer<Void>} param4 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(param0, param1, param2, param3, param4) {
        param0Marshal := param0 is VarRef ? "double*" : "ptr"
        param1Marshal := param1 is VarRef ? "ptr*" : "ptr"
        param2Marshal := param2 is VarRef ? "float*" : "ptr"
        param3Marshal := param3 is VarRef ? "ptr*" : "ptr"
        param4Marshal := param4 is VarRef ? "ptr" : "ptr"

        DllCall(this.value, param0Marshal, param0, param1Marshal, param1, param2Marshal, param2, param3Marshal, param3, param4Marshal, param4)
    }

    /**
     * A GLUtessCombineDataProc that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends GLUtessCombineDataProc {
        /**
         * Creates a GLUtessCombineDataProc pointer that invokes the given AHK function when called.
         * @param {Func("double*", "ptr*", "float*", "ptr*", "ptr") => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 5)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 5 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["double*", "ptr*", "float*", "ptr*", "ptr", IntPtr])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
