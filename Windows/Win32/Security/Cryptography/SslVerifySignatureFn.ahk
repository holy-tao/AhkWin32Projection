#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\NCRYPT_KEY_HANDLE.ahk" { NCRYPT_KEY_HANDLE }
#Import ".\NCRYPT_PROV_HANDLE.ahk" { NCRYPT_PROV_HANDLE }

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct SslVerifySignatureFn {
    value : IntPtr

    __value {
        set {
            if (value is SslVerifySignatureFn) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {NCRYPT_PROV_HANDLE} hSslProvider 
     * @param {NCRYPT_KEY_HANDLE} hPublicKey 
     * @param {Integer} pbHashValue 
     * @param {Integer} cbHashValue 
     * @param {Integer} pbSignature 
     * @param {Integer} cbSignature 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     */
    Call(hSslProvider, hPublicKey, pbHashValue, cbHashValue, pbSignature, cbSignature, dwFlags) {
        result := DllCall(this.value, NCRYPT_PROV_HANDLE, hSslProvider, NCRYPT_KEY_HANDLE, hPublicKey, IntPtr, pbHashValue, UInt32, cbHashValue, IntPtr, pbSignature, UInt32, cbSignature, UInt32, dwFlags, "HRESULT")
        return result
    }

    /**
     * A SslVerifySignatureFn that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends SslVerifySignatureFn {
        /**
         * Creates a SslVerifySignatureFn pointer that invokes the given AHK function when called.
         * @param {Func(NCRYPT_PROV_HANDLE, NCRYPT_KEY_HANDLE, IntPtr, UInt32, IntPtr, UInt32, UInt32) => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 7)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 7 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [NCRYPT_PROV_HANDLE, NCRYPT_KEY_HANDLE, IntPtr, UInt32, IntPtr, UInt32, UInt32, "int"])
        }

        __Delete() => CallbackFree(this.value)
    }
}
