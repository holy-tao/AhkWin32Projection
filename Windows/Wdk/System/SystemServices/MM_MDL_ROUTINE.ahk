#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct MM_MDL_ROUTINE {
    value : IntPtr

    __value {
        set {
            if (value is MM_MDL_ROUTINE) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Void>} DriverContext 
     * @param {Pointer<Void>} MappedVa 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(DriverContext, MappedVa) {
        DriverContextMarshal := DriverContext is VarRef ? "ptr" : "ptr"
        MappedVaMarshal := MappedVa is VarRef ? "ptr" : "ptr"

        DllCall(this.value, DriverContextMarshal, DriverContext, MappedVaMarshal, MappedVa)
    }

    /**
     * A MM_MDL_ROUTINE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends MM_MDL_ROUTINE {
        /**
         * Creates a MM_MDL_ROUTINE pointer that invokes the given AHK function when called.
         * @param {Func("ptr", "ptr") => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", "ptr", IntPtr])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
