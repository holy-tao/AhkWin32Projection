#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct PLSA_PROTECT_MEMORY {
    value : IntPtr

    __value {
        set {
            if (value is PLSA_PROTECT_MEMORY) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Integer} _Buffer 
     * @param {Integer} BufferSize 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(_Buffer, BufferSize) {
        DllCall(this.value, IntPtr, _Buffer, UInt32, BufferSize)
    }

    /**
     * A PLSA_PROTECT_MEMORY that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PLSA_PROTECT_MEMORY {
        /**
         * Creates a PLSA_PROTECT_MEMORY pointer that invokes the given AHK function when called.
         * @param {Func(IntPtr, UInt32) => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [IntPtr, UInt32, IntPtr])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
