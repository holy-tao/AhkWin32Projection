#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\NCRYPT_KEY_HANDLE.ahk" { NCRYPT_KEY_HANDLE }
#Import ".\NCRYPT_PROV_HANDLE.ahk" { NCRYPT_PROV_HANDLE }

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct NCryptVerifySignatureFn {
    value : IntPtr

    __value {
        set {
            if (value is NCryptVerifySignatureFn) {
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
     * @param {Pointer<Void>} pPaddingInfo 
     * @param {Integer} pbHashValue 
     * @param {Integer} cbHashValue 
     * @param {Integer} pbSignature 
     * @param {Integer} cbSignature 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     */
    Call(_hProvider, _hKey, pPaddingInfo, pbHashValue, cbHashValue, pbSignature, cbSignature, dwFlags) {
        pPaddingInfoMarshal := pPaddingInfo is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, NCRYPT_PROV_HANDLE, _hProvider, NCRYPT_KEY_HANDLE, _hKey, pPaddingInfoMarshal, pPaddingInfo, IntPtr, pbHashValue, UInt32, cbHashValue, IntPtr, pbSignature, UInt32, cbSignature, UInt32, dwFlags, "HRESULT")
        return result
    }

    /**
     * A NCryptVerifySignatureFn that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends NCryptVerifySignatureFn {
        /**
         * Creates a NCryptVerifySignatureFn pointer that invokes the given AHK function when called.
         * @param {Func(NCRYPT_PROV_HANDLE, NCRYPT_KEY_HANDLE, "ptr", IntPtr, UInt32, IntPtr, UInt32, UInt32) => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 8)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 8 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [NCRYPT_PROV_HANDLE, NCRYPT_KEY_HANDLE, "ptr", IntPtr, UInt32, IntPtr, UInt32, UInt32, "int"])
        }

        __Delete() => CallbackFree(this.value)
    }
}
