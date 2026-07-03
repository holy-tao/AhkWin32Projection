#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Security.WinTrust
 */
export default struct PFN_CPD_MEM_FREE {
    value : IntPtr

    __value {
        set {
            if (value is PFN_CPD_MEM_FREE) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Void>} pvMem2Free 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(pvMem2Free) {
        pvMem2FreeMarshal := pvMem2Free is VarRef ? "ptr" : "ptr"

        DllCall(this.value, pvMem2FreeMarshal, pvMem2Free)
    }

    /**
     * A PFN_CPD_MEM_FREE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFN_CPD_MEM_FREE {
        /**
         * Creates a PFN_CPD_MEM_FREE pointer that invokes the given AHK function when called.
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
