#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\CRYPT_PROVIDER_DATA.ahk" { CRYPT_PROVIDER_DATA }
#Import ".\CRYPT_PROVIDER_SGNR.ahk" { CRYPT_PROVIDER_SGNR }

/**
 * @namespace Windows.Win32.Security.WinTrust
 */
export default struct PFN_CPD_ADD_SGNR {
    value : IntPtr

    __value {
        set {
            if (value is PFN_CPD_ADD_SGNR) {
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
     * @param {BOOL} fCounterSigner 
     * @param {Integer} idxSigner 
     * @param {Pointer<CRYPT_PROVIDER_SGNR>} pSgnr2Add 
     * @returns {BOOL} 
     */
    Call(pProvData, fCounterSigner, idxSigner, pSgnr2Add) {
        result := DllCall(this.value, CRYPT_PROVIDER_DATA.Ptr, pProvData, BOOL, fCounterSigner, UInt32, idxSigner, CRYPT_PROVIDER_SGNR.Ptr, pSgnr2Add, BOOL)
        return result
    }

    /**
     * A PFN_CPD_ADD_SGNR that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFN_CPD_ADD_SGNR {
        /**
         * Creates a PFN_CPD_ADD_SGNR pointer that invokes the given AHK function when called.
         * @param {Func(CRYPT_PROVIDER_DATA, BOOL, UInt32, CRYPT_PROVIDER_SGNR) => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [CRYPT_PROVIDER_DATA.Ptr, BOOL, UInt32, CRYPT_PROVIDER_SGNR.Ptr, BOOL])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
