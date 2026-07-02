#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CERT_CONTEXT.ahk" { CERT_CONTEXT }
#Import ".\NCRYPT_PROV_HANDLE.ahk" { NCRYPT_PROV_HANDLE }
#Import ".\NCRYPT_KEY_HANDLE.ahk" { NCRYPT_KEY_HANDLE }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct SslOpenPrivateKeyFn {
    value : IntPtr

    __value {
        set {
            if (value is SslOpenPrivateKeyFn) {
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
     * @param {Pointer<CERT_CONTEXT>} pCertContext 
     * @param {Integer} dwFlags 
     * @returns {NCRYPT_KEY_HANDLE} 
     */
    Call(hSslProvider, pCertContext, dwFlags) {
        phPrivateKey := NCRYPT_KEY_HANDLE.Owned()
        result := DllCall(this.value, NCRYPT_PROV_HANDLE, hSslProvider, NCRYPT_KEY_HANDLE.Ptr, phPrivateKey, CERT_CONTEXT.Ptr, pCertContext, UInt32, dwFlags, "HRESULT")
        return phPrivateKey
    }

    /**
     * A SslOpenPrivateKeyFn that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends SslOpenPrivateKeyFn {
        /**
         * Creates a SslOpenPrivateKeyFn pointer that invokes the given AHK function when called.
         * @param {Func(NCRYPT_PROV_HANDLE, CERT_CONTEXT, UInt32) => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [NCRYPT_PROV_HANDLE, CERT_CONTEXT.Ptr, UInt32, "int"])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
