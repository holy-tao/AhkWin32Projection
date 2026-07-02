#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\BCRYPT_ASYMMETRIC_ENCRYPTION_FUNCTION_TABLE.ahk" { BCRYPT_ASYMMETRIC_ENCRYPTION_FUNCTION_TABLE }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\NTSTATUS.ahk" { NTSTATUS }

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct GetAsymmetricEncryptionInterfaceFn {
    value : IntPtr

    __value {
        set {
            if (value is GetAsymmetricEncryptionInterfaceFn) {
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
     * @param {PWSTR} pszAlgId 
     * @param {Pointer<Pointer<BCRYPT_ASYMMETRIC_ENCRYPTION_FUNCTION_TABLE>>} ppFunctionTable 
     * @param {Integer} dwFlags 
     * @returns {NTSTATUS} 
     */
    Call(pszProviderName, pszAlgId, ppFunctionTable, dwFlags) {
        pszProviderName := pszProviderName is String ? StrPtr(pszProviderName) : pszProviderName
        pszAlgId := pszAlgId is String ? StrPtr(pszAlgId) : pszAlgId

        ppFunctionTableMarshal := ppFunctionTable is VarRef ? "ptr*" : "ptr"

        result := DllCall(this.value, "ptr", pszProviderName, "ptr", pszAlgId, ppFunctionTableMarshal, ppFunctionTable, UInt32, dwFlags, NTSTATUS)
        NTSTATUS.ThrowIfError(result.value)
        return result
    }

    /**
     * A GetAsymmetricEncryptionInterfaceFn that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends GetAsymmetricEncryptionInterfaceFn {
        /**
         * Creates a GetAsymmetricEncryptionInterfaceFn pointer that invokes the given AHK function when called.
         * @param {Func(PWSTR, PWSTR, "ptr*", UInt32) => NTSTATUS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [PWSTR, PWSTR, "ptr*", UInt32, NTSTATUS])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
