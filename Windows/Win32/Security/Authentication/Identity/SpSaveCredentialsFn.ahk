#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\NTSTATUS.ahk" { NTSTATUS }
#Import ".\SecBuffer.ahk" { SecBuffer }

/**
 * Saves a supplemental credential to the user object.
 * @remarks
 * SSP/APs must implement the <b>SpSaveCredentials</b> function; however, the actual name given to the implementation is up to the developer.
 * 
 * A pointer to the <b>SpSaveCredentials</b> function is available in the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/ns-ntsecpkg-secpkg_function_table">SECPKG_FUNCTION_TABLE</a> structure received from the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-splsamodeinitializefn">SpLsaModeInitialize</a> function.
 * @see https://learn.microsoft.com/windows/win32/api/ntsecpkg/nc-ntsecpkg-spsavecredentialsfn
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct SpSaveCredentialsFn {
    value : IntPtr

    __value {
        set {
            if (value is SpSaveCredentialsFn) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer} CredentialHandle A handle to the credential to save.
     * @param {Pointer<SecBuffer>} Credentials Pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/sspi/ns-sspi-secbuffer">SecBuffer</a> structure containing the credential information to be saved.
     * @returns {NTSTATUS} If the function succeeds, return STATUS_SUCCESS.
     * 
     * If the function fails, return an <b>NTSTATUS</b> code that indicates the reason it failed.
     */
    Call(CredentialHandle, Credentials) {
        result := DllCall(this.value, IntPtr, CredentialHandle, SecBuffer.Ptr, Credentials, NTSTATUS)
        NTSTATUS.ThrowIfError(result)
        return result
    }

    /**
     * A SpSaveCredentialsFn that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends SpSaveCredentialsFn {
        /**
         * Creates a SpSaveCredentialsFn pointer that invokes the given AHK function when called.
         * @param {Func(IntPtr, SecBuffer) => NTSTATUS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [IntPtr, SecBuffer.Ptr, NTSTATUS])
        }

        __Delete() => CallbackFree(this.value)
    }
}
