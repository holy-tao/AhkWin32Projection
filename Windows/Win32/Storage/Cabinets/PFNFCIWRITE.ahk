#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Storage.Cabinets
 */
export default struct PFNFCIWRITE {
    value : IntPtr

    __value {
        set {
            if (value is PFNFCIWRITE) {
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
     * @param {Pointer<Void>} memory 
     * @param {Integer} cb 
     * @param {Pointer<Integer>} err 
     * @param {Pointer<Void>} pv 
     * @returns {Integer} 
     */
    Call(hf, memory, cb, err, pv) {
        memoryMarshal := memory is VarRef ? "ptr" : "ptr"
        errMarshal := err is VarRef ? "int*" : "ptr"
        pvMarshal := pv is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, IntPtr, hf, memoryMarshal, memory, UInt32, cb, errMarshal, err, pvMarshal, pv, UInt32)
        return result
    }

    /**
     * A PFNFCIWRITE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFNFCIWRITE {
        /**
         * Creates a PFNFCIWRITE pointer that invokes the given AHK function when called.
         * @param {Func(IntPtr, "ptr", UInt32, "int*", "ptr") => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 5)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 5 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, "cdecl", [IntPtr, "ptr", UInt32, "int*", "ptr", UInt32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
