#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.NetShell
 */
export default struct PNS_DLL_INIT_FN {
    value : IntPtr

    __value {
        set {
            if (value is PNS_DLL_INIT_FN) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Integer} dwNetshVersion 
     * @param {Pointer<Void>} pReserved 
     * @returns {Integer} 
     */
    Call(dwNetshVersion, pReserved) {
        pReservedMarshal := pReserved is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, UInt32, dwNetshVersion, pReservedMarshal, pReserved, UInt32)
        return result
    }

    /**
     * A PNS_DLL_INIT_FN that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PNS_DLL_INIT_FN {
        /**
         * Creates a PNS_DLL_INIT_FN pointer that invokes the given AHK function when called.
         * @param {Func(UInt32, "ptr") => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [UInt32, "ptr", UInt32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
