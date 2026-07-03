#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\CARD_DATA.ahk" { CARD_DATA }

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct PFN_CARD_AUTHENTICATE_PIN {
    value : IntPtr

    __value {
        set {
            if (value is PFN_CARD_AUTHENTICATE_PIN) {
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
     * @param {PWSTR} pwszUserId 
     * @param {Integer} pbPin 
     * @param {Integer} cbPin 
     * @param {Pointer<Integer>} pcAttemptsRemaining 
     * @returns {Integer} 
     */
    Call(pCardData, pwszUserId, pbPin, cbPin, pcAttemptsRemaining) {
        pwszUserId := pwszUserId is String ? StrPtr(pwszUserId) : pwszUserId

        pcAttemptsRemainingMarshal := pcAttemptsRemaining is VarRef ? "uint*" : "ptr"

        result := DllCall(this.value, CARD_DATA.Ptr, pCardData, "ptr", pwszUserId, IntPtr, pbPin, UInt32, cbPin, pcAttemptsRemainingMarshal, pcAttemptsRemaining, UInt32)
        return result
    }

    /**
     * A PFN_CARD_AUTHENTICATE_PIN that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFN_CARD_AUTHENTICATE_PIN {
        /**
         * Creates a PFN_CARD_AUTHENTICATE_PIN pointer that invokes the given AHK function when called.
         * @param {Func(CARD_DATA, PWSTR, IntPtr, UInt32, "uint*") => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 5)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 5 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [CARD_DATA.Ptr, PWSTR, IntPtr, UInt32, "uint*", UInt32])
        }

        __Delete() => CallbackFree(this.value)
    }
}
