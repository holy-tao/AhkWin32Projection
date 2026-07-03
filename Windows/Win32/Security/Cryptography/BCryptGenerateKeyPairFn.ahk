#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\NTSTATUS.ahk" { NTSTATUS }
#Import ".\BCRYPT_ALG_HANDLE.ahk" { BCRYPT_ALG_HANDLE }
#Import ".\BCRYPT_KEY_HANDLE.ahk" { BCRYPT_KEY_HANDLE }

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct BCryptGenerateKeyPairFn {
    value : IntPtr

    __value {
        set {
            if (value is BCryptGenerateKeyPairFn) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {BCRYPT_ALG_HANDLE} hAlgorithm 
     * @param {Pointer<BCRYPT_KEY_HANDLE>} phKey 
     * @param {Integer} dwLength 
     * @param {Integer} dwFlags 
     * @returns {NTSTATUS} 
     */
    Call(hAlgorithm, phKey, dwLength, dwFlags) {
        result := DllCall(this.value, BCRYPT_ALG_HANDLE, hAlgorithm, BCRYPT_KEY_HANDLE.Ptr, phKey, UInt32, dwLength, UInt32, dwFlags, NTSTATUS)
        NTSTATUS.ThrowIfError(result)
        return result
    }

    /**
     * A BCryptGenerateKeyPairFn that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends BCryptGenerateKeyPairFn {
        /**
         * Creates a BCryptGenerateKeyPairFn pointer that invokes the given AHK function when called.
         * @param {Func(BCRYPT_ALG_HANDLE, BCRYPT_KEY_HANDLE, UInt32, UInt32) => NTSTATUS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [BCRYPT_ALG_HANDLE, BCRYPT_KEY_HANDLE.Ptr, UInt32, UInt32, NTSTATUS])
        }

        __Delete() => CallbackFree(this.value)
    }
}
