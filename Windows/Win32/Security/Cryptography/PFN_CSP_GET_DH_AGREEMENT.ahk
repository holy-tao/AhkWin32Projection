#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CARD_DATA.ahk" { CARD_DATA }

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct PFN_CSP_GET_DH_AGREEMENT {
    value : IntPtr

    __value {
        set {
            if (value is PFN_CSP_GET_DH_AGREEMENT) {
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
     * @param {Pointer<Void>} hSecretAgreement 
     * @param {Pointer<Integer>} pbSecretAgreementIndex 
     * @param {Integer} dwFlags 
     * @returns {Integer} 
     */
    Call(pCardData, hSecretAgreement, pbSecretAgreementIndex, dwFlags) {
        hSecretAgreementMarshal := hSecretAgreement is VarRef ? "ptr" : "ptr"
        pbSecretAgreementIndexMarshal := pbSecretAgreementIndex is VarRef ? "char*" : "ptr"

        result := DllCall(this.value, CARD_DATA.Ptr, pCardData, hSecretAgreementMarshal, hSecretAgreement, pbSecretAgreementIndexMarshal, pbSecretAgreementIndex, UInt32, dwFlags, UInt32)
        return result
    }

    /**
     * A PFN_CSP_GET_DH_AGREEMENT that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFN_CSP_GET_DH_AGREEMENT {
        /**
         * Creates a PFN_CSP_GET_DH_AGREEMENT pointer that invokes the given AHK function when called.
         * @param {Func(CARD_DATA, "ptr", "char*", UInt32) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [CARD_DATA.Ptr, "ptr", "char*", UInt32, UInt32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
