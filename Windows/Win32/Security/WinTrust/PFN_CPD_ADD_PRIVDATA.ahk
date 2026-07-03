#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\CRYPT_PROVIDER_DATA.ahk" { CRYPT_PROVIDER_DATA }
#Import ".\CRYPT_PROVIDER_PRIVDATA.ahk" { CRYPT_PROVIDER_PRIVDATA }

/**
 * @namespace Windows.Win32.Security.WinTrust
 */
export default struct PFN_CPD_ADD_PRIVDATA {
    value : IntPtr

    __value {
        set {
            if (value is PFN_CPD_ADD_PRIVDATA) {
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
     * @param {Pointer<CRYPT_PROVIDER_PRIVDATA>} pPrivData2Add 
     * @returns {BOOL} 
     */
    Call(pProvData, pPrivData2Add) {
        result := DllCall(this.value, CRYPT_PROVIDER_DATA.Ptr, pProvData, CRYPT_PROVIDER_PRIVDATA.Ptr, pPrivData2Add, BOOL)
        return result
    }

    /**
     * A PFN_CPD_ADD_PRIVDATA that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFN_CPD_ADD_PRIVDATA {
        /**
         * Creates a PFN_CPD_ADD_PRIVDATA pointer that invokes the given AHK function when called.
         * @param {Func(CRYPT_PROVIDER_DATA, CRYPT_PROVIDER_PRIVDATA) => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [CRYPT_PROVIDER_DATA.Ptr, CRYPT_PROVIDER_PRIVDATA.Ptr, BOOL])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
