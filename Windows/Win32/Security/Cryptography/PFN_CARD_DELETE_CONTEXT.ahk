#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CARD_DATA.ahk" { CARD_DATA }

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct PFN_CARD_DELETE_CONTEXT {
    value : IntPtr

    __value {
        set {
            if (value is PFN_CARD_DELETE_CONTEXT) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<CARD_DATA>} pCardData 
     * @returns {Integer} 
     */
    Call(pCardData) {
        result := DllCall(this.value, CARD_DATA.Ptr, pCardData, UInt32)
        return result
    }

    /**
     * A PFN_CARD_DELETE_CONTEXT that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFN_CARD_DELETE_CONTEXT {
        /**
         * Creates a PFN_CARD_DELETE_CONTEXT pointer that invokes the given AHK function when called.
         * @param {Func(CARD_DATA) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [CARD_DATA.Ptr, UInt32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
