#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\BCRYPT_ALG_HANDLE.ahk" { BCRYPT_ALG_HANDLE }
#Import "..\..\Foundation\NTSTATUS.ahk" { NTSTATUS }

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct BCryptGenRandomFn {
    value : IntPtr

    __value {
        set {
            if (value is BCryptGenRandomFn) {
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
     * @param {Integer} pbBuffer 
     * @param {Integer} cbBuffer 
     * @param {Integer} dwFlags 
     * @returns {NTSTATUS} 
     */
    Call(hAlgorithm, pbBuffer, cbBuffer, dwFlags) {
        result := DllCall(this.value, BCRYPT_ALG_HANDLE, hAlgorithm, IntPtr, pbBuffer, UInt32, cbBuffer, UInt32, dwFlags, NTSTATUS)
        NTSTATUS.ThrowIfError(result.value)
        return result
    }

    /**
     * A BCryptGenRandomFn that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends BCryptGenRandomFn {
        /**
         * Creates a BCryptGenRandomFn pointer that invokes the given AHK function when called.
         * @param {Func(BCRYPT_ALG_HANDLE, IntPtr, UInt32, UInt32) => NTSTATUS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [BCRYPT_ALG_HANDLE, IntPtr, UInt32, UInt32, NTSTATUS])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
