#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\NTSTATUS.ahk" { NTSTATUS }
#Import ".\SecBuffer.ahk" { SecBuffer }

/**
 * Formats credentials to be stored in a user object.
 * @remarks
 * SSP/APs must implement the <b>SpFormatCredentials</b> function; however, the actual name given to the implementation is up to the developer.
 * 
 * A pointer to the <b>SpFormatCredentials</b> function is available in the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/ns-ntsecpkg-secpkg_user_function_table">SECPKG_USER_FUNCTION_TABLE</a> structure received from the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-spusermodeinitializefn">SpUserModeInitialize</a> function.
 * @see https://learn.microsoft.com/windows/win32/api/ntsecpkg/nc-ntsecpkg-spformatcredentialsfn
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct SpFormatCredentialsFn {
    value : IntPtr

    __value {
        set {
            if (value is SpFormatCredentialsFn) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<SecBuffer>} Credentials Pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/sspi/ns-sspi-secbuffer">SecBuffer</a> structure containing the credentials to be formatted.
     * @param {Pointer<SecBuffer>} FormattedCredentials Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/sspi/ns-sspi-secbuffer">SecBuffer</a> structure containing the formatted credentials. Allocate memory for the structure using the 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa374721(v=vs.85)">AllocateHeap</a> function.
     * @returns {NTSTATUS} If the function succeeds, return STATUS_SUCCESS.
     * 
     * If the function fails, return an <b>NTSTATUS</b> code that indicates the reason it failed.
     */
    Call(Credentials, FormattedCredentials) {
        result := DllCall(this.value, SecBuffer.Ptr, Credentials, SecBuffer.Ptr, FormattedCredentials, NTSTATUS)
        NTSTATUS.ThrowIfError(result.value)
        return result
    }

    /**
     * A SpFormatCredentialsFn that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends SpFormatCredentialsFn {
        /**
         * Creates a SpFormatCredentialsFn pointer that invokes the given AHK function when called.
         * @param {Func(SecBuffer, SecBuffer) => NTSTATUS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [SecBuffer.Ptr, SecBuffer.Ptr, NTSTATUS])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
