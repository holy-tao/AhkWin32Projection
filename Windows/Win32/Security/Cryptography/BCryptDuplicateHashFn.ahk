#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\NTSTATUS.ahk" { NTSTATUS }
#Import ".\BCRYPT_HASH_HANDLE.ahk" { BCRYPT_HASH_HANDLE }

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct BCryptDuplicateHashFn {
    value : IntPtr

    __value {
        set {
            if (value is BCryptDuplicateHashFn) {
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
     * @param {Pointer<BCRYPT_HASH_HANDLE>} phNewHash 
     * @param {Integer} pbHashObject 
     * @param {Integer} cbHashObject 
     * @param {Integer} dwFlags 
     * @returns {NTSTATUS} 
     */
    Call(hHash, phNewHash, pbHashObject, cbHashObject, dwFlags) {
        result := DllCall(this.value, BCRYPT_HASH_HANDLE, hHash, BCRYPT_HASH_HANDLE.Ptr, phNewHash, IntPtr, pbHashObject, UInt32, cbHashObject, UInt32, dwFlags, NTSTATUS)
        NTSTATUS.ThrowIfError(result)
        return result
    }

    /**
     * A BCryptDuplicateHashFn that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends BCryptDuplicateHashFn {
        /**
         * Creates a BCryptDuplicateHashFn pointer that invokes the given AHK function when called.
         * @param {Func(BCRYPT_HASH_HANDLE, BCRYPT_HASH_HANDLE, IntPtr, UInt32, UInt32) => NTSTATUS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 5)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 5 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [BCRYPT_HASH_HANDLE, BCRYPT_HASH_HANDLE.Ptr, IntPtr, UInt32, UInt32, NTSTATUS])
        }

        __Delete() => CallbackFree(this.value)
    }
}
