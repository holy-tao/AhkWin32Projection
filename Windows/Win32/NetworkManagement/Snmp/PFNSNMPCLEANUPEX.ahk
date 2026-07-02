#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.Snmp
 */
export default struct PFNSNMPCLEANUPEX {
    value : IntPtr

    __value {
        set {
            if (value is PFNSNMPCLEANUPEX) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @returns {Integer} 
     */
    Call() {
        result := DllCall(this.value, UInt32)
        return result
    }

    /**
     * A PFNSNMPCLEANUPEX that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFNSNMPCLEANUPEX {
        /**
         * Creates a PFNSNMPCLEANUPEX pointer that invokes the given AHK function when called.
         * @param {Func() => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 0)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 0 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [UInt32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
