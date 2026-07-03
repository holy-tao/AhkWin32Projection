#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\NCRYPT_KEY_HANDLE.ahk" { NCRYPT_KEY_HANDLE }

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct SslGetKeyPropertyFn {
    value : IntPtr

    __value {
        set {
            if (value is SslGetKeyPropertyFn) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {NCRYPT_KEY_HANDLE} _hKey 
     * @param {PWSTR} pszProperty 
     * @param {Pointer<Pointer<Integer>>} ppbOutput 
     * @param {Pointer<Integer>} pcbOutput 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     */
    Call(_hKey, pszProperty, ppbOutput, pcbOutput, dwFlags) {
        pszProperty := pszProperty is String ? StrPtr(pszProperty) : pszProperty

        ppbOutputMarshal := ppbOutput is VarRef ? "ptr*" : "ptr"
        pcbOutputMarshal := pcbOutput is VarRef ? "uint*" : "ptr"

        result := DllCall(this.value, NCRYPT_KEY_HANDLE, _hKey, "ptr", pszProperty, ppbOutputMarshal, ppbOutput, pcbOutputMarshal, pcbOutput, UInt32, dwFlags, "HRESULT")
        return result
    }

    /**
     * A SslGetKeyPropertyFn that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends SslGetKeyPropertyFn {
        /**
         * Creates a SslGetKeyPropertyFn pointer that invokes the given AHK function when called.
         * @param {Func(NCRYPT_KEY_HANDLE, PWSTR, "ptr*", "uint*", UInt32) => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 5)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 5 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [NCRYPT_KEY_HANDLE, PWSTR, "ptr*", "uint*", UInt32, "int"])
        }

        __Delete() => CallbackFree(this.value)
    }
}
