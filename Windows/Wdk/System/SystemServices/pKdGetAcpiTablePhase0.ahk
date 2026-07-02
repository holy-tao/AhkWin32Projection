#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct pKdGetAcpiTablePhase0 {
    value : IntPtr

    __value {
        set {
            if (value is pKdGetAcpiTablePhase0) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Pointer>} LoaderBlock 
     * @param {Integer} Signature 
     * @returns {Pointer<Void>} 
     */
    Call(LoaderBlock, Signature) {
        LoaderBlockMarshal := LoaderBlock is VarRef ? "ptr*" : "ptr"

        result := DllCall(this.value, LoaderBlockMarshal, LoaderBlock, UInt32, Signature, IntPtr)
        return result
    }

    /**
     * A pKdGetAcpiTablePhase0 that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends pKdGetAcpiTablePhase0 {
        /**
         * Creates a pKdGetAcpiTablePhase0 pointer that invokes the given AHK function when called.
         * @param {Func("ptr*", UInt32) => "ptr"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr*", UInt32, "ptr"])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
