#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CARD_SIGNING_INFO.ahk" { CARD_SIGNING_INFO }

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct PFN_CSP_PAD_DATA {
    value : IntPtr

    __value {
        set {
            if (value is PFN_CSP_PAD_DATA) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<CARD_SIGNING_INFO>} pSigningInfo 
     * @param {Integer} cbMaxWidth 
     * @param {Pointer<Integer>} pcbPaddedBuffer 
     * @param {Pointer<Pointer<Integer>>} ppbPaddedBuffer 
     * @returns {Integer} 
     */
    Call(pSigningInfo, cbMaxWidth, pcbPaddedBuffer, ppbPaddedBuffer) {
        pcbPaddedBufferMarshal := pcbPaddedBuffer is VarRef ? "uint*" : "ptr"
        ppbPaddedBufferMarshal := ppbPaddedBuffer is VarRef ? "ptr*" : "ptr"

        result := DllCall(this.value, CARD_SIGNING_INFO.Ptr, pSigningInfo, UInt32, cbMaxWidth, pcbPaddedBufferMarshal, pcbPaddedBuffer, ppbPaddedBufferMarshal, ppbPaddedBuffer, UInt32)
        return result
    }

    /**
     * A PFN_CSP_PAD_DATA that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFN_CSP_PAD_DATA {
        /**
         * Creates a PFN_CSP_PAD_DATA pointer that invokes the given AHK function when called.
         * @param {Func(CARD_SIGNING_INFO, UInt32, "uint*", "ptr*") => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [CARD_SIGNING_INFO.Ptr, UInt32, "uint*", "ptr*", UInt32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
