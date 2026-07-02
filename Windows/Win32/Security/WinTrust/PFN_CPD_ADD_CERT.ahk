#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\Cryptography\CERT_CONTEXT.ahk" { CERT_CONTEXT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\CRYPT_PROVIDER_DATA.ahk" { CRYPT_PROVIDER_DATA }

/**
 * @namespace Windows.Win32.Security.WinTrust
 */
export default struct PFN_CPD_ADD_CERT {
    value : IntPtr

    __value {
        set {
            if (value is PFN_CPD_ADD_CERT) {
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
     * @param {BOOL} fCounterSigner 
     * @param {Integer} idxCounterSigner 
     * @param {Pointer<CERT_CONTEXT>} pCert2Add 
     * @returns {BOOL} 
     */
    Call(pProvData, idxSigner, fCounterSigner, idxCounterSigner, pCert2Add) {
        result := DllCall(this.value, CRYPT_PROVIDER_DATA.Ptr, pProvData, UInt32, idxSigner, BOOL, fCounterSigner, UInt32, idxCounterSigner, CERT_CONTEXT.Ptr, pCert2Add, BOOL)
        return result
    }

    /**
     * A PFN_CPD_ADD_CERT that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFN_CPD_ADD_CERT {
        /**
         * Creates a PFN_CPD_ADD_CERT pointer that invokes the given AHK function when called.
         * @param {Func(CRYPT_PROVIDER_DATA, UInt32, BOOL, UInt32, CERT_CONTEXT) => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 5)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 5 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [CRYPT_PROVIDER_DATA.Ptr, UInt32, BOOL, UInt32, CERT_CONTEXT.Ptr, BOOL])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
