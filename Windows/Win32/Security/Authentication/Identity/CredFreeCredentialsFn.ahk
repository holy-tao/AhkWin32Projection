#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\ENCRYPTED_CREDENTIALW.ahk" { ENCRYPTED_CREDENTIALW }

/**
 * Frees memory used to store credentials used by a security package.
 * @remarks
 * A pointer to the <b>CrediFreeCredentials</b> function is available in the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/ns-ntsecpkg-lsa_secpkg_function_table">LSA_SECPKG_FUNCTION_TABLE</a> structure received by the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-spinitializefn">SpInitialize</a> function.
 * @see https://learn.microsoft.com/windows/win32/api/ntsecpkg/nc-ntsecpkg-credfreecredentialsfn
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct CredFreeCredentialsFn {
    value : IntPtr

    __value {
        set {
            if (value is CredFreeCredentialsFn) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Integer} Count The number of elements in the <i>Credentials</i> array.
     * @param {Pointer<Pointer<ENCRYPTED_CREDENTIALW>>} Credentials A pointer to a pointer that, on input, points to an array of  <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/ns-ntsecpkg-encrypted_credentialw">ENCRYPTED_CREDENTIALW</a> structures to be freed.
     * @returns {String} Nothing - always returns an empty string
     */
    Call(Count, Credentials) {
        CredentialsMarshal := Credentials is VarRef ? "ptr*" : "ptr"

        DllCall(this.value, UInt32, Count, CredentialsMarshal, Credentials)
    }

    /**
     * A CredFreeCredentialsFn that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends CredFreeCredentialsFn {
        /**
         * Creates a CredFreeCredentialsFn pointer that invokes the given AHK function when called.
         * @param {Func(UInt32, "ptr*") => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [UInt32, "ptr*", IntPtr])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
