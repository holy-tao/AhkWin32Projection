#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.Display
 */
export default struct PFN_DrvQueryFontFile {
    value : IntPtr

    __value {
        set {
            if (value is PFN_DrvQueryFontFile) {
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
     * @param {Integer} param1 
     * @param {Integer} param2 
     * @param {Pointer<Integer>} param3 
     * @returns {Integer} 
     */
    Call(param0, param1, param2, param3) {
        param3Marshal := param3 is VarRef ? "uint*" : "ptr"

        result := DllCall(this.value, IntPtr, param0, UInt32, param1, UInt32, param2, param3Marshal, param3, Int32)
        return result
    }

    /**
     * A PFN_DrvQueryFontFile that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFN_DrvQueryFontFile {
        /**
         * Creates a PFN_DrvQueryFontFile pointer that invokes the given AHK function when called.
         * @param {Func(IntPtr, UInt32, UInt32, "uint*") => Int32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [IntPtr, UInt32, UInt32, "uint*", Int32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
