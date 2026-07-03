#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\NCRYPT_PROV_HANDLE.ahk" { NCRYPT_PROV_HANDLE }

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct SslLookupCipherLengthsFn {
    value : IntPtr

    __value {
        set {
            if (value is SslLookupCipherLengthsFn) {
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
     * @param {Integer} dwProtocol 
     * @param {Integer} dwCipherSuite 
     * @param {Integer} dwKeyType 
     * @param {Integer} pCipherLengths 
     * @param {Integer} cbCipherLengths 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     */
    Call(hSslProvider, dwProtocol, dwCipherSuite, dwKeyType, pCipherLengths, cbCipherLengths, dwFlags) {
        result := DllCall(this.value, NCRYPT_PROV_HANDLE, hSslProvider, UInt32, dwProtocol, UInt32, dwCipherSuite, UInt32, dwKeyType, IntPtr, pCipherLengths, UInt32, cbCipherLengths, UInt32, dwFlags, "HRESULT")
        return result
    }

    /**
     * A SslLookupCipherLengthsFn that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends SslLookupCipherLengthsFn {
        /**
         * Creates a SslLookupCipherLengthsFn pointer that invokes the given AHK function when called.
         * @param {Func(NCRYPT_PROV_HANDLE, UInt32, UInt32, UInt32, IntPtr, UInt32, UInt32) => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 7)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 7 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [NCRYPT_PROV_HANDLE, UInt32, UInt32, UInt32, IntPtr, UInt32, UInt32, "int"])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
