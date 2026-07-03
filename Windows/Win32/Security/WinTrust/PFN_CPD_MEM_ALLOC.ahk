#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Security.WinTrust
 */
export default struct PFN_CPD_MEM_ALLOC {
    value : IntPtr

    __value {
        set {
            if (value is PFN_CPD_MEM_ALLOC) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Integer} cbSize 
     * @returns {Pointer<Void>} 
     */
    Call(cbSize) {
        result := DllCall(this.value, UInt32, cbSize, IntPtr)
        return result
    }

    /**
     * A PFN_CPD_MEM_ALLOC that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFN_CPD_MEM_ALLOC {
        /**
         * Creates a PFN_CPD_MEM_ALLOC pointer that invokes the given AHK function when called.
         * @param {Func(UInt32) => "ptr"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [UInt32, "ptr"])
        }

        __Delete() => CallbackFree(this.value)
    }
}
