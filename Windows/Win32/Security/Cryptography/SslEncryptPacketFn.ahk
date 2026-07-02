#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\NCRYPT_PROV_HANDLE.ahk" { NCRYPT_PROV_HANDLE }
#Import ".\NCRYPT_KEY_HANDLE.ahk" { NCRYPT_KEY_HANDLE }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct SslEncryptPacketFn {
    value : IntPtr

    __value {
        set {
            if (value is SslEncryptPacketFn) {
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
     * @param {NCRYPT_KEY_HANDLE} _hKey 
     * @param {Integer} pbInput 
     * @param {Integer} cbInput 
     * @param {Integer} pbOutput 
     * @param {Integer} cbOutput 
     * @param {Integer} SequenceNumber 
     * @param {Integer} dwContentType 
     * @param {Integer} dwFlags 
     * @returns {Integer} 
     */
    Call(hSslProvider, _hKey, pbInput, cbInput, pbOutput, cbOutput, SequenceNumber, dwContentType, dwFlags) {
        result := DllCall(this.value, NCRYPT_PROV_HANDLE, hSslProvider, NCRYPT_KEY_HANDLE, _hKey, IntPtr, pbInput, UInt32, cbInput, IntPtr, pbOutput, UInt32, cbOutput, "uint*", &pcbResult := 0, Int64, SequenceNumber, UInt32, dwContentType, UInt32, dwFlags, "HRESULT")
        return pcbResult
    }

    /**
     * A SslEncryptPacketFn that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends SslEncryptPacketFn {
        /**
         * Creates a SslEncryptPacketFn pointer that invokes the given AHK function when called.
         * @param {Func(NCRYPT_PROV_HANDLE, NCRYPT_KEY_HANDLE, IntPtr, UInt32, IntPtr, UInt32, Int64, UInt32, UInt32) => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 9)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 9 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [NCRYPT_PROV_HANDLE, NCRYPT_KEY_HANDLE, IntPtr, UInt32, IntPtr, UInt32, Int64, UInt32, UInt32, "int"])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
