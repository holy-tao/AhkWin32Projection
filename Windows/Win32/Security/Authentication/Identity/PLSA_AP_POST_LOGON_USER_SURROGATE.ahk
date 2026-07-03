#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\LUID.ahk" { LUID }
#Import "..\..\..\Foundation\NTSTATUS.ahk" { NTSTATUS }
#Import ".\LSA_TOKEN_INFORMATION_TYPE.ahk" { LSA_TOKEN_INFORMATION_TYPE }
#Import ".\LSA_UNICODE_STRING.ahk" { LSA_UNICODE_STRING }
#Import ".\SECPKG_PRIMARY_CRED.ahk" { SECPKG_PRIMARY_CRED }
#Import ".\SECPKG_SUPPLEMENTAL_CRED_ARRAY.ahk" { SECPKG_SUPPLEMENTAL_CRED_ARRAY }
#Import ".\SECPKG_SURROGATE_LOGON.ahk" { SECPKG_SURROGATE_LOGON }
#Import ".\SECURITY_LOGON_TYPE.ahk" { SECURITY_LOGON_TYPE }

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct PLSA_AP_POST_LOGON_USER_SURROGATE {
    value : IntPtr

    __value {
        set {
            if (value is PLSA_AP_POST_LOGON_USER_SURROGATE) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Pointer<Void>>} ClientRequest 
     * @param {SECURITY_LOGON_TYPE} LogonType 
     * @param {Integer} ProtocolSubmitBuffer 
     * @param {Pointer<Void>} ClientBufferBase 
     * @param {Integer} SubmitBufferSize 
     * @param {Pointer<SECPKG_SURROGATE_LOGON>} SurrogateLogon 
     * @param {Integer} ProfileBuffer 
     * @param {Integer} ProfileBufferSize 
     * @param {Pointer<LUID>} LogonId 
     * @param {NTSTATUS} _Status 
     * @param {NTSTATUS} SubStatus 
     * @param {LSA_TOKEN_INFORMATION_TYPE} TokenInformationType 
     * @param {Pointer<Void>} TokenInformation 
     * @param {Pointer<LSA_UNICODE_STRING>} AccountName 
     * @param {Pointer<LSA_UNICODE_STRING>} AuthenticatingAuthority 
     * @param {Pointer<LSA_UNICODE_STRING>} MachineName 
     * @param {Pointer<SECPKG_PRIMARY_CRED>} PrimaryCredentials 
     * @param {Pointer<SECPKG_SUPPLEMENTAL_CRED_ARRAY>} SupplementalCredentials 
     * @returns {NTSTATUS} 
     */
    Call(ClientRequest, LogonType, ProtocolSubmitBuffer, ClientBufferBase, SubmitBufferSize, SurrogateLogon, ProfileBuffer, ProfileBufferSize, LogonId, _Status, SubStatus, TokenInformationType, TokenInformation, AccountName, AuthenticatingAuthority, MachineName, PrimaryCredentials, SupplementalCredentials) {
        ClientRequestMarshal := ClientRequest is VarRef ? "ptr*" : "ptr"
        ClientBufferBaseMarshal := ClientBufferBase is VarRef ? "ptr" : "ptr"
        TokenInformationMarshal := TokenInformation is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, ClientRequestMarshal, ClientRequest, SECURITY_LOGON_TYPE, LogonType, IntPtr, ProtocolSubmitBuffer, ClientBufferBaseMarshal, ClientBufferBase, UInt32, SubmitBufferSize, SECPKG_SURROGATE_LOGON.Ptr, SurrogateLogon, IntPtr, ProfileBuffer, UInt32, ProfileBufferSize, LUID.Ptr, LogonId, NTSTATUS, _Status, NTSTATUS, SubStatus, LSA_TOKEN_INFORMATION_TYPE, TokenInformationType, TokenInformationMarshal, TokenInformation, LSA_UNICODE_STRING.Ptr, AccountName, LSA_UNICODE_STRING.Ptr, AuthenticatingAuthority, LSA_UNICODE_STRING.Ptr, MachineName, SECPKG_PRIMARY_CRED.Ptr, PrimaryCredentials, SECPKG_SUPPLEMENTAL_CRED_ARRAY.Ptr, SupplementalCredentials, NTSTATUS)
        NTSTATUS.ThrowIfError(result.value)
        return result
    }

    /**
     * A PLSA_AP_POST_LOGON_USER_SURROGATE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PLSA_AP_POST_LOGON_USER_SURROGATE {
        /**
         * Creates a PLSA_AP_POST_LOGON_USER_SURROGATE pointer that invokes the given AHK function when called.
         * @param {Func("ptr*", SECURITY_LOGON_TYPE, IntPtr, "ptr", UInt32, SECPKG_SURROGATE_LOGON, IntPtr, UInt32, LUID, NTSTATUS, NTSTATUS, LSA_TOKEN_INFORMATION_TYPE, "ptr", LSA_UNICODE_STRING, LSA_UNICODE_STRING, LSA_UNICODE_STRING, SECPKG_PRIMARY_CRED, SECPKG_SUPPLEMENTAL_CRED_ARRAY) => NTSTATUS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 18)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 18 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr*", SECURITY_LOGON_TYPE, IntPtr, "ptr", UInt32, SECPKG_SURROGATE_LOGON.Ptr, IntPtr, UInt32, LUID.Ptr, NTSTATUS, NTSTATUS, LSA_TOKEN_INFORMATION_TYPE, "ptr", LSA_UNICODE_STRING.Ptr, LSA_UNICODE_STRING.Ptr, LSA_UNICODE_STRING.Ptr, SECPKG_PRIMARY_CRED.Ptr, SECPKG_SUPPLEMENTAL_CRED_ARRAY.Ptr, NTSTATUS])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
