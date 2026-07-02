#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\SecBuffer.ahk" { SecBuffer }
#Import "..\..\..\Foundation\NTSTATUS.ahk" { NTSTATUS }

/**
 * Deletes credentials from a security package's list of primary or supplemental credentials.
 * @remarks
 * SSP/APs must implement the <b>SpDeleteCredentials</b> function; however, the actual name given to the implementation is up to the developer.
 * 
 * A pointer to the <b>SpDeleteCredentials</b> function is available in the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/ns-ntsecpkg-secpkg_function_table">SECPKG_FUNCTION_TABLE</a> structure received from the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-splsamodeinitializefn">SpLsaModeInitialize</a> function.
 * @see https://learn.microsoft.com/windows/win32/api/ntsecpkg/nc-ntsecpkg-spdeletecredentialsfn
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct SpDeleteCredentialsFn {
    value : IntPtr

    __value {
        set {
            if (value is SpDeleteCredentialsFn) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer} CredentialHandle A handle to the credentials to delete.
     * @param {Pointer<SecBuffer>} Key Pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/sspi/ns-sspi-secbuffer">SecBuffer</a> structure whose contents indicate which credentials to delete. The information stored in the <i>Key</i> parameter is package specific.
     * @returns {NTSTATUS} If the function succeeds, return STATUS_SUCCESS.
     * 
     * If the function fails, return an <b>NTSTATUS</b> code that indicates the reason it failed.
     */
    Call(CredentialHandle, Key) {
        result := DllCall(this.value, IntPtr, CredentialHandle, SecBuffer.Ptr, Key, NTSTATUS)
        NTSTATUS.ThrowIfError(result.value)
        return result
    }

    /**
     * A SpDeleteCredentialsFn that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends SpDeleteCredentialsFn {
        /**
         * Creates a SpDeleteCredentialsFn pointer that invokes the given AHK function when called.
         * @param {Func(IntPtr, SecBuffer) => NTSTATUS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [IntPtr, SecBuffer.Ptr, NTSTATUS])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
