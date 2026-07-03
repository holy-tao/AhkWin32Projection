#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\NTSTATUS.ahk" { NTSTATUS }
#Import ".\BCRYPT_KEY_HANDLE.ahk" { BCRYPT_KEY_HANDLE }

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct BCryptDestroyKeyFn {
    value : IntPtr

    __value {
        set {
            if (value is BCryptDestroyKeyFn) {
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
     * @returns {NTSTATUS} 
     */
    Call(_hKey) {
        result := DllCall(this.value, BCRYPT_KEY_HANDLE, _hKey, NTSTATUS)
        NTSTATUS.ThrowIfError(result.value)
        return result
    }

    /**
     * A BCryptDestroyKeyFn that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends BCryptDestroyKeyFn {
        /**
         * Creates a BCryptDestroyKeyFn pointer that invokes the given AHK function when called.
         * @param {Func(BCRYPT_KEY_HANDLE) => NTSTATUS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [BCRYPT_KEY_HANDLE, NTSTATUS])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
