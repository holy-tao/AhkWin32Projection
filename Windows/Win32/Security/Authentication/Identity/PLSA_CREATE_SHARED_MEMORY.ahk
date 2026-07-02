#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct PLSA_CREATE_SHARED_MEMORY {
    value : IntPtr

    __value {
        set {
            if (value is PLSA_CREATE_SHARED_MEMORY) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Integer} MaxSize 
     * @param {Integer} InitialSize 
     * @returns {Pointer<Void>} 
     */
    Call(MaxSize, InitialSize) {
        result := DllCall(this.value, UInt32, MaxSize, UInt32, InitialSize, IntPtr)
        return result
    }

    /**
     * A PLSA_CREATE_SHARED_MEMORY that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PLSA_CREATE_SHARED_MEMORY {
        /**
         * Creates a PLSA_CREATE_SHARED_MEMORY pointer that invokes the given AHK function when called.
         * @param {Func(UInt32, UInt32) => "ptr"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [UInt32, UInt32, "ptr"])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
