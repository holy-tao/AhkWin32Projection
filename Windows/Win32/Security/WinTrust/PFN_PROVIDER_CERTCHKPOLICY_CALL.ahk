#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\CRYPT_PROVIDER_DATA.ahk" { CRYPT_PROVIDER_DATA }

/**
 * @namespace Windows.Win32.Security.WinTrust
 */
export default struct PFN_PROVIDER_CERTCHKPOLICY_CALL {
    value : IntPtr

    __value {
        set {
            if (value is PFN_PROVIDER_CERTCHKPOLICY_CALL) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<CRYPT_PROVIDER_DATA>} pProvData 
     * @param {Integer} idxSigner 
     * @param {BOOL} fCounterSignerChain 
     * @param {Integer} idxCounterSigner 
     * @returns {BOOL} 
     */
    Call(pProvData, idxSigner, fCounterSignerChain, idxCounterSigner) {
        result := DllCall(this.value, CRYPT_PROVIDER_DATA.Ptr, pProvData, UInt32, idxSigner, BOOL, fCounterSignerChain, UInt32, idxCounterSigner, BOOL)
        return result
    }

    /**
     * A PFN_PROVIDER_CERTCHKPOLICY_CALL that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFN_PROVIDER_CERTCHKPOLICY_CALL {
        /**
         * Creates a PFN_PROVIDER_CERTCHKPOLICY_CALL pointer that invokes the given AHK function when called.
         * @param {Func(CRYPT_PROVIDER_DATA, UInt32, BOOL, UInt32) => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [CRYPT_PROVIDER_DATA.Ptr, UInt32, BOOL, UInt32, BOOL])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
