#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\NTSTATUS.ahk" { NTSTATUS }

/**
 * Frees credentials acquired by calling the SpAcquireCredentialsHandle function.
 * @remarks
 * SSP/APs must implement the <b>SpFreeCredentialsHandle</b> function; however, the actual name given to the implementation is up to the developer.
 * 
 * A pointer to the <b>SpFreeCredentialsHandle</b> function is available in the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/ns-ntsecpkg-secpkg_function_table">SECPKG_FUNCTION_TABLE</a> structure received from the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-splsamodeinitializefn">SpLsaModeInitialize</a> function.
 * @see https://learn.microsoft.com/windows/win32/api/ntsecpkg/nc-ntsecpkg-spfreecredentialshandlefn
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct SpFreeCredentialsHandleFn {
    value : IntPtr

    __value {
        set {
            if (value is SpFreeCredentialsHandleFn) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer} CredentialHandle A handle to the credentials to free.
     * @returns {NTSTATUS} If the function succeeds, return STATUS_SUCCESS.
     * 
     * If the function fails, return an <b>NTSTATUS</b> code that indicates the reason it failed. The following  lists a common reason for failure and the error code that the function should return.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SEC_E_INVALID_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The handle is not valid.
     * 
     * </td>
     * </tr>
     * </table>
     */
    Call(CredentialHandle) {
        result := DllCall(this.value, IntPtr, CredentialHandle, NTSTATUS)
        NTSTATUS.ThrowIfError(result)
        return result
    }

    /**
     * A SpFreeCredentialsHandleFn that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends SpFreeCredentialsHandleFn {
        /**
         * Creates a SpFreeCredentialsHandleFn pointer that invokes the given AHK function when called.
         * @param {Func(IntPtr) => NTSTATUS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [IntPtr, NTSTATUS])
        }

        __Delete() => CallbackFree(this.value)
    }
}
