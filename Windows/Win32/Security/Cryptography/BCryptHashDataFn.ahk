#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\NTSTATUS.ahk" { NTSTATUS }
#Import ".\BCRYPT_HASH_HANDLE.ahk" { BCRYPT_HASH_HANDLE }

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct BCryptHashDataFn {
    value : IntPtr

    __value {
        set {
            if (value is BCryptHashDataFn) {
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
     * @param {Integer} pbInput 
     * @param {Integer} cbInput 
     * @param {Integer} dwFlags 
     * @returns {NTSTATUS} 
     */
    Call(hHash, pbInput, cbInput, dwFlags) {
        result := DllCall(this.value, BCRYPT_HASH_HANDLE, hHash, IntPtr, pbInput, UInt32, cbInput, UInt32, dwFlags, NTSTATUS)
        NTSTATUS.ThrowIfError(result.value)
        return result
    }

    /**
     * A BCryptHashDataFn that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends BCryptHashDataFn {
        /**
         * Creates a BCryptHashDataFn pointer that invokes the given AHK function when called.
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
