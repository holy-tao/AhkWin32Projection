#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\NTSTATUS.ahk" { NTSTATUS }
#Import ".\BCRYPT_HASH_HANDLE.ahk" { BCRYPT_HASH_HANDLE }

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct BCryptDestroyHashFn {
    value : IntPtr

    __value {
        set {
            if (value is BCryptDestroyHashFn) {
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
     * @returns {NTSTATUS} 
     */
    Call(hHash) {
        result := DllCall(this.value, BCRYPT_HASH_HANDLE, hHash, NTSTATUS)
        NTSTATUS.ThrowIfError(result)
        return result
    }

    /**
     * A BCryptDestroyHashFn that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends BCryptDestroyHashFn {
        /**
         * Creates a BCryptDestroyHashFn pointer that invokes the given AHK function when called.
         * @param {Func(BCRYPT_HASH_HANDLE) => NTSTATUS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [BCRYPT_HASH_HANDLE, NTSTATUS])
        }

        __Delete() => CallbackFree(this.value)
    }
}
