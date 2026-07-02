#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\NCRYPT_PROV_HANDLE.ahk" { NCRYPT_PROV_HANDLE }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\NCryptKeyName.ahk" { NCryptKeyName }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct NCryptEnumKeysFn {
    value : IntPtr

    __value {
        set {
            if (value is NCryptEnumKeysFn) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {NCRYPT_PROV_HANDLE} _hProvider 
     * @param {PWSTR} pszScope 
     * @param {Pointer<Pointer<Void>>} ppEnumState 
     * @param {Integer} dwFlags 
     * @returns {Pointer<NCryptKeyName>} 
     */
    Call(_hProvider, pszScope, ppEnumState, dwFlags) {
        pszScope := pszScope is String ? StrPtr(pszScope) : pszScope

        ppEnumStateMarshal := ppEnumState is VarRef ? "ptr*" : "ptr"

        result := DllCall(this.value, NCRYPT_PROV_HANDLE, _hProvider, "ptr", pszScope, "ptr*", &ppKeyName := 0, ppEnumStateMarshal, ppEnumState, UInt32, dwFlags, "HRESULT")
        return ppKeyName
    }

    /**
     * A NCryptEnumKeysFn that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends NCryptEnumKeysFn {
        /**
         * Creates a NCryptEnumKeysFn pointer that invokes the given AHK function when called.
         * @param {Func(NCRYPT_PROV_HANDLE, PWSTR, "ptr*", UInt32) => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [NCRYPT_PROV_HANDLE, PWSTR, "ptr*", UInt32, "int"])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
