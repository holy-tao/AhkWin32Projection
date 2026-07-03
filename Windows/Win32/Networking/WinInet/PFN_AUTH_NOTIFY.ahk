#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Networking.WinInet
 */
export default struct PFN_AUTH_NOTIFY {
    value : IntPtr

    __value {
        set {
            if (value is PFN_AUTH_NOTIFY) {
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
     * @param {Pointer<Void>} param2 
     * @returns {Integer} 
     */
    Call(param0, param1, param2) {
        param2Marshal := param2 is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, IntPtr, param0, UInt32, param1, param2Marshal, param2, UInt32)
        return result
    }

    /**
     * A PFN_AUTH_NOTIFY that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFN_AUTH_NOTIFY {
        /**
         * Creates a PFN_AUTH_NOTIFY pointer that invokes the given AHK function when called.
         * @param {Func(IntPtr, UInt32, "ptr") => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [IntPtr, UInt32, "ptr", UInt32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
