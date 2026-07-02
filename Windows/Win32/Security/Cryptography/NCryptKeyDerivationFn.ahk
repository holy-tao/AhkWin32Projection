#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\NCRYPT_PROV_HANDLE.ahk" { NCRYPT_PROV_HANDLE }
#Import ".\NCRYPT_KEY_HANDLE.ahk" { NCRYPT_KEY_HANDLE }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\BCryptBufferDesc.ahk" { BCryptBufferDesc }

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct NCryptKeyDerivationFn {
    value : IntPtr

    __value {
        set {
            if (value is NCryptKeyDerivationFn) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {NCRYPT_PROV_HANDLE} _hProvider 
     * @param {NCRYPT_KEY_HANDLE} _hKey 
     * @param {Pointer<BCryptBufferDesc>} pParameterList 
     * @param {Integer} pbDerivedKey 
     * @param {Integer} cbDerivedKey 
     * @param {Integer} dwFlags 
     * @returns {Integer} 
     */
    Call(_hProvider, _hKey, pParameterList, pbDerivedKey, cbDerivedKey, dwFlags) {
        result := DllCall(this.value, NCRYPT_PROV_HANDLE, _hProvider, NCRYPT_KEY_HANDLE, _hKey, BCryptBufferDesc.Ptr, pParameterList, IntPtr, pbDerivedKey, UInt32, cbDerivedKey, "uint*", &pcbResult := 0, UInt32, dwFlags, "HRESULT")
        return pcbResult
    }

    /**
     * A NCryptKeyDerivationFn that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends NCryptKeyDerivationFn {
        /**
         * Creates a NCryptKeyDerivationFn pointer that invokes the given AHK function when called.
         * @param {Func(NCRYPT_PROV_HANDLE, NCRYPT_KEY_HANDLE, BCryptBufferDesc, IntPtr, UInt32, UInt32) => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 6)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 6 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [NCRYPT_PROV_HANDLE, NCRYPT_KEY_HANDLE, BCryptBufferDesc.Ptr, IntPtr, UInt32, UInt32, "int"])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
