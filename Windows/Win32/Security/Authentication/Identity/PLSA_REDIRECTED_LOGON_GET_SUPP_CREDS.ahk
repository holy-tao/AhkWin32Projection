#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import ".\SECPKG_SUPPLEMENTAL_CRED_ARRAY.ahk" { SECPKG_SUPPLEMENTAL_CRED_ARRAY }
#Import "..\..\..\Foundation\NTSTATUS.ahk" { NTSTATUS }

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct PLSA_REDIRECTED_LOGON_GET_SUPP_CREDS {
    value : IntPtr

    __value {
        set {
            if (value is PLSA_REDIRECTED_LOGON_GET_SUPP_CREDS) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {HANDLE} RedirectedLogonHandle 
     * @param {Pointer<Pointer<SECPKG_SUPPLEMENTAL_CRED_ARRAY>>} SupplementalCredentials 
     * @returns {NTSTATUS} 
     */
    Call(RedirectedLogonHandle, SupplementalCredentials) {
        SupplementalCredentialsMarshal := SupplementalCredentials is VarRef ? "ptr*" : "ptr"

        result := DllCall(this.value, HANDLE, RedirectedLogonHandle, SupplementalCredentialsMarshal, SupplementalCredentials, NTSTATUS)
        NTSTATUS.ThrowIfError(result.value)
        return result
    }

    /**
     * A PLSA_REDIRECTED_LOGON_GET_SUPP_CREDS that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PLSA_REDIRECTED_LOGON_GET_SUPP_CREDS {
        /**
         * Creates a PLSA_REDIRECTED_LOGON_GET_SUPP_CREDS pointer that invokes the given AHK function when called.
         * @param {Func(HANDLE, "ptr*") => NTSTATUS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HANDLE, "ptr*", NTSTATUS])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
