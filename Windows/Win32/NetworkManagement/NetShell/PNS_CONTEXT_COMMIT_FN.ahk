#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.NetShell
 */
export default struct PNS_CONTEXT_COMMIT_FN {
    value : IntPtr

    __value {
        set {
            if (value is PNS_CONTEXT_COMMIT_FN) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Integer} dwAction 
     * @returns {Integer} 
     */
    Call(dwAction) {
        result := DllCall(this.value, UInt32, dwAction, UInt32)
        return result
    }

    /**
     * A PNS_CONTEXT_COMMIT_FN that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PNS_CONTEXT_COMMIT_FN {
        /**
         * Creates a PNS_CONTEXT_COMMIT_FN pointer that invokes the given AHK function when called.
         * @param {Func(UInt32) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [UInt32, UInt32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
