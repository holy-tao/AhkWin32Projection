#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.Display
 */
export default struct PFN_DrvFree {
    value : IntPtr

    __value {
        set {
            if (value is PFN_DrvFree) {
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
     * @param {Pointer} param1 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(param0, param1) {
        param0Marshal := param0 is VarRef ? "ptr" : "ptr"

        DllCall(this.value, param0Marshal, param0, IntPtr, param1)
    }

    /**
     * A PFN_DrvFree that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFN_DrvFree {
        /**
         * Creates a PFN_DrvFree pointer that invokes the given AHK function when called.
         * @param {Func("ptr", IntPtr) => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", IntPtr, IntPtr])
        }

        __Delete() => CallbackFree(this.value)
    }
}
