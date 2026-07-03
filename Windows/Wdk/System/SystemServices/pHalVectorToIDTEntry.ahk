#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct pHalVectorToIDTEntry {
    value : IntPtr

    __value {
        set {
            if (value is pHalVectorToIDTEntry) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Integer} Vector 
     * @returns {Integer} 
     */
    Call(Vector) {
        result := DllCall(this.value, UInt32, Vector, Int8)
        return result
    }

    /**
     * A pHalVectorToIDTEntry that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends pHalVectorToIDTEntry {
        /**
         * Creates a pHalVectorToIDTEntry pointer that invokes the given AHK function when called.
         * @param {Func(UInt32) => Int8} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [UInt32, Int8])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
