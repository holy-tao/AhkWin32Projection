#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\..\..\Foundation\LUID.ahk" { LUID }
#Import "..\..\..\Foundation\NTSTATUS.ahk" { NTSTATUS }
#Import ".\LSA_TOKEN_INFORMATION_TYPE.ahk" { LSA_TOKEN_INFORMATION_TYPE }
#Import ".\LSA_UNICODE_STRING.ahk" { LSA_UNICODE_STRING }
#Import ".\SECPKG_SESSIONINFO_TYPE.ahk" { SECPKG_SESSIONINFO_TYPE }
#Import ".\SECURITY_LOGON_TYPE.ahk" { SECURITY_LOGON_TYPE }
#Import "..\..\SECURITY_IMPERSONATION_LEVEL.ahk" { SECURITY_IMPERSONATION_LEVEL }
#Import "..\..\TOKEN_GROUPS.ahk" { TOKEN_GROUPS }
#Import "..\..\TOKEN_SOURCE.ahk" { TOKEN_SOURCE }

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct PLSA_CREATE_TOKEN_EX {
    value : IntPtr

    __value {
        set {
            if (value is PLSA_CREATE_TOKEN_EX) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<LUID>} LogonId 
     * @param {Pointer<TOKEN_SOURCE>} TokenSource 
     * @param {SECURITY_LOGON_TYPE} LogonType 
     * @param {SECURITY_IMPERSONATION_LEVEL} ImpersonationLevel 
     * @param {LSA_TOKEN_INFORMATION_TYPE} TokenInformationType 
     * @param {Pointer<Void>} TokenInformation 
     * @param {Pointer<TOKEN_GROUPS>} TokenGroups 
     * @param {Pointer<LSA_UNICODE_STRING>} Workstation 
     * @param {Pointer<LSA_UNICODE_STRING>} ProfilePath 
     * @param {Pointer<Void>} SessionInformation 
     * @param {SECPKG_SESSIONINFO_TYPE} SessionInformationType 
     * @param {Pointer<HANDLE>} Token 
     * @param {Pointer<Integer>} SubStatus 
     * @returns {NTSTATUS} 
     */
    Call(LogonId, TokenSource, LogonType, ImpersonationLevel, TokenInformationType, TokenInformation, TokenGroups, Workstation, ProfilePath, SessionInformation, SessionInformationType, Token, SubStatus) {
        TokenInformationMarshal := TokenInformation is VarRef ? "ptr" : "ptr"
        SessionInformationMarshal := SessionInformation is VarRef ? "ptr" : "ptr"
        SubStatusMarshal := SubStatus is VarRef ? "int*" : "ptr"

        result := DllCall(this.value, LUID.Ptr, LogonId, TOKEN_SOURCE.Ptr, TokenSource, SECURITY_LOGON_TYPE, LogonType, SECURITY_IMPERSONATION_LEVEL, ImpersonationLevel, LSA_TOKEN_INFORMATION_TYPE, TokenInformationType, TokenInformationMarshal, TokenInformation, TOKEN_GROUPS.Ptr, TokenGroups, LSA_UNICODE_STRING.Ptr, Workstation, LSA_UNICODE_STRING.Ptr, ProfilePath, SessionInformationMarshal, SessionInformation, SECPKG_SESSIONINFO_TYPE, SessionInformationType, HANDLE.Ptr, Token, SubStatusMarshal, SubStatus, NTSTATUS)
        NTSTATUS.ThrowIfError(result.value)
        return result
    }

    /**
     * A PLSA_CREATE_TOKEN_EX that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PLSA_CREATE_TOKEN_EX {
        /**
         * Creates a PLSA_CREATE_TOKEN_EX pointer that invokes the given AHK function when called.
         * @param {Func(LUID, TOKEN_SOURCE, SECURITY_LOGON_TYPE, SECURITY_IMPERSONATION_LEVEL, LSA_TOKEN_INFORMATION_TYPE, "ptr", TOKEN_GROUPS, LSA_UNICODE_STRING, LSA_UNICODE_STRING, "ptr", SECPKG_SESSIONINFO_TYPE, HANDLE, "int*") => NTSTATUS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 13)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 13 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [LUID.Ptr, TOKEN_SOURCE.Ptr, SECURITY_LOGON_TYPE, SECURITY_IMPERSONATION_LEVEL, LSA_TOKEN_INFORMATION_TYPE, "ptr", TOKEN_GROUPS.Ptr, LSA_UNICODE_STRING.Ptr, LSA_UNICODE_STRING.Ptr, "ptr", SECPKG_SESSIONINFO_TYPE, HANDLE.Ptr, "int*", NTSTATUS])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
