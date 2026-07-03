#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CARD_RSA_DECRYPT_INFO.ahk" { CARD_RSA_DECRYPT_INFO }

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct PFN_CSP_UNPAD_DATA {
    value : IntPtr

    __value {
        set {
            if (value is PFN_CSP_UNPAD_DATA) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<CARD_RSA_DECRYPT_INFO>} pRSADecryptInfo 
     * @param {Pointer<Integer>} pcbUnpaddedData 
     * @param {Pointer<Pointer<Integer>>} ppbUnpaddedData 
     * @returns {Integer} 
     */
    Call(pRSADecryptInfo, pcbUnpaddedData, ppbUnpaddedData) {
        pcbUnpaddedDataMarshal := pcbUnpaddedData is VarRef ? "uint*" : "ptr"
        ppbUnpaddedDataMarshal := ppbUnpaddedData is VarRef ? "ptr*" : "ptr"

        result := DllCall(this.value, CARD_RSA_DECRYPT_INFO.Ptr, pRSADecryptInfo, pcbUnpaddedDataMarshal, pcbUnpaddedData, ppbUnpaddedDataMarshal, ppbUnpaddedData, UInt32)
        return result
    }

    /**
     * A PFN_CSP_UNPAD_DATA that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFN_CSP_UNPAD_DATA {
        /**
         * Creates a PFN_CSP_UNPAD_DATA pointer that invokes the given AHK function when called.
         * @param {Func(CARD_RSA_DECRYPT_INFO, "uint*", "ptr*") => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [CARD_RSA_DECRYPT_INFO.Ptr, "uint*", "ptr*", UInt32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
