#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\NTSTATUS.ahk" { NTSTATUS }
#Import ".\BCRYPT_ALG_HANDLE.ahk" { BCRYPT_ALG_HANDLE }
#Import ".\BCRYPT_HASH_HANDLE.ahk" { BCRYPT_HASH_HANDLE }

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct BCryptCreateHashFn {
    value : IntPtr

    __value {
        set {
            if (value is BCryptCreateHashFn) {
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
     * @param {Pointer<BCRYPT_HASH_HANDLE>} phHash 
     * @param {Integer} pbHashObject 
     * @param {Integer} cbHashObject 
     * @param {Integer} pbSecret 
     * @param {Integer} cbSecret 
     * @param {Integer} dwFlags 
     * @returns {NTSTATUS} 
     */
    Call(hAlgorithm, phHash, pbHashObject, cbHashObject, pbSecret, cbSecret, dwFlags) {
        result := DllCall(this.value, BCRYPT_ALG_HANDLE, hAlgorithm, BCRYPT_HASH_HANDLE.Ptr, phHash, IntPtr, pbHashObject, UInt32, cbHashObject, IntPtr, pbSecret, UInt32, cbSecret, UInt32, dwFlags, NTSTATUS)
        NTSTATUS.ThrowIfError(result)
        return result
    }

    /**
     * A BCryptCreateHashFn that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends BCryptCreateHashFn {
        /**
         * Creates a BCryptCreateHashFn pointer that invokes the given AHK function when called.
         * @param {Func(BCRYPT_ALG_HANDLE, BCRYPT_HASH_HANDLE, IntPtr, UInt32, IntPtr, UInt32, UInt32) => NTSTATUS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 7)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 7 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [BCRYPT_ALG_HANDLE, BCRYPT_HASH_HANDLE.Ptr, IntPtr, UInt32, IntPtr, UInt32, UInt32, NTSTATUS])
        }

        __Delete() => CallbackFree(this.value)
    }
}
