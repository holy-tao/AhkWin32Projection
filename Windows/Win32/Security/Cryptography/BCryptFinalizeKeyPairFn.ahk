#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\NTSTATUS.ahk" { NTSTATUS }
#Import ".\BCRYPT_KEY_HANDLE.ahk" { BCRYPT_KEY_HANDLE }

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct BCryptFinalizeKeyPairFn {
    value : IntPtr

    __value {
        set {
            if (value is BCryptFinalizeKeyPairFn) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {BCRYPT_KEY_HANDLE} _hKey 
     * @param {Integer} dwFlags 
     * @returns {NTSTATUS} 
     */
    Call(_hKey, dwFlags) {
        result := DllCall(this.value, BCRYPT_KEY_HANDLE, _hKey, UInt32, dwFlags, NTSTATUS)
        NTSTATUS.ThrowIfError(result)
        return result
    }

    /**
     * A BCryptFinalizeKeyPairFn that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends BCryptFinalizeKeyPairFn {
        /**
         * Creates a BCryptFinalizeKeyPairFn pointer that invokes the given AHK function when called.
         * @param {Func(BCRYPT_KEY_HANDLE, UInt32) => NTSTATUS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [BCRYPT_KEY_HANDLE, UInt32, NTSTATUS])
        }

        __Delete() => CallbackFree(this.value)
    }
}
