#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CARD_DATA.ahk" { CARD_DATA }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct PFN_CARD_DEAUTHENTICATE {
    value : IntPtr

    __value {
        set {
            if (value is PFN_CARD_DEAUTHENTICATE) {
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
     * @param {Integer} dwFlags 
     * @returns {Integer} 
     */
    Call(pCardData, pwszUserId, dwFlags) {
        pwszUserId := pwszUserId is String ? StrPtr(pwszUserId) : pwszUserId

        result := DllCall(this.value, CARD_DATA.Ptr, pCardData, "ptr", pwszUserId, UInt32, dwFlags, UInt32)
        return result
    }

    /**
     * A PFN_CARD_DEAUTHENTICATE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFN_CARD_DEAUTHENTICATE {
        /**
         * Creates a PFN_CARD_DEAUTHENTICATE pointer that invokes the given AHK function when called.
         * @param {Func(CARD_DATA, PWSTR, UInt32) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [CARD_DATA.Ptr, PWSTR, UInt32, UInt32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
