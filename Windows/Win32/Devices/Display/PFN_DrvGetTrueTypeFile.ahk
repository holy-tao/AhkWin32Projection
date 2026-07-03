#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.Display
 */
export default struct PFN_DrvGetTrueTypeFile {
    value : IntPtr

    __value {
        set {
            if (value is PFN_DrvGetTrueTypeFile) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer} param0 
     * @param {Pointer<Integer>} param1 
     * @returns {Pointer<Void>} 
     */
    Call(param0, param1) {
        param1Marshal := param1 is VarRef ? "uint*" : "ptr"

        result := DllCall(this.value, IntPtr, param0, param1Marshal, param1, IntPtr)
        return result
    }

    /**
     * A PFN_DrvGetTrueTypeFile that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFN_DrvGetTrueTypeFile {
        /**
         * Creates a PFN_DrvGetTrueTypeFile pointer that invokes the given AHK function when called.
         * @param {Func(IntPtr, "uint*") => "ptr"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [IntPtr, "uint*", "ptr"])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
