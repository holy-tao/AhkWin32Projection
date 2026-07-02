#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CARD_DATA.ahk" { CARD_DATA }
#Import ".\CARD_DERIVE_KEY.ahk" { CARD_DERIVE_KEY }

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct PFN_CARD_DERIVE_KEY {
    value : IntPtr

    __value {
        set {
            if (value is PFN_CARD_DERIVE_KEY) {
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
     * @param {Pointer<CARD_DERIVE_KEY>} pAgreementInfo 
     * @returns {Integer} 
     */
    Call(pCardData, pAgreementInfo) {
        result := DllCall(this.value, CARD_DATA.Ptr, pCardData, CARD_DERIVE_KEY.Ptr, pAgreementInfo, UInt32)
        return result
    }

    /**
     * A PFN_CARD_DERIVE_KEY that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFN_CARD_DERIVE_KEY {
        /**
         * Creates a PFN_CARD_DERIVE_KEY pointer that invokes the given AHK function when called.
         * @param {Func(CARD_DATA, CARD_DERIVE_KEY) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [CARD_DATA.Ptr, CARD_DERIVE_KEY.Ptr, UInt32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
