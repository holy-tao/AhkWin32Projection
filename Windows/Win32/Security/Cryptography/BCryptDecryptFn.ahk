#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\NTSTATUS.ahk" { NTSTATUS }
#Import ".\BCRYPT_KEY_HANDLE.ahk" { BCRYPT_KEY_HANDLE }

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct BCryptDecryptFn {
    value : IntPtr

    __value {
        set {
            if (value is BCryptDecryptFn) {
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
     * @param {Integer} pbInput 
     * @param {Integer} cbInput 
     * @param {Pointer<Void>} pPaddingInfo 
     * @param {Integer} pbIV 
     * @param {Integer} cbIV 
     * @param {Integer} pbOutput 
     * @param {Integer} cbOutput 
     * @param {Pointer<Integer>} pcbResult 
     * @param {Integer} dwFlags 
     * @returns {NTSTATUS} 
     */
    Call(_hKey, pbInput, cbInput, pPaddingInfo, pbIV, cbIV, pbOutput, cbOutput, pcbResult, dwFlags) {
        pPaddingInfoMarshal := pPaddingInfo is VarRef ? "ptr" : "ptr"
        pcbResultMarshal := pcbResult is VarRef ? "uint*" : "ptr"

        result := DllCall(this.value, BCRYPT_KEY_HANDLE, _hKey, IntPtr, pbInput, UInt32, cbInput, pPaddingInfoMarshal, pPaddingInfo, IntPtr, pbIV, UInt32, cbIV, IntPtr, pbOutput, UInt32, cbOutput, pcbResultMarshal, pcbResult, UInt32, dwFlags, NTSTATUS)
        NTSTATUS.ThrowIfError(result)
        return result
    }

    /**
     * A BCryptDecryptFn that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends BCryptDecryptFn {
        /**
         * Creates a BCryptDecryptFn pointer that invokes the given AHK function when called.
         * @param {Func(BCRYPT_KEY_HANDLE, IntPtr, UInt32, "ptr", IntPtr, UInt32, IntPtr, UInt32, "uint*", UInt32) => NTSTATUS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 10)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 10 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [BCRYPT_KEY_HANDLE, IntPtr, UInt32, "ptr", IntPtr, UInt32, IntPtr, UInt32, "uint*", UInt32, NTSTATUS])
        }

        __Delete() => CallbackFree(this.value)
    }
}
