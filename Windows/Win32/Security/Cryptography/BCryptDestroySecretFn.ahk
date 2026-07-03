#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\NTSTATUS.ahk" { NTSTATUS }
#Import ".\BCRYPT_SECRET_HANDLE.ahk" { BCRYPT_SECRET_HANDLE }

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct BCryptDestroySecretFn {
    value : IntPtr

    __value {
        set {
            if (value is BCryptDestroySecretFn) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {BCRYPT_SECRET_HANDLE} hSecret 
     * @returns {NTSTATUS} 
     */
    Call(hSecret) {
        result := DllCall(this.value, BCRYPT_SECRET_HANDLE, hSecret, NTSTATUS)
        NTSTATUS.ThrowIfError(result)
        return result
    }

    /**
     * A BCryptDestroySecretFn that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends BCryptDestroySecretFn {
        /**
         * Creates a BCryptDestroySecretFn pointer that invokes the given AHK function when called.
         * @param {Func(BCRYPT_SECRET_HANDLE) => NTSTATUS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [BCRYPT_SECRET_HANDLE, NTSTATUS])
        }

        __Delete() => CallbackFree(this.value)
    }
}
