#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Storage.Cabinets
 */
export default struct PFNFCISEEK {
    value : IntPtr

    __value {
        set {
            if (value is PFNFCISEEK) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer} hf 
     * @param {Integer} dist 
     * @param {Integer} seektype 
     * @param {Pointer<Integer>} err 
     * @param {Pointer<Void>} pv 
     * @returns {Integer} 
     */
    Call(hf, dist, seektype, err, pv) {
        errMarshal := err is VarRef ? "int*" : "ptr"
        pvMarshal := pv is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, IntPtr, hf, Int32, dist, Int32, seektype, errMarshal, err, pvMarshal, pv, Int32)
        return result
    }

    /**
     * A PFNFCISEEK that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFNFCISEEK {
        /**
         * Creates a PFNFCISEEK pointer that invokes the given AHK function when called.
         * @param {Func(IntPtr, Int32, Int32, "int*", "ptr") => Int32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 5)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 5 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, "cdecl", [IntPtr, Int32, Int32, "int*", "ptr", Int32])
        }

        __Delete() => CallbackFree(this.value)
    }
}
