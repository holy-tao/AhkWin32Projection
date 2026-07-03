#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\NCRYPT_PROV_HANDLE.ahk" { NCRYPT_PROV_HANDLE }

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct SslGetProviderPropertyFn {
    value : IntPtr

    __value {
        set {
            if (value is SslGetProviderPropertyFn) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {NCRYPT_PROV_HANDLE} hSslProvider 
     * @param {PWSTR} pszProperty 
     * @param {Pointer<Pointer<Integer>>} ppbOutput 
     * @param {Pointer<Integer>} pcbOutput 
     * @param {Pointer<Pointer<Void>>} ppEnumState 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     */
    Call(hSslProvider, pszProperty, ppbOutput, pcbOutput, ppEnumState, dwFlags) {
        pszProperty := pszProperty is String ? StrPtr(pszProperty) : pszProperty

        ppbOutputMarshal := ppbOutput is VarRef ? "ptr*" : "ptr"
        pcbOutputMarshal := pcbOutput is VarRef ? "uint*" : "ptr"
        ppEnumStateMarshal := ppEnumState is VarRef ? "ptr*" : "ptr"

        result := DllCall(this.value, NCRYPT_PROV_HANDLE, hSslProvider, "ptr", pszProperty, ppbOutputMarshal, ppbOutput, pcbOutputMarshal, pcbOutput, ppEnumStateMarshal, ppEnumState, UInt32, dwFlags, "HRESULT")
        return result
    }

    /**
     * A SslGetProviderPropertyFn that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends SslGetProviderPropertyFn {
        /**
         * Creates a SslGetProviderPropertyFn pointer that invokes the given AHK function when called.
         * @param {Func(NCRYPT_PROV_HANDLE, PWSTR, "ptr*", "uint*", "ptr*", UInt32) => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 6)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 6 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [NCRYPT_PROV_HANDLE, PWSTR, "ptr*", "uint*", "ptr*", UInt32, "int"])
        }

        __Delete() => CallbackFree(this.value)
    }
}
