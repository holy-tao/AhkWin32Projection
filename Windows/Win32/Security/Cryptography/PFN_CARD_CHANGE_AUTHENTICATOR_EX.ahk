#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CARD_DATA.ahk" { CARD_DATA }

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct PFN_CARD_CHANGE_AUTHENTICATOR_EX {
    value : IntPtr

    __value {
        set {
            if (value is PFN_CARD_CHANGE_AUTHENTICATOR_EX) {
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
     * @param {Integer} dwFlags 
     * @param {Integer} dwAuthenticatingPinId 
     * @param {Integer} pbAuthenticatingPinData 
     * @param {Integer} cbAuthenticatingPinData 
     * @param {Integer} dwTargetPinId 
     * @param {Integer} pbTargetData 
     * @param {Integer} cbTargetData 
     * @param {Integer} cRetryCount 
     * @param {Pointer<Integer>} pcAttemptsRemaining 
     * @returns {Integer} 
     */
    Call(pCardData, dwFlags, dwAuthenticatingPinId, pbAuthenticatingPinData, cbAuthenticatingPinData, dwTargetPinId, pbTargetData, cbTargetData, cRetryCount, pcAttemptsRemaining) {
        pcAttemptsRemainingMarshal := pcAttemptsRemaining is VarRef ? "uint*" : "ptr"

        result := DllCall(this.value, CARD_DATA.Ptr, pCardData, UInt32, dwFlags, UInt32, dwAuthenticatingPinId, IntPtr, pbAuthenticatingPinData, UInt32, cbAuthenticatingPinData, UInt32, dwTargetPinId, IntPtr, pbTargetData, UInt32, cbTargetData, UInt32, cRetryCount, pcAttemptsRemainingMarshal, pcAttemptsRemaining, UInt32)
        return result
    }

    /**
     * A PFN_CARD_CHANGE_AUTHENTICATOR_EX that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFN_CARD_CHANGE_AUTHENTICATOR_EX {
        /**
         * Creates a PFN_CARD_CHANGE_AUTHENTICATOR_EX pointer that invokes the given AHK function when called.
         * @param {Func(CARD_DATA, UInt32, UInt32, IntPtr, UInt32, UInt32, IntPtr, UInt32, UInt32, "uint*") => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 10)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 10 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [CARD_DATA.Ptr, UInt32, UInt32, IntPtr, UInt32, UInt32, IntPtr, UInt32, UInt32, "uint*", UInt32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
