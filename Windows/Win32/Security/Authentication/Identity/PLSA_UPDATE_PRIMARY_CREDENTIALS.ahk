#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\NTSTATUS.ahk" { NTSTATUS }
#Import ".\SECPKG_PRIMARY_CRED.ahk" { SECPKG_PRIMARY_CRED }
#Import ".\SECPKG_SUPPLEMENTAL_CRED_ARRAY.ahk" { SECPKG_SUPPLEMENTAL_CRED_ARRAY }

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct PLSA_UPDATE_PRIMARY_CREDENTIALS {
    value : IntPtr

    __value {
        set {
            if (value is PLSA_UPDATE_PRIMARY_CREDENTIALS) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<SECPKG_PRIMARY_CRED>} PrimaryCredentials 
     * @param {Pointer<SECPKG_SUPPLEMENTAL_CRED_ARRAY>} Credentials 
     * @returns {NTSTATUS} 
     */
    Call(PrimaryCredentials, Credentials) {
        result := DllCall(this.value, SECPKG_PRIMARY_CRED.Ptr, PrimaryCredentials, SECPKG_SUPPLEMENTAL_CRED_ARRAY.Ptr, Credentials, NTSTATUS)
        NTSTATUS.ThrowIfError(result.value)
        return result
    }

    /**
     * A PLSA_UPDATE_PRIMARY_CREDENTIALS that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PLSA_UPDATE_PRIMARY_CREDENTIALS {
        /**
         * Creates a PLSA_UPDATE_PRIMARY_CREDENTIALS pointer that invokes the given AHK function when called.
         * @param {Func(SECPKG_PRIMARY_CRED, SECPKG_SUPPLEMENTAL_CRED_ARRAY) => NTSTATUS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [SECPKG_PRIMARY_CRED.Ptr, SECPKG_SUPPLEMENTAL_CRED_ARRAY.Ptr, NTSTATUS])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
