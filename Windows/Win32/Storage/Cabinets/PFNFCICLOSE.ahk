#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Storage.Cabinets
 */
export default struct PFNFCICLOSE {
    value : IntPtr

    __value {
        set {
            if (value is PFNFCICLOSE) {
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
     * @param {Pointer<Integer>} err 
     * @param {Pointer<Void>} pv 
     * @returns {Integer} 
     */
    Call(hf, err, pv) {
        errMarshal := err is VarRef ? "int*" : "ptr"
        pvMarshal := pv is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, IntPtr, hf, errMarshal, err, pvMarshal, pv, Int32)
        return result
    }

    /**
     * A PFNFCICLOSE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFNFCICLOSE {
        /**
         * Creates a PFNFCICLOSE pointer that invokes the given AHK function when called.
         * @param {Func(IntPtr, "int*", "ptr") => Int32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, "cdecl", [IntPtr, "int*", "ptr", Int32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
