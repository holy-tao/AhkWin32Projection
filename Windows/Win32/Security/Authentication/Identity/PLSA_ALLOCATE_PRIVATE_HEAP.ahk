#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct PLSA_ALLOCATE_PRIVATE_HEAP {
    value : IntPtr

    __value {
        set {
            if (value is PLSA_ALLOCATE_PRIVATE_HEAP) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer} Length 
     * @returns {Pointer<Void>} 
     */
    Call(Length) {
        result := DllCall(this.value, IntPtr, Length, IntPtr)
        return result
    }

    /**
     * A PLSA_ALLOCATE_PRIVATE_HEAP that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PLSA_ALLOCATE_PRIVATE_HEAP {
        /**
         * Creates a PLSA_ALLOCATE_PRIVATE_HEAP pointer that invokes the given AHK function when called.
         * @param {Func(IntPtr) => "ptr"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [IntPtr, "ptr"])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
