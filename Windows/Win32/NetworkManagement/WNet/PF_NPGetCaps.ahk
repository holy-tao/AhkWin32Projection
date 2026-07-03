#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.WNet
 */
export default struct PF_NPGetCaps {
    value : IntPtr

    __value {
        set {
            if (value is PF_NPGetCaps) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Integer} ndex 
     * @returns {Integer} 
     */
    Call(ndex) {
        result := DllCall(this.value, UInt32, ndex, UInt32)
        return result
    }

    /**
     * A PF_NPGetCaps that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PF_NPGetCaps {
        /**
         * Creates a PF_NPGetCaps pointer that invokes the given AHK function when called.
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
