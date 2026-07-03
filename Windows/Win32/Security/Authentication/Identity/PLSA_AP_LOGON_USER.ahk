#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\LUID.ahk" { LUID }
#Import "..\..\..\Foundation\NTSTATUS.ahk" { NTSTATUS }
#Import ".\LSA_TOKEN_INFORMATION_TYPE.ahk" { LSA_TOKEN_INFORMATION_TYPE }
#Import ".\LSA_UNICODE_STRING.ahk" { LSA_UNICODE_STRING }
#Import ".\SECURITY_LOGON_TYPE.ahk" { SECURITY_LOGON_TYPE }

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct PLSA_AP_LOGON_USER {
    value : IntPtr

    __value {
        set {
            if (value is PLSA_AP_LOGON_USER) {
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
     * @param {Integer} AuthenticationInformation 
     * @param {Pointer<Void>} ClientAuthenticationBase 
     * @param {Integer} AuthenticationInformationLength 
     * @param {Pointer<Pointer<Void>>} ProfileBuffer 
     * @param {Pointer<Integer>} ProfileBufferLength 
     * @param {Pointer<LUID>} LogonId 
     * @param {Pointer<Integer>} SubStatus 
     * @param {Pointer<LSA_TOKEN_INFORMATION_TYPE>} TokenInformationType 
     * @param {Pointer<Pointer<Void>>} TokenInformation 
     * @param {Pointer<Pointer<LSA_UNICODE_STRING>>} AccountName 
     * @param {Pointer<Pointer<LSA_UNICODE_STRING>>} AuthenticatingAuthority 
     * @returns {NTSTATUS} 
     */
    Call(ClientRequest, LogonType, AuthenticationInformation, ClientAuthenticationBase, AuthenticationInformationLength, ProfileBuffer, ProfileBufferLength, LogonId, SubStatus, TokenInformationType, TokenInformation, AccountName, AuthenticatingAuthority) {
        ClientRequestMarshal := ClientRequest is VarRef ? "ptr*" : "ptr"
        ClientAuthenticationBaseMarshal := ClientAuthenticationBase is VarRef ? "ptr" : "ptr"
        ProfileBufferMarshal := ProfileBuffer is VarRef ? "ptr*" : "ptr"
        ProfileBufferLengthMarshal := ProfileBufferLength is VarRef ? "uint*" : "ptr"
        SubStatusMarshal := SubStatus is VarRef ? "int*" : "ptr"
        TokenInformationTypeMarshal := TokenInformationType is VarRef ? "int*" : "ptr"
        TokenInformationMarshal := TokenInformation is VarRef ? "ptr*" : "ptr"
        AccountNameMarshal := AccountName is VarRef ? "ptr*" : "ptr"
        AuthenticatingAuthorityMarshal := AuthenticatingAuthority is VarRef ? "ptr*" : "ptr"

        result := DllCall(this.value, ClientRequestMarshal, ClientRequest, SECURITY_LOGON_TYPE, LogonType, IntPtr, AuthenticationInformation, ClientAuthenticationBaseMarshal, ClientAuthenticationBase, UInt32, AuthenticationInformationLength, ProfileBufferMarshal, ProfileBuffer, ProfileBufferLengthMarshal, ProfileBufferLength, LUID.Ptr, LogonId, SubStatusMarshal, SubStatus, TokenInformationTypeMarshal, TokenInformationType, TokenInformationMarshal, TokenInformation, AccountNameMarshal, AccountName, AuthenticatingAuthorityMarshal, AuthenticatingAuthority, NTSTATUS)
        NTSTATUS.ThrowIfError(result)
        return result
    }

    /**
     * A PLSA_AP_LOGON_USER that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PLSA_AP_LOGON_USER {
        /**
         * Creates a PLSA_AP_LOGON_USER pointer that invokes the given AHK function when called.
         * @param {Func("ptr*", SECURITY_LOGON_TYPE, IntPtr, "ptr", UInt32, "ptr*", "uint*", LUID, "int*", "int*", "ptr*", "ptr*", "ptr*") => NTSTATUS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 13)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 13 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr*", SECURITY_LOGON_TYPE, IntPtr, "ptr", UInt32, "ptr*", "uint*", LUID.Ptr, "int*", "int*", "ptr*", "ptr*", "ptr*", NTSTATUS])
        }

        __Delete() => CallbackFree(this.value)
    }
}
