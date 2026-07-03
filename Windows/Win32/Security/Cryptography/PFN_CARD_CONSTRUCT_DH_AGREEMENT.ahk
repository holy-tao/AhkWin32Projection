#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CARD_DATA.ahk" { CARD_DATA }
#Import ".\CARD_DH_AGREEMENT_INFO.ahk" { CARD_DH_AGREEMENT_INFO }

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct PFN_CARD_CONSTRUCT_DH_AGREEMENT {
    value : IntPtr

    __value {
        set {
            if (value is PFN_CARD_CONSTRUCT_DH_AGREEMENT) {
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
     * @param {Pointer<CARD_DH_AGREEMENT_INFO>} pAgreementInfo 
     * @returns {Integer} 
     */
    Call(pCardData, pAgreementInfo) {
        result := DllCall(this.value, CARD_DATA.Ptr, pCardData, CARD_DH_AGREEMENT_INFO.Ptr, pAgreementInfo, UInt32)
        return result
    }

    /**
     * A PFN_CARD_CONSTRUCT_DH_AGREEMENT that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFN_CARD_CONSTRUCT_DH_AGREEMENT {
        /**
         * Creates a PFN_CARD_CONSTRUCT_DH_AGREEMENT pointer that invokes the given AHK function when called.
         * @param {Func(CARD_DATA, CARD_DH_AGREEMENT_INFO) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [CARD_DATA.Ptr, CARD_DH_AGREEMENT_INFO.Ptr, UInt32])
        }

        __Delete() => CallbackFree(this.value)
    }
}
