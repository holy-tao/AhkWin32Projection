#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Graphics.Direct3D
 */
export default struct PFN_DESTRUCTION_CALLBACK {
    value : IntPtr

    __value {
        set {
            if (value is PFN_DESTRUCTION_CALLBACK) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Void>} pData 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(pData) {
        pDataMarshal := pData is VarRef ? "ptr" : "ptr"

        DllCall(this.value, pDataMarshal, pData)
    }

    /**
     * A PFN_DESTRUCTION_CALLBACK that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFN_DESTRUCTION_CALLBACK {
        /**
         * Creates a PFN_DESTRUCTION_CALLBACK pointer that invokes the given AHK function when called.
         * @param {Func("ptr") => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", IntPtr])
        }

        __Delete() => CallbackFree(this.value)
    }
}
