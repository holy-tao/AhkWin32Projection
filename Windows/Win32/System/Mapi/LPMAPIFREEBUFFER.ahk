#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Mapi
 */
export default struct LPMAPIFREEBUFFER {
    value : IntPtr

    __value {
        set {
            if (value is LPMAPIFREEBUFFER) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Void>} pv 
     * @returns {Integer} 
     */
    Call(pv) {
        pvMarshal := pv is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, pvMarshal, pv, UInt32)
        return result
    }

    /**
     * A LPMAPIFREEBUFFER that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends LPMAPIFREEBUFFER {
        /**
         * Creates a LPMAPIFREEBUFFER pointer that invokes the given AHK function when called.
         * @param {Func("ptr") => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", UInt32])
        }

        __Delete() => CallbackFree(this.value)
    }
}
