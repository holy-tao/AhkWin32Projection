#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\NTSTATUS.ahk" { NTSTATUS }
#Import ".\SecBufferDesc.ahk" { SecBufferDesc }

/**
 * Completes an authentication token.S
 * @remarks
 * SSP/APs must implement the <b>SpCompleteAuthToken</b> function; however, the actual name given to the implementation is up to the developer.
 * 
 * A pointer to the <b>SpCompleteAuthToken</b> function is available in the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/ns-ntsecpkg-secpkg_user_function_table">SECPKG_USER_FUNCTION_TABLE</a> structure received from the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-spusermodeinitializefn">SpUserModeInitialize</a> function.
 * @see https://learn.microsoft.com/windows/win32/api/ntsecpkg/nc-ntsecpkg-spcompleteauthtokenfn
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct SpCompleteAuthTokenFn {
    value : IntPtr

    __value {
        set {
            if (value is SpCompleteAuthTokenFn) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer} ContextHandle Handle of the context to complete.
     * @param {Pointer<SecBufferDesc>} InputBuffer Pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/sspi/ns-sspi-secbufferdesc">SecBufferDesc</a> structure that contains package-specific information for the context.
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
    Call(ContextHandle, InputBuffer) {
        result := DllCall(this.value, IntPtr, ContextHandle, SecBufferDesc.Ptr, InputBuffer, NTSTATUS)
        NTSTATUS.ThrowIfError(result)
        return result
    }

    /**
     * A SpCompleteAuthTokenFn that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends SpCompleteAuthTokenFn {
        /**
         * Creates a SpCompleteAuthTokenFn pointer that invokes the given AHK function when called.
         * @param {Func(IntPtr, SecBufferDesc) => NTSTATUS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [IntPtr, SecBufferDesc.Ptr, NTSTATUS])
        }

        __Delete() => CallbackFree(this.value)
    }
}
