#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\NTSTATUS.ahk" { NTSTATUS }
#Import ".\BCRYPT_KEY_HANDLE.ahk" { BCRYPT_KEY_HANDLE }

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct BCryptDuplicateKeyFn {
    value : IntPtr

    __value {
        set {
            if (value is BCryptDuplicateKeyFn) {
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
     * @param {Pointer<BCRYPT_KEY_HANDLE>} phNewKey 
     * @param {Integer} pbKeyObject 
     * @param {Integer} cbKeyObject 
     * @param {Integer} dwFlags 
     * @returns {NTSTATUS} 
     */
    Call(_hKey, phNewKey, pbKeyObject, cbKeyObject, dwFlags) {
        result := DllCall(this.value, BCRYPT_KEY_HANDLE, _hKey, BCRYPT_KEY_HANDLE.Ptr, phNewKey, IntPtr, pbKeyObject, UInt32, cbKeyObject, UInt32, dwFlags, NTSTATUS)
        NTSTATUS.ThrowIfError(result.value)
        return result
    }

    /**
     * A BCryptDuplicateKeyFn that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends BCryptDuplicateKeyFn {
        /**
         * Creates a BCryptDuplicateKeyFn pointer that invokes the given AHK function when called.
         * @param {Func(BCRYPT_KEY_HANDLE, BCRYPT_KEY_HANDLE, IntPtr, UInt32, UInt32) => NTSTATUS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 5)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 5 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [BCRYPT_KEY_HANDLE, BCRYPT_KEY_HANDLE.Ptr, IntPtr, UInt32, UInt32, NTSTATUS])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
