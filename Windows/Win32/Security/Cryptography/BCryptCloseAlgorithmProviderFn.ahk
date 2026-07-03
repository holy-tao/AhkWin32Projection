#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\NTSTATUS.ahk" { NTSTATUS }
#Import ".\BCRYPT_ALG_HANDLE.ahk" { BCRYPT_ALG_HANDLE }

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct BCryptCloseAlgorithmProviderFn {
    value : IntPtr

    __value {
        set {
            if (value is BCryptCloseAlgorithmProviderFn) {
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
     * @param {Integer} dwFlags 
     * @returns {NTSTATUS} 
     */
    Call(hAlgorithm, dwFlags) {
        result := DllCall(this.value, BCRYPT_ALG_HANDLE, hAlgorithm, UInt32, dwFlags, NTSTATUS)
        NTSTATUS.ThrowIfError(result.value)
        return result
    }

    /**
     * A BCryptCloseAlgorithmProviderFn that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends BCryptCloseAlgorithmProviderFn {
        /**
         * Creates a BCryptCloseAlgorithmProviderFn pointer that invokes the given AHK function when called.
         * @param {Func(BCRYPT_ALG_HANDLE, UInt32) => NTSTATUS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [BCRYPT_ALG_HANDLE, UInt32, NTSTATUS])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
