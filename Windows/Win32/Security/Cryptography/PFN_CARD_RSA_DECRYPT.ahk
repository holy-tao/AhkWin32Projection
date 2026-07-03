#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CARD_DATA.ahk" { CARD_DATA }
#Import ".\CARD_RSA_DECRYPT_INFO.ahk" { CARD_RSA_DECRYPT_INFO }

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct PFN_CARD_RSA_DECRYPT {
    value : IntPtr

    __value {
        set {
            if (value is PFN_CARD_RSA_DECRYPT) {
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
     * @param {Pointer<CARD_RSA_DECRYPT_INFO>} pInfo 
     * @returns {Integer} 
     */
    Call(pCardData, pInfo) {
        result := DllCall(this.value, CARD_DATA.Ptr, pCardData, CARD_RSA_DECRYPT_INFO.Ptr, pInfo, UInt32)
        return result
    }

    /**
     * A PFN_CARD_RSA_DECRYPT that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFN_CARD_RSA_DECRYPT {
        /**
         * Creates a PFN_CARD_RSA_DECRYPT pointer that invokes the given AHK function when called.
         * @param {Func(CARD_DATA, CARD_RSA_DECRYPT_INFO) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [CARD_DATA.Ptr, CARD_RSA_DECRYPT_INFO.Ptr, UInt32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
