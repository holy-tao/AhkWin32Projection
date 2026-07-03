#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CARD_DATA.ahk" { CARD_DATA }

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct PFN_CARD_AUTHENTICATE_EX {
    value : IntPtr

    __value {
        set {
            if (value is PFN_CARD_AUTHENTICATE_EX) {
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
     * @param {Integer} PinId 
     * @param {Integer} dwFlags 
     * @param {Integer} pbPinData 
     * @param {Integer} cbPinData 
     * @param {Pointer<Pointer<Integer>>} ppbSessionPin 
     * @param {Pointer<Integer>} pcbSessionPin 
     * @param {Pointer<Integer>} pcAttemptsRemaining 
     * @returns {Integer} 
     */
    Call(pCardData, PinId, dwFlags, pbPinData, cbPinData, ppbSessionPin, pcbSessionPin, pcAttemptsRemaining) {
        ppbSessionPinMarshal := ppbSessionPin is VarRef ? "ptr*" : "ptr"
        pcbSessionPinMarshal := pcbSessionPin is VarRef ? "uint*" : "ptr"
        pcAttemptsRemainingMarshal := pcAttemptsRemaining is VarRef ? "uint*" : "ptr"

        result := DllCall(this.value, CARD_DATA.Ptr, pCardData, UInt32, PinId, UInt32, dwFlags, IntPtr, pbPinData, UInt32, cbPinData, ppbSessionPinMarshal, ppbSessionPin, pcbSessionPinMarshal, pcbSessionPin, pcAttemptsRemainingMarshal, pcAttemptsRemaining, UInt32)
        return result
    }

    /**
     * A PFN_CARD_AUTHENTICATE_EX that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFN_CARD_AUTHENTICATE_EX {
        /**
         * Creates a PFN_CARD_AUTHENTICATE_EX pointer that invokes the given AHK function when called.
         * @param {Func(CARD_DATA, UInt32, UInt32, IntPtr, UInt32, "ptr*", "uint*", "uint*") => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 8)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 8 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [CARD_DATA.Ptr, UInt32, UInt32, IntPtr, UInt32, "ptr*", "uint*", "uint*", UInt32])
        }

        __Delete() => CallbackFree(this.value)
    }
}
