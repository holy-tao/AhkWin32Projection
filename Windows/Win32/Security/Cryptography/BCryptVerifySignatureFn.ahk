#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\NTSTATUS.ahk" { NTSTATUS }
#Import ".\BCRYPT_KEY_HANDLE.ahk" { BCRYPT_KEY_HANDLE }

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct BCryptVerifySignatureFn {
    value : IntPtr

    __value {
        set {
            if (value is BCryptVerifySignatureFn) {
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
     * @param {Pointer<Void>} pPaddingInfo 
     * @param {Integer} pbHash 
     * @param {Integer} cbHash 
     * @param {Integer} pbSignature 
     * @param {Integer} cbSignature 
     * @param {Integer} dwFlags 
     * @returns {NTSTATUS} 
     */
    Call(_hKey, pPaddingInfo, pbHash, cbHash, pbSignature, cbSignature, dwFlags) {
        pPaddingInfoMarshal := pPaddingInfo is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, BCRYPT_KEY_HANDLE, _hKey, pPaddingInfoMarshal, pPaddingInfo, IntPtr, pbHash, UInt32, cbHash, IntPtr, pbSignature, UInt32, cbSignature, UInt32, dwFlags, NTSTATUS)
        NTSTATUS.ThrowIfError(result.value)
        return result
    }

    /**
     * A BCryptVerifySignatureFn that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends BCryptVerifySignatureFn {
        /**
         * Creates a BCryptVerifySignatureFn pointer that invokes the given AHK function when called.
         * @param {Func(BCRYPT_KEY_HANDLE, "ptr", IntPtr, UInt32, IntPtr, UInt32, UInt32) => NTSTATUS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 7)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 7 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [BCRYPT_KEY_HANDLE, "ptr", IntPtr, UInt32, IntPtr, UInt32, UInt32, NTSTATUS])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
