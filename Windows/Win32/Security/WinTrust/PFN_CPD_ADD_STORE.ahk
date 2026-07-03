#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\Cryptography\HCERTSTORE.ahk" { HCERTSTORE }
#Import ".\CRYPT_PROVIDER_DATA.ahk" { CRYPT_PROVIDER_DATA }

/**
 * @namespace Windows.Win32.Security.WinTrust
 */
export default struct PFN_CPD_ADD_STORE {
    value : IntPtr

    __value {
        set {
            if (value is PFN_CPD_ADD_STORE) {
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
     * @param {HCERTSTORE} hStore2Add 
     * @returns {BOOL} 
     */
    Call(pProvData, hStore2Add) {
        result := DllCall(this.value, CRYPT_PROVIDER_DATA.Ptr, pProvData, HCERTSTORE, hStore2Add, BOOL)
        return result
    }

    /**
     * A PFN_CPD_ADD_STORE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFN_CPD_ADD_STORE {
        /**
         * Creates a PFN_CPD_ADD_STORE pointer that invokes the given AHK function when called.
         * @param {Func(CRYPT_PROVIDER_DATA, HCERTSTORE) => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [CRYPT_PROVIDER_DATA.Ptr, HCERTSTORE, BOOL])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
