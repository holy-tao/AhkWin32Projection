#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\NTSTATUS.ahk" { NTSTATUS }
#Import ".\LSA_UNICODE_STRING.ahk" { LSA_UNICODE_STRING }

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct PSAM_CREDENTIAL_UPDATE_NOTIFY_ROUTINE {
    value : IntPtr

    __value {
        set {
            if (value is PSAM_CREDENTIAL_UPDATE_NOTIFY_ROUTINE) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<LSA_UNICODE_STRING>} ClearPassword 
     * @param {Integer} OldCredentials 
     * @param {Integer} OldCredentialSize 
     * @param {Integer} UserAccountControl 
     * @param {Pointer<LSA_UNICODE_STRING>} UPN 
     * @param {Pointer<LSA_UNICODE_STRING>} UserName 
     * @param {Pointer<LSA_UNICODE_STRING>} NetbiosDomainName 
     * @param {Pointer<LSA_UNICODE_STRING>} DnsDomainName 
     * @param {Pointer<Pointer<Void>>} NewCredentials 
     * @param {Pointer<Integer>} NewCredentialSize 
     * @returns {NTSTATUS} 
     */
    Call(ClearPassword, OldCredentials, OldCredentialSize, UserAccountControl, UPN, UserName, NetbiosDomainName, DnsDomainName, NewCredentials, NewCredentialSize) {
        NewCredentialsMarshal := NewCredentials is VarRef ? "ptr*" : "ptr"
        NewCredentialSizeMarshal := NewCredentialSize is VarRef ? "uint*" : "ptr"

        result := DllCall(this.value, LSA_UNICODE_STRING.Ptr, ClearPassword, IntPtr, OldCredentials, UInt32, OldCredentialSize, UInt32, UserAccountControl, LSA_UNICODE_STRING.Ptr, UPN, LSA_UNICODE_STRING.Ptr, UserName, LSA_UNICODE_STRING.Ptr, NetbiosDomainName, LSA_UNICODE_STRING.Ptr, DnsDomainName, NewCredentialsMarshal, NewCredentials, NewCredentialSizeMarshal, NewCredentialSize, NTSTATUS)
        NTSTATUS.ThrowIfError(result)
        return result
    }

    /**
     * A PSAM_CREDENTIAL_UPDATE_NOTIFY_ROUTINE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PSAM_CREDENTIAL_UPDATE_NOTIFY_ROUTINE {
        /**
         * Creates a PSAM_CREDENTIAL_UPDATE_NOTIFY_ROUTINE pointer that invokes the given AHK function when called.
         * @param {Func(LSA_UNICODE_STRING, IntPtr, UInt32, UInt32, LSA_UNICODE_STRING, LSA_UNICODE_STRING, LSA_UNICODE_STRING, LSA_UNICODE_STRING, "ptr*", "uint*") => NTSTATUS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 10)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 10 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [LSA_UNICODE_STRING.Ptr, IntPtr, UInt32, UInt32, LSA_UNICODE_STRING.Ptr, LSA_UNICODE_STRING.Ptr, LSA_UNICODE_STRING.Ptr, LSA_UNICODE_STRING.Ptr, "ptr*", "uint*", NTSTATUS])
        }

        __Delete() => CallbackFree(this.value)
    }
}
