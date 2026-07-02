#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\CRYPT_PROVIDER_DATA.ahk" { CRYPT_PROVIDER_DATA }

/**
 * @namespace Windows.Win32.Security.WinTrust
 */
export default struct PFN_PROVIDER_SIGTRUST_CALL {
    value : IntPtr

    __value {
        set {
            if (value is PFN_PROVIDER_SIGTRUST_CALL) {
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
     * @returns {HRESULT} 
     */
    Call(pProvData) {
        result := DllCall(this.value, CRYPT_PROVIDER_DATA.Ptr, pProvData, "HRESULT")
        return result
    }

    /**
     * A PFN_PROVIDER_SIGTRUST_CALL that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFN_PROVIDER_SIGTRUST_CALL {
        /**
         * Creates a PFN_PROVIDER_SIGTRUST_CALL pointer that invokes the given AHK function when called.
         * @param {Func(CRYPT_PROVIDER_DATA) => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [CRYPT_PROVIDER_DATA.Ptr, "int"])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
