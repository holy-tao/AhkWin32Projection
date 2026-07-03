#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Graphics.Gdi
 */
export default struct READEMBEDPROC {
    value : IntPtr

    __value {
        set {
            if (value is READEMBEDPROC) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Void>} param0 
     * @param {Pointer<Void>} param1 
     * @param {Integer} param2 
     * @returns {Integer} 
     */
    Call(param0, param1, param2) {
        param0Marshal := param0 is VarRef ? "ptr" : "ptr"
        param1Marshal := param1 is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, param0Marshal, param0, param1Marshal, param1, UInt32, param2, UInt32)
        return result
    }

    /**
     * A READEMBEDPROC that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends READEMBEDPROC {
        /**
         * Creates a READEMBEDPROC pointer that invokes the given AHK function when called.
         * @param {Func("ptr", "ptr", UInt32) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, "cdecl", ["ptr", "ptr", UInt32, UInt32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
