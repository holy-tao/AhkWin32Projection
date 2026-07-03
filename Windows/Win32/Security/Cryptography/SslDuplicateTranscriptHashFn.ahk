#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\NCRYPT_HASH_HANDLE.ahk" { NCRYPT_HASH_HANDLE }
#Import ".\NCRYPT_PROV_HANDLE.ahk" { NCRYPT_PROV_HANDLE }

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct SslDuplicateTranscriptHashFn {
    value : IntPtr

    __value {
        set {
            if (value is SslDuplicateTranscriptHashFn) {
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
     * @param {NCRYPT_HASH_HANDLE} hTranscriptHash 
     * @param {Integer} dwFlags 
     * @returns {NCRYPT_HASH_HANDLE} 
     */
    Call(hSslProvider, hTranscriptHash, dwFlags) {
        phDuplicateTranscriptHash := NCRYPT_HASH_HANDLE()
        result := DllCall(this.value, NCRYPT_PROV_HANDLE, hSslProvider, NCRYPT_HASH_HANDLE, hTranscriptHash, NCRYPT_HASH_HANDLE.Ptr, phDuplicateTranscriptHash, UInt32, dwFlags, "HRESULT")
        return phDuplicateTranscriptHash
    }

    /**
     * A SslDuplicateTranscriptHashFn that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends SslDuplicateTranscriptHashFn {
        /**
         * Creates a SslDuplicateTranscriptHashFn pointer that invokes the given AHK function when called.
         * @param {Func(NCRYPT_PROV_HANDLE, NCRYPT_HASH_HANDLE, UInt32) => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [NCRYPT_PROV_HANDLE, NCRYPT_HASH_HANDLE, UInt32, "int"])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
