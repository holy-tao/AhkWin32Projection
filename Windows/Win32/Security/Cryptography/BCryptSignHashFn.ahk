#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\NTSTATUS.ahk" { NTSTATUS }
#Import ".\BCRYPT_KEY_HANDLE.ahk" { BCRYPT_KEY_HANDLE }

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct BCryptSignHashFn {
    value : IntPtr

    __value {
        set {
            if (value is BCryptSignHashFn) {
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
     * @param {Integer} pbInput 
     * @param {Integer} cbInput 
     * @param {Integer} pbOutput 
     * @param {Integer} cbOutput 
     * @param {Pointer<Integer>} pcbResult 
     * @param {Integer} dwFlags 
     * @returns {NTSTATUS} 
     */
    Call(_hKey, pPaddingInfo, pbInput, cbInput, pbOutput, cbOutput, pcbResult, dwFlags) {
        pPaddingInfoMarshal := pPaddingInfo is VarRef ? "ptr" : "ptr"
        pcbResultMarshal := pcbResult is VarRef ? "uint*" : "ptr"

        result := DllCall(this.value, BCRYPT_KEY_HANDLE, _hKey, pPaddingInfoMarshal, pPaddingInfo, IntPtr, pbInput, UInt32, cbInput, IntPtr, pbOutput, UInt32, cbOutput, pcbResultMarshal, pcbResult, UInt32, dwFlags, NTSTATUS)
        NTSTATUS.ThrowIfError(result.value)
        return result
    }

    /**
     * A BCryptSignHashFn that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends BCryptSignHashFn {
        /**
         * Creates a BCryptSignHashFn pointer that invokes the given AHK function when called.
         * @param {Func(BCRYPT_KEY_HANDLE, "ptr", IntPtr, UInt32, IntPtr, UInt32, "uint*", UInt32) => NTSTATUS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 8)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 8 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [BCRYPT_KEY_HANDLE, "ptr", IntPtr, UInt32, IntPtr, UInt32, "uint*", UInt32, NTSTATUS])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
