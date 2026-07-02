#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\LSA_UNICODE_STRING.ahk" { LSA_UNICODE_STRING }
#Import ".\SECURITY_LOGON_TYPE.ahk" { SECURITY_LOGON_TYPE }
#Import ".\SECPKG_SUPPLEMENTAL_CRED_ARRAY.ahk" { SECPKG_SUPPLEMENTAL_CRED_ARRAY }
#Import "..\..\..\Foundation\LUID.ahk" { LUID }
#Import ".\LSA_TOKEN_INFORMATION_TYPE.ahk" { LSA_TOKEN_INFORMATION_TYPE }
#Import "..\..\..\Foundation\NTSTATUS.ahk" { NTSTATUS }
#Import ".\SECPKG_PRIMARY_CRED.ahk" { SECPKG_PRIMARY_CRED }

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct PLSA_AP_LOGON_USER_EX2 {
    value : IntPtr

    __value {
        set {
            if (value is PLSA_AP_LOGON_USER_EX2) {
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
     * @param {Pointer<Pointer<Void>>} ProfileBuffer 
     * @param {Pointer<Integer>} ProfileBufferSize 
     * @param {Pointer<LUID>} LogonId 
     * @param {Pointer<Integer>} SubStatus 
     * @param {Pointer<LSA_TOKEN_INFORMATION_TYPE>} TokenInformationType 
     * @param {Pointer<Pointer<Void>>} TokenInformation 
     * @param {Pointer<Pointer<LSA_UNICODE_STRING>>} AccountName 
     * @param {Pointer<Pointer<LSA_UNICODE_STRING>>} AuthenticatingAuthority 
     * @param {Pointer<Pointer<LSA_UNICODE_STRING>>} MachineName 
     * @param {Pointer<SECPKG_PRIMARY_CRED>} PrimaryCredentials 
     * @param {Pointer<Pointer<SECPKG_SUPPLEMENTAL_CRED_ARRAY>>} SupplementalCredentials 
     * @returns {NTSTATUS} 
     */
    Call(ClientRequest, LogonType, ProtocolSubmitBuffer, ClientBufferBase, SubmitBufferSize, ProfileBuffer, ProfileBufferSize, LogonId, SubStatus, TokenInformationType, TokenInformation, AccountName, AuthenticatingAuthority, MachineName, PrimaryCredentials, SupplementalCredentials) {
        ClientRequestMarshal := ClientRequest is VarRef ? "ptr*" : "ptr"
        ClientBufferBaseMarshal := ClientBufferBase is VarRef ? "ptr" : "ptr"
        ProfileBufferMarshal := ProfileBuffer is VarRef ? "ptr*" : "ptr"
        ProfileBufferSizeMarshal := ProfileBufferSize is VarRef ? "uint*" : "ptr"
        SubStatusMarshal := SubStatus is VarRef ? "int*" : "ptr"
        TokenInformationTypeMarshal := TokenInformationType is VarRef ? "int*" : "ptr"
        TokenInformationMarshal := TokenInformation is VarRef ? "ptr*" : "ptr"
        AccountNameMarshal := AccountName is VarRef ? "ptr*" : "ptr"
        AuthenticatingAuthorityMarshal := AuthenticatingAuthority is VarRef ? "ptr*" : "ptr"
        MachineNameMarshal := MachineName is VarRef ? "ptr*" : "ptr"
        SupplementalCredentialsMarshal := SupplementalCredentials is VarRef ? "ptr*" : "ptr"

        result := DllCall(this.value, ClientRequestMarshal, ClientRequest, SECURITY_LOGON_TYPE, LogonType, IntPtr, ProtocolSubmitBuffer, ClientBufferBaseMarshal, ClientBufferBase, UInt32, SubmitBufferSize, ProfileBufferMarshal, ProfileBuffer, ProfileBufferSizeMarshal, ProfileBufferSize, LUID.Ptr, LogonId, SubStatusMarshal, SubStatus, TokenInformationTypeMarshal, TokenInformationType, TokenInformationMarshal, TokenInformation, AccountNameMarshal, AccountName, AuthenticatingAuthorityMarshal, AuthenticatingAuthority, MachineNameMarshal, MachineName, SECPKG_PRIMARY_CRED.Ptr, PrimaryCredentials, SupplementalCredentialsMarshal, SupplementalCredentials, NTSTATUS)
        NTSTATUS.ThrowIfError(result.value)
        return result
    }

    /**
     * A PLSA_AP_LOGON_USER_EX2 that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PLSA_AP_LOGON_USER_EX2 {
        /**
         * Creates a PLSA_AP_LOGON_USER_EX2 pointer that invokes the given AHK function when called.
         * @param {Func("ptr*", SECURITY_LOGON_TYPE, IntPtr, "ptr", UInt32, "ptr*", "uint*", LUID, "int*", "int*", "ptr*", "ptr*", "ptr*", "ptr*", SECPKG_PRIMARY_CRED, "ptr*") => NTSTATUS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 16)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 16 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr*", SECURITY_LOGON_TYPE, IntPtr, "ptr", UInt32, "ptr*", "uint*", LUID.Ptr, "int*", "int*", "ptr*", "ptr*", "ptr*", "ptr*", SECPKG_PRIMARY_CRED.Ptr, "ptr*", NTSTATUS])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
