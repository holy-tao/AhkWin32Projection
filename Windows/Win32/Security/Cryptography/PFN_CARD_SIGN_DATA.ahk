#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CARD_DATA.ahk" { CARD_DATA }
#Import ".\CARD_SIGNING_INFO.ahk" { CARD_SIGNING_INFO }

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct PFN_CARD_SIGN_DATA {
    value : IntPtr

    __value {
        set {
            if (value is PFN_CARD_SIGN_DATA) {
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
     * @param {Pointer<CARD_SIGNING_INFO>} pInfo 
     * @returns {Integer} 
     */
    Call(pCardData, pInfo) {
        result := DllCall(this.value, CARD_DATA.Ptr, pCardData, CARD_SIGNING_INFO.Ptr, pInfo, UInt32)
        return result
    }

    /**
     * A PFN_CARD_SIGN_DATA that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFN_CARD_SIGN_DATA {
        /**
         * Creates a PFN_CARD_SIGN_DATA pointer that invokes the given AHK function when called.
         * @param {Func(CARD_DATA, CARD_SIGNING_INFO) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [CARD_DATA.Ptr, CARD_SIGNING_INFO.Ptr, UInt32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
