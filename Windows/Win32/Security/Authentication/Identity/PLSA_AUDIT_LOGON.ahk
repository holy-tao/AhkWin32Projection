#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\LUID.ahk" { LUID }
#Import "..\..\..\Foundation\NTSTATUS.ahk" { NTSTATUS }
#Import ".\LSA_UNICODE_STRING.ahk" { LSA_UNICODE_STRING }
#Import ".\SECURITY_LOGON_TYPE.ahk" { SECURITY_LOGON_TYPE }
#Import "..\..\PSID.ahk" { PSID }
#Import "..\..\TOKEN_SOURCE.ahk" { TOKEN_SOURCE }

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct PLSA_AUDIT_LOGON {
    value : IntPtr

    __value {
        set {
            if (value is PLSA_AUDIT_LOGON) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {NTSTATUS} _Status 
     * @param {NTSTATUS} SubStatus 
     * @param {Pointer<LSA_UNICODE_STRING>} AccountName 
     * @param {Pointer<LSA_UNICODE_STRING>} AuthenticatingAuthority 
     * @param {Pointer<LSA_UNICODE_STRING>} WorkstationName 
     * @param {PSID} UserSid 
     * @param {SECURITY_LOGON_TYPE} LogonType 
     * @param {Pointer<TOKEN_SOURCE>} TokenSource 
     * @param {Pointer<LUID>} LogonId 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(_Status, SubStatus, AccountName, AuthenticatingAuthority, WorkstationName, UserSid, LogonType, TokenSource, LogonId) {
        DllCall(this.value, NTSTATUS, _Status, NTSTATUS, SubStatus, LSA_UNICODE_STRING.Ptr, AccountName, LSA_UNICODE_STRING.Ptr, AuthenticatingAuthority, LSA_UNICODE_STRING.Ptr, WorkstationName, PSID, UserSid, SECURITY_LOGON_TYPE, LogonType, TOKEN_SOURCE.Ptr, TokenSource, LUID.Ptr, LogonId)
    }

    /**
     * A PLSA_AUDIT_LOGON that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PLSA_AUDIT_LOGON {
        /**
         * Creates a PLSA_AUDIT_LOGON pointer that invokes the given AHK function when called.
         * @param {Func(NTSTATUS, NTSTATUS, LSA_UNICODE_STRING, LSA_UNICODE_STRING, LSA_UNICODE_STRING, PSID, SECURITY_LOGON_TYPE, TOKEN_SOURCE, LUID) => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 9)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 9 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [NTSTATUS, NTSTATUS, LSA_UNICODE_STRING.Ptr, LSA_UNICODE_STRING.Ptr, LSA_UNICODE_STRING.Ptr, PSID, SECURITY_LOGON_TYPE, TOKEN_SOURCE.Ptr, LUID.Ptr, IntPtr])
        }

        __Delete() => CallbackFree(this.value)
    }
}
