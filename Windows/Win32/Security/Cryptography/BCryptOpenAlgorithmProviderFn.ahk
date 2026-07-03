#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\NTSTATUS.ahk" { NTSTATUS }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\BCRYPT_ALG_HANDLE.ahk" { BCRYPT_ALG_HANDLE }

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct BCryptOpenAlgorithmProviderFn {
    value : IntPtr

    __value {
        set {
            if (value is BCryptOpenAlgorithmProviderFn) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<BCRYPT_ALG_HANDLE>} phAlgorithm 
     * @param {PWSTR} pszAlgId 
     * @param {Integer} dwFlags 
     * @returns {NTSTATUS} 
     */
    Call(phAlgorithm, pszAlgId, dwFlags) {
        pszAlgId := pszAlgId is String ? StrPtr(pszAlgId) : pszAlgId

        result := DllCall(this.value, BCRYPT_ALG_HANDLE.Ptr, phAlgorithm, "ptr", pszAlgId, UInt32, dwFlags, NTSTATUS)
        NTSTATUS.ThrowIfError(result)
        return result
    }

    /**
     * A BCryptOpenAlgorithmProviderFn that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends BCryptOpenAlgorithmProviderFn {
        /**
         * Creates a BCryptOpenAlgorithmProviderFn pointer that invokes the given AHK function when called.
         * @param {Func(BCRYPT_ALG_HANDLE, PWSTR, UInt32) => NTSTATUS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [BCRYPT_ALG_HANDLE.Ptr, PWSTR, UInt32, NTSTATUS])
        }

        __Delete() => CallbackFree(this.value)
    }
}
