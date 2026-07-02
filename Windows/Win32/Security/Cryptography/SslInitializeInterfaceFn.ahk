#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\NCRYPT_SSL_FUNCTION_TABLE.ahk" { NCRYPT_SSL_FUNCTION_TABLE }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct SslInitializeInterfaceFn {
    value : IntPtr

    __value {
        set {
            if (value is SslInitializeInterfaceFn) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {PWSTR} pszProviderName 
     * @param {Pointer<NCRYPT_SSL_FUNCTION_TABLE>} pFunctionTable 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     */
    Call(pszProviderName, pFunctionTable, dwFlags) {
        pszProviderName := pszProviderName is String ? StrPtr(pszProviderName) : pszProviderName

        result := DllCall(this.value, "ptr", pszProviderName, NCRYPT_SSL_FUNCTION_TABLE.Ptr, pFunctionTable, UInt32, dwFlags, "HRESULT")
        return result
    }

    /**
     * A SslInitializeInterfaceFn that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends SslInitializeInterfaceFn {
        /**
         * Creates a SslInitializeInterfaceFn pointer that invokes the given AHK function when called.
         * @param {Func(PWSTR, NCRYPT_SSL_FUNCTION_TABLE, UInt32) => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [PWSTR, NCRYPT_SSL_FUNCTION_TABLE.Ptr, UInt32, "int"])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
