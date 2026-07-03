#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct PKSEC_LOCATE_PKG_BY_ID {
    value : IntPtr

    __value {
        set {
            if (value is PKSEC_LOCATE_PKG_BY_ID) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Integer} PackageId 
     * @returns {Pointer<Void>} 
     */
    Call(PackageId) {
        result := DllCall(this.value, UInt32, PackageId, IntPtr)
        return result
    }

    /**
     * A PKSEC_LOCATE_PKG_BY_ID that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PKSEC_LOCATE_PKG_BY_ID {
        /**
         * Creates a PKSEC_LOCATE_PKG_BY_ID pointer that invokes the given AHK function when called.
         * @param {Func(UInt32) => "ptr"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [UInt32, "ptr"])
        }

        __Delete() => CallbackFree(this.value)
    }
}
