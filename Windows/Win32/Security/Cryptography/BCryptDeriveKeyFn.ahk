#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\NTSTATUS.ahk" { NTSTATUS }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\BCRYPT_SECRET_HANDLE.ahk" { BCRYPT_SECRET_HANDLE }
#Import ".\BCryptBufferDesc.ahk" { BCryptBufferDesc }

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct BCryptDeriveKeyFn {
    value : IntPtr

    __value {
        set {
            if (value is BCryptDeriveKeyFn) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {BCRYPT_SECRET_HANDLE} hSharedSecret 
     * @param {PWSTR} pwszKDF 
     * @param {Pointer<BCryptBufferDesc>} pParameterList 
     * @param {Integer} pbDerivedKey 
     * @param {Integer} cbDerivedKey 
     * @param {Pointer<Integer>} pcbResult 
     * @param {Integer} dwFlags 
     * @returns {NTSTATUS} 
     */
    Call(hSharedSecret, pwszKDF, pParameterList, pbDerivedKey, cbDerivedKey, pcbResult, dwFlags) {
        pwszKDF := pwszKDF is String ? StrPtr(pwszKDF) : pwszKDF

        pcbResultMarshal := pcbResult is VarRef ? "uint*" : "ptr"

        result := DllCall(this.value, BCRYPT_SECRET_HANDLE, hSharedSecret, "ptr", pwszKDF, BCryptBufferDesc.Ptr, pParameterList, IntPtr, pbDerivedKey, UInt32, cbDerivedKey, pcbResultMarshal, pcbResult, UInt32, dwFlags, NTSTATUS)
        NTSTATUS.ThrowIfError(result)
        return result
    }

    /**
     * A BCryptDeriveKeyFn that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends BCryptDeriveKeyFn {
        /**
         * Creates a BCryptDeriveKeyFn pointer that invokes the given AHK function when called.
         * @param {Func(BCRYPT_SECRET_HANDLE, PWSTR, BCryptBufferDesc, IntPtr, UInt32, "uint*", UInt32) => NTSTATUS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 7)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 7 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [BCRYPT_SECRET_HANDLE, PWSTR, BCryptBufferDesc.Ptr, IntPtr, UInt32, "uint*", UInt32, NTSTATUS])
        }

        __Delete() => CallbackFree(this.value)
    }
}
