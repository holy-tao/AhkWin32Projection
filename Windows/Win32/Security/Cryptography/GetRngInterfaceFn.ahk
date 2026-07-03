#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\NTSTATUS.ahk" { NTSTATUS }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\BCRYPT_RNG_FUNCTION_TABLE.ahk" { BCRYPT_RNG_FUNCTION_TABLE }

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct GetRngInterfaceFn {
    value : IntPtr

    __value {
        set {
            if (value is GetRngInterfaceFn) {
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
     * @param {Pointer<Pointer<BCRYPT_RNG_FUNCTION_TABLE>>} ppFunctionTable 
     * @param {Integer} dwFlags 
     * @returns {NTSTATUS} 
     */
    Call(pszProviderName, ppFunctionTable, dwFlags) {
        pszProviderName := pszProviderName is String ? StrPtr(pszProviderName) : pszProviderName

        ppFunctionTableMarshal := ppFunctionTable is VarRef ? "ptr*" : "ptr"

        result := DllCall(this.value, "ptr", pszProviderName, ppFunctionTableMarshal, ppFunctionTable, UInt32, dwFlags, NTSTATUS)
        NTSTATUS.ThrowIfError(result)
        return result
    }

    /**
     * A GetRngInterfaceFn that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends GetRngInterfaceFn {
        /**
         * Creates a GetRngInterfaceFn pointer that invokes the given AHK function when called.
         * @param {Func(PWSTR, "ptr*", UInt32) => NTSTATUS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [PWSTR, "ptr*", UInt32, NTSTATUS])
        }

        __Delete() => CallbackFree(this.value)
    }
}
