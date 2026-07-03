#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\CARD_DATA.ahk" { CARD_DATA }

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct PFN_CARD_CHANGE_AUTHENTICATOR {
    value : IntPtr

    __value {
        set {
            if (value is PFN_CARD_CHANGE_AUTHENTICATOR) {
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
     * @param {Integer} pbCurrentAuthenticator 
     * @param {Integer} cbCurrentAuthenticator 
     * @param {Integer} pbNewAuthenticator 
     * @param {Integer} cbNewAuthenticator 
     * @param {Integer} cRetryCount 
     * @param {Integer} dwFlags 
     * @param {Pointer<Integer>} pcAttemptsRemaining 
     * @returns {Integer} 
     */
    Call(pCardData, pwszUserId, pbCurrentAuthenticator, cbCurrentAuthenticator, pbNewAuthenticator, cbNewAuthenticator, cRetryCount, dwFlags, pcAttemptsRemaining) {
        pwszUserId := pwszUserId is String ? StrPtr(pwszUserId) : pwszUserId

        pcAttemptsRemainingMarshal := pcAttemptsRemaining is VarRef ? "uint*" : "ptr"

        result := DllCall(this.value, CARD_DATA.Ptr, pCardData, "ptr", pwszUserId, IntPtr, pbCurrentAuthenticator, UInt32, cbCurrentAuthenticator, IntPtr, pbNewAuthenticator, UInt32, cbNewAuthenticator, UInt32, cRetryCount, UInt32, dwFlags, pcAttemptsRemainingMarshal, pcAttemptsRemaining, UInt32)
        return result
    }

    /**
     * A PFN_CARD_CHANGE_AUTHENTICATOR that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFN_CARD_CHANGE_AUTHENTICATOR {
        /**
         * Creates a PFN_CARD_CHANGE_AUTHENTICATOR pointer that invokes the given AHK function when called.
         * @param {Func(CARD_DATA, PWSTR, IntPtr, UInt32, IntPtr, UInt32, UInt32, UInt32, "uint*") => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 9)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 9 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [CARD_DATA.Ptr, PWSTR, IntPtr, UInt32, IntPtr, UInt32, UInt32, UInt32, "uint*", UInt32])
        }

        __Delete() => CallbackFree(this.value)
    }
}
