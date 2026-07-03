#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Storage.Cabinets
 */
export default struct PFNFREE {
    value : IntPtr

    __value {
        set {
            if (value is PFNFREE) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Void>} pv 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(pv) {
        pvMarshal := pv is VarRef ? "ptr" : "ptr"

        DllCall(this.value, pvMarshal, pv)
    }

    /**
     * A PFNFREE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFNFREE {
        /**
         * Creates a PFNFREE pointer that invokes the given AHK function when called.
         * @param {Func("ptr") => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, "cdecl", ["ptr", IntPtr])
        }

        __Delete() => CallbackFree(this.value)
    }
}
