#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Storage.Cabinets
 */
export default struct PFNFCISTATUS {
    value : IntPtr

    __value {
        set {
            if (value is PFNFCISTATUS) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Integer} typeStatus 
     * @param {Integer} cb1 
     * @param {Integer} cb2 
     * @param {Pointer<Void>} pv 
     * @returns {Integer} 
     */
    Call(typeStatus, cb1, cb2, pv) {
        pvMarshal := pv is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, UInt32, typeStatus, UInt32, cb1, UInt32, cb2, pvMarshal, pv, Int32)
        return result
    }

    /**
     * A PFNFCISTATUS that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFNFCISTATUS {
        /**
         * Creates a PFNFCISTATUS pointer that invokes the given AHK function when called.
         * @param {Func(UInt32, UInt32, UInt32, "ptr") => Int32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, "cdecl", [UInt32, UInt32, UInt32, "ptr", Int32])
        }

        __Delete() => CallbackFree(this.value)
    }
}
