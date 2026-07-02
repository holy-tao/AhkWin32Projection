#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\NCRYPT_PROV_HANDLE.ahk" { NCRYPT_PROV_HANDLE }
#Import ".\NCRYPT_KEY_HANDLE.ahk" { NCRYPT_KEY_HANDLE }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct SslComputeEapKeyBlockFn {
    value : IntPtr

    __value {
        set {
            if (value is SslComputeEapKeyBlockFn) {
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
     * @param {NCRYPT_KEY_HANDLE} hMasterKey 
     * @param {Integer} pbRandoms 
     * @param {Integer} cbRandoms 
     * @param {Integer} pbOutput 
     * @param {Integer} cbOutput 
     * @param {Integer} dwFlags 
     * @returns {Integer} 
     */
    Call(hSslProvider, hMasterKey, pbRandoms, cbRandoms, pbOutput, cbOutput, dwFlags) {
        result := DllCall(this.value, NCRYPT_PROV_HANDLE, hSslProvider, NCRYPT_KEY_HANDLE, hMasterKey, IntPtr, pbRandoms, UInt32, cbRandoms, IntPtr, pbOutput, UInt32, cbOutput, "uint*", &pcbResult := 0, UInt32, dwFlags, "HRESULT")
        return pcbResult
    }

    /**
     * A SslComputeEapKeyBlockFn that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends SslComputeEapKeyBlockFn {
        /**
         * Creates a SslComputeEapKeyBlockFn pointer that invokes the given AHK function when called.
         * @param {Func(NCRYPT_PROV_HANDLE, NCRYPT_KEY_HANDLE, IntPtr, UInt32, IntPtr, UInt32, UInt32) => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 7)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 7 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [NCRYPT_PROV_HANDLE, NCRYPT_KEY_HANDLE, IntPtr, UInt32, IntPtr, UInt32, UInt32, "int"])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
