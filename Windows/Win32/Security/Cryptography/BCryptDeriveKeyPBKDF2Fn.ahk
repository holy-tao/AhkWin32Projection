#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\BCRYPT_ALG_HANDLE.ahk" { BCRYPT_ALG_HANDLE }
#Import "..\..\Foundation\NTSTATUS.ahk" { NTSTATUS }

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct BCryptDeriveKeyPBKDF2Fn {
    value : IntPtr

    __value {
        set {
            if (value is BCryptDeriveKeyPBKDF2Fn) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {BCRYPT_ALG_HANDLE} hPrf 
     * @param {Integer} pbPassword 
     * @param {Integer} cbPassword 
     * @param {Integer} pbSalt 
     * @param {Integer} cbSalt 
     * @param {Integer} cIterations 
     * @param {Integer} pbDerivedKey 
     * @param {Integer} cbDerivedKey 
     * @param {Integer} dwFlags 
     * @returns {NTSTATUS} 
     */
    Call(hPrf, pbPassword, cbPassword, pbSalt, cbSalt, cIterations, pbDerivedKey, cbDerivedKey, dwFlags) {
        result := DllCall(this.value, BCRYPT_ALG_HANDLE, hPrf, IntPtr, pbPassword, UInt32, cbPassword, IntPtr, pbSalt, UInt32, cbSalt, Int64, cIterations, IntPtr, pbDerivedKey, UInt32, cbDerivedKey, UInt32, dwFlags, NTSTATUS)
        NTSTATUS.ThrowIfError(result.value)
        return result
    }

    /**
     * A BCryptDeriveKeyPBKDF2Fn that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends BCryptDeriveKeyPBKDF2Fn {
        /**
         * Creates a BCryptDeriveKeyPBKDF2Fn pointer that invokes the given AHK function when called.
         * @param {Func(BCRYPT_ALG_HANDLE, IntPtr, UInt32, IntPtr, UInt32, Int64, IntPtr, UInt32, UInt32) => NTSTATUS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 9)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 9 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [BCRYPT_ALG_HANDLE, IntPtr, UInt32, IntPtr, UInt32, Int64, IntPtr, UInt32, UInt32, NTSTATUS])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
