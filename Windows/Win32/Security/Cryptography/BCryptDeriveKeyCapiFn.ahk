#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\BCRYPT_ALG_HANDLE.ahk" { BCRYPT_ALG_HANDLE }
#Import "..\..\Foundation\NTSTATUS.ahk" { NTSTATUS }
#Import ".\BCRYPT_HASH_HANDLE.ahk" { BCRYPT_HASH_HANDLE }

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct BCryptDeriveKeyCapiFn {
    value : IntPtr

    __value {
        set {
            if (value is BCryptDeriveKeyCapiFn) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {BCRYPT_HASH_HANDLE} hHash 
     * @param {BCRYPT_ALG_HANDLE} hTargetAlg 
     * @param {Integer} pbDerivedKey 
     * @param {Integer} cbDerivedKey 
     * @param {Integer} dwFlags 
     * @returns {NTSTATUS} 
     */
    Call(hHash, hTargetAlg, pbDerivedKey, cbDerivedKey, dwFlags) {
        result := DllCall(this.value, BCRYPT_HASH_HANDLE, hHash, BCRYPT_ALG_HANDLE, hTargetAlg, IntPtr, pbDerivedKey, UInt32, cbDerivedKey, UInt32, dwFlags, NTSTATUS)
        NTSTATUS.ThrowIfError(result.value)
        return result
    }

    /**
     * A BCryptDeriveKeyCapiFn that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends BCryptDeriveKeyCapiFn {
        /**
         * Creates a BCryptDeriveKeyCapiFn pointer that invokes the given AHK function when called.
         * @param {Func(BCRYPT_HASH_HANDLE, BCRYPT_ALG_HANDLE, IntPtr, UInt32, UInt32) => NTSTATUS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 5)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 5 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [BCRYPT_HASH_HANDLE, BCRYPT_ALG_HANDLE, IntPtr, UInt32, UInt32, NTSTATUS])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
