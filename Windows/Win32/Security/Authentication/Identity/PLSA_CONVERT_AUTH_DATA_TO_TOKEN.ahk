#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\..\..\Foundation\LUID.ahk" { LUID }
#Import "..\..\..\Foundation\NTSTATUS.ahk" { NTSTATUS }
#Import ".\LSA_UNICODE_STRING.ahk" { LSA_UNICODE_STRING }
#Import ".\SECURITY_LOGON_TYPE.ahk" { SECURITY_LOGON_TYPE }
#Import "..\..\SECURITY_IMPERSONATION_LEVEL.ahk" { SECURITY_IMPERSONATION_LEVEL }
#Import "..\..\TOKEN_SOURCE.ahk" { TOKEN_SOURCE }

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct PLSA_CONVERT_AUTH_DATA_TO_TOKEN {
    value : IntPtr

    __value {
        set {
            if (value is PLSA_CONVERT_AUTH_DATA_TO_TOKEN) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Void>} UserAuthData 
     * @param {Integer} UserAuthDataSize 
     * @param {SECURITY_IMPERSONATION_LEVEL} ImpersonationLevel 
     * @param {Pointer<TOKEN_SOURCE>} TokenSource 
     * @param {SECURITY_LOGON_TYPE} LogonType 
     * @param {Pointer<LSA_UNICODE_STRING>} AuthorityName 
     * @param {Pointer<HANDLE>} Token 
     * @param {Pointer<LUID>} LogonId 
     * @param {Pointer<LSA_UNICODE_STRING>} AccountName 
     * @param {Pointer<Integer>} SubStatus 
     * @returns {NTSTATUS} 
     */
    Call(UserAuthData, UserAuthDataSize, ImpersonationLevel, TokenSource, LogonType, AuthorityName, Token, LogonId, AccountName, SubStatus) {
        UserAuthDataMarshal := UserAuthData is VarRef ? "ptr" : "ptr"
        SubStatusMarshal := SubStatus is VarRef ? "int*" : "ptr"

        result := DllCall(this.value, UserAuthDataMarshal, UserAuthData, UInt32, UserAuthDataSize, SECURITY_IMPERSONATION_LEVEL, ImpersonationLevel, TOKEN_SOURCE.Ptr, TokenSource, SECURITY_LOGON_TYPE, LogonType, LSA_UNICODE_STRING.Ptr, AuthorityName, HANDLE.Ptr, Token, LUID.Ptr, LogonId, LSA_UNICODE_STRING.Ptr, AccountName, SubStatusMarshal, SubStatus, NTSTATUS)
        NTSTATUS.ThrowIfError(result.value)
        return result
    }

    /**
     * A PLSA_CONVERT_AUTH_DATA_TO_TOKEN that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PLSA_CONVERT_AUTH_DATA_TO_TOKEN {
        /**
         * Creates a PLSA_CONVERT_AUTH_DATA_TO_TOKEN pointer that invokes the given AHK function when called.
         * @param {Func("ptr", UInt32, SECURITY_IMPERSONATION_LEVEL, TOKEN_SOURCE, SECURITY_LOGON_TYPE, LSA_UNICODE_STRING, HANDLE, LUID, LSA_UNICODE_STRING, "int*") => NTSTATUS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 10)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 10 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", UInt32, SECURITY_IMPERSONATION_LEVEL, TOKEN_SOURCE.Ptr, SECURITY_LOGON_TYPE, LSA_UNICODE_STRING.Ptr, HANDLE.Ptr, LUID.Ptr, LSA_UNICODE_STRING.Ptr, "int*", NTSTATUS])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
