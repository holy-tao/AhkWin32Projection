#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\NTSTATUS.ahk" { NTSTATUS }
#Import ".\BCRYPT_HASH_HANDLE.ahk" { BCRYPT_HASH_HANDLE }

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct BCryptFinishHashFn {
    value : IntPtr

    __value {
        set {
            if (value is BCryptFinishHashFn) {
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
     * @param {Integer} pbOutput 
     * @param {Integer} cbOutput 
     * @param {Integer} dwFlags 
     * @returns {NTSTATUS} 
     */
    Call(hHash, pbOutput, cbOutput, dwFlags) {
        result := DllCall(this.value, BCRYPT_HASH_HANDLE, hHash, IntPtr, pbOutput, UInt32, cbOutput, UInt32, dwFlags, NTSTATUS)
        NTSTATUS.ThrowIfError(result.value)
        return result
    }

    /**
     * A BCryptFinishHashFn that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends BCryptFinishHashFn {
        /**
         * Creates a BCryptFinishHashFn pointer that invokes the given AHK function when called.
         * @param {Func(BCRYPT_HASH_HANDLE, IntPtr, UInt32, UInt32) => NTSTATUS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [BCRYPT_HASH_HANDLE, IntPtr, UInt32, UInt32, NTSTATUS])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
