#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\NTSTATUS.ahk" { NTSTATUS }
#Import ".\BCRYPT_KEY_HANDLE.ahk" { BCRYPT_KEY_HANDLE }
#Import ".\BCryptBufferDesc.ahk" { BCryptBufferDesc }

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct BCryptKeyDerivationFn {
    value : IntPtr

    __value {
        set {
            if (value is BCryptKeyDerivationFn) {
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
     * @param {Pointer<BCryptBufferDesc>} pParameterList 
     * @param {Integer} pbDerivedKey 
     * @param {Integer} cbDerivedKey 
     * @param {Pointer<Integer>} pcbResult 
     * @param {Integer} dwFlags 
     * @returns {NTSTATUS} 
     */
    Call(_hKey, pParameterList, pbDerivedKey, cbDerivedKey, pcbResult, dwFlags) {
        pcbResultMarshal := pcbResult is VarRef ? "uint*" : "ptr"

        result := DllCall(this.value, BCRYPT_KEY_HANDLE, _hKey, BCryptBufferDesc.Ptr, pParameterList, IntPtr, pbDerivedKey, UInt32, cbDerivedKey, pcbResultMarshal, pcbResult, UInt32, dwFlags, NTSTATUS)
        NTSTATUS.ThrowIfError(result)
        return result
    }

    /**
     * A BCryptKeyDerivationFn that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends BCryptKeyDerivationFn {
        /**
         * Creates a BCryptKeyDerivationFn pointer that invokes the given AHK function when called.
         * @param {Func(BCRYPT_KEY_HANDLE, BCryptBufferDesc, IntPtr, UInt32, "uint*", UInt32) => NTSTATUS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 6)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 6 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [BCRYPT_KEY_HANDLE, BCryptBufferDesc.Ptr, IntPtr, UInt32, "uint*", UInt32, NTSTATUS])
        }

        __Delete() => CallbackFree(this.value)
    }
}
