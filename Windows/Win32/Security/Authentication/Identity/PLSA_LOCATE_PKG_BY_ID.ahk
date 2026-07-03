#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct PLSA_LOCATE_PKG_BY_ID {
    value : IntPtr

    __value {
        set {
            if (value is PLSA_LOCATE_PKG_BY_ID) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Integer} PackgeId 
     * @returns {Pointer<Void>} 
     */
    Call(PackgeId) {
        result := DllCall(this.value, UInt32, PackgeId, IntPtr)
        return result
    }

    /**
     * A PLSA_LOCATE_PKG_BY_ID that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PLSA_LOCATE_PKG_BY_ID {
        /**
         * Creates a PLSA_LOCATE_PKG_BY_ID pointer that invokes the given AHK function when called.
         * @param {Func(UInt32) => "ptr"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [UInt32, "ptr"])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
