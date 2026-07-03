#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\NTSTATUS.ahk" { NTSTATUS }
#Import ".\BCRYPT_ALG_HANDLE.ahk" { BCRYPT_ALG_HANDLE }
#Import ".\BCRYPT_KEY_HANDLE.ahk" { BCRYPT_KEY_HANDLE }

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct BCryptGenerateSymmetricKeyFn {
    value : IntPtr

    __value {
        set {
            if (value is BCryptGenerateSymmetricKeyFn) {
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
     * @param {Integer} pbKeyObject 
     * @param {Integer} cbKeyObject 
     * @param {Integer} pbSecret 
     * @param {Integer} cbSecret 
     * @param {Integer} dwFlags 
     * @returns {NTSTATUS} 
     */
    Call(hAlgorithm, phKey, pbKeyObject, cbKeyObject, pbSecret, cbSecret, dwFlags) {
        result := DllCall(this.value, BCRYPT_ALG_HANDLE, hAlgorithm, BCRYPT_KEY_HANDLE.Ptr, phKey, IntPtr, pbKeyObject, UInt32, cbKeyObject, IntPtr, pbSecret, UInt32, cbSecret, UInt32, dwFlags, NTSTATUS)
        NTSTATUS.ThrowIfError(result)
        return result
    }

    /**
     * A BCryptGenerateSymmetricKeyFn that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends BCryptGenerateSymmetricKeyFn {
        /**
         * Creates a BCryptGenerateSymmetricKeyFn pointer that invokes the given AHK function when called.
         * @param {Func(BCRYPT_ALG_HANDLE, BCRYPT_KEY_HANDLE, IntPtr, UInt32, IntPtr, UInt32, UInt32) => NTSTATUS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 7)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 7 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [BCRYPT_ALG_HANDLE, BCRYPT_KEY_HANDLE.Ptr, IntPtr, UInt32, IntPtr, UInt32, UInt32, NTSTATUS])
        }

        __Delete() => CallbackFree(this.value)
    }
}
