#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\FILETIME.ahk" { FILETIME }
#Import "..\..\..\Foundation\NTSTATUS.ahk" { NTSTATUS }
#Import ".\CRED_FETCH.ahk" { CRED_FETCH }
#Import ".\LSA_UNICODE_STRING.ahk" { LSA_UNICODE_STRING }

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct PLSA_GET_SERVICE_ACCOUNT_PASSWORD {
    value : IntPtr

    __value {
        set {
            if (value is PLSA_GET_SERVICE_ACCOUNT_PASSWORD) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<LSA_UNICODE_STRING>} AccountName 
     * @param {Pointer<LSA_UNICODE_STRING>} DomainName 
     * @param {CRED_FETCH} CredFetch 
     * @param {Pointer<FILETIME>} FileTimeExpiry 
     * @param {Pointer<LSA_UNICODE_STRING>} CurrentPassword 
     * @param {Pointer<LSA_UNICODE_STRING>} PreviousPassword 
     * @param {Pointer<FILETIME>} FileTimeCurrPwdValidForOutbound 
     * @returns {NTSTATUS} 
     */
    Call(AccountName, DomainName, CredFetch, FileTimeExpiry, CurrentPassword, PreviousPassword, FileTimeCurrPwdValidForOutbound) {
        result := DllCall(this.value, LSA_UNICODE_STRING.Ptr, AccountName, LSA_UNICODE_STRING.Ptr, DomainName, CRED_FETCH, CredFetch, FILETIME.Ptr, FileTimeExpiry, LSA_UNICODE_STRING.Ptr, CurrentPassword, LSA_UNICODE_STRING.Ptr, PreviousPassword, FILETIME.Ptr, FileTimeCurrPwdValidForOutbound, NTSTATUS)
        NTSTATUS.ThrowIfError(result.value)
        return result
    }

    /**
     * A PLSA_GET_SERVICE_ACCOUNT_PASSWORD that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PLSA_GET_SERVICE_ACCOUNT_PASSWORD {
        /**
         * Creates a PLSA_GET_SERVICE_ACCOUNT_PASSWORD pointer that invokes the given AHK function when called.
         * @param {Func(LSA_UNICODE_STRING, LSA_UNICODE_STRING, CRED_FETCH, FILETIME, LSA_UNICODE_STRING, LSA_UNICODE_STRING, FILETIME) => NTSTATUS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 7)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 7 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [LSA_UNICODE_STRING.Ptr, LSA_UNICODE_STRING.Ptr, CRED_FETCH, FILETIME.Ptr, LSA_UNICODE_STRING.Ptr, LSA_UNICODE_STRING.Ptr, FILETIME.Ptr, NTSTATUS])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
