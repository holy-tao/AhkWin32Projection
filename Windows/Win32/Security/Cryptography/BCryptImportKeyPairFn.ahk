#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\NTSTATUS.ahk" { NTSTATUS }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\BCRYPT_ALG_HANDLE.ahk" { BCRYPT_ALG_HANDLE }
#Import ".\BCRYPT_KEY_HANDLE.ahk" { BCRYPT_KEY_HANDLE }

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct BCryptImportKeyPairFn {
    value : IntPtr

    __value {
        set {
            if (value is BCryptImportKeyPairFn) {
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
     * @param {BCRYPT_KEY_HANDLE} hImportKey 
     * @param {PWSTR} pszBlobType 
     * @param {Pointer<BCRYPT_KEY_HANDLE>} phKey 
     * @param {Integer} pbInput 
     * @param {Integer} cbInput 
     * @param {Integer} dwFlags 
     * @returns {NTSTATUS} 
     */
    Call(hAlgorithm, hImportKey, pszBlobType, phKey, pbInput, cbInput, dwFlags) {
        pszBlobType := pszBlobType is String ? StrPtr(pszBlobType) : pszBlobType

        result := DllCall(this.value, BCRYPT_ALG_HANDLE, hAlgorithm, BCRYPT_KEY_HANDLE, hImportKey, "ptr", pszBlobType, BCRYPT_KEY_HANDLE.Ptr, phKey, IntPtr, pbInput, UInt32, cbInput, UInt32, dwFlags, NTSTATUS)
        NTSTATUS.ThrowIfError(result.value)
        return result
    }

    /**
     * A BCryptImportKeyPairFn that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends BCryptImportKeyPairFn {
        /**
         * Creates a BCryptImportKeyPairFn pointer that invokes the given AHK function when called.
         * @param {Func(BCRYPT_ALG_HANDLE, BCRYPT_KEY_HANDLE, PWSTR, BCRYPT_KEY_HANDLE, IntPtr, UInt32, UInt32) => NTSTATUS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 7)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 7 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [BCRYPT_ALG_HANDLE, BCRYPT_KEY_HANDLE, PWSTR, BCRYPT_KEY_HANDLE.Ptr, IntPtr, UInt32, UInt32, NTSTATUS])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
