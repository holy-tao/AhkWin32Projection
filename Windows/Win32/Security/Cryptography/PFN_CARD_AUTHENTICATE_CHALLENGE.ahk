#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CARD_DATA.ahk" { CARD_DATA }

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct PFN_CARD_AUTHENTICATE_CHALLENGE {
    value : IntPtr

    __value {
        set {
            if (value is PFN_CARD_AUTHENTICATE_CHALLENGE) {
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
     * @param {Integer} pbResponseData 
     * @param {Integer} cbResponseData 
     * @param {Pointer<Integer>} pcAttemptsRemaining 
     * @returns {Integer} 
     */
    Call(pCardData, pbResponseData, cbResponseData, pcAttemptsRemaining) {
        pcAttemptsRemainingMarshal := pcAttemptsRemaining is VarRef ? "uint*" : "ptr"

        result := DllCall(this.value, CARD_DATA.Ptr, pCardData, IntPtr, pbResponseData, UInt32, cbResponseData, pcAttemptsRemainingMarshal, pcAttemptsRemaining, UInt32)
        return result
    }

    /**
     * A PFN_CARD_AUTHENTICATE_CHALLENGE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFN_CARD_AUTHENTICATE_CHALLENGE {
        /**
         * Creates a PFN_CARD_AUTHENTICATE_CHALLENGE pointer that invokes the given AHK function when called.
         * @param {Func(CARD_DATA, IntPtr, UInt32, "uint*") => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [CARD_DATA.Ptr, IntPtr, UInt32, "uint*", UInt32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
