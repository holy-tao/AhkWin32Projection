#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\NTSTATUS.ahk" { NTSTATUS }
#Import ".\SecBufferDesc.ahk" { SecBufferDesc }

/**
 * Applies a control token to a security context. This function is not currently called by the Local Security Authority (LSA).
 * @remarks
 * SSP/APs must implement the <b>SpApplyControlToken</b> function; however, the actual name given to the implementation is up to the developer.
 * 
 * A pointer to the <b>SpApplyControlToken</b> function is available in the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/ns-ntsecpkg-secpkg_function_table">SECPKG_FUNCTION_TABLE</a> structure received from the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-splsamodeinitializefn">SpLsaModeInitialize</a> function.
 * @see https://learn.microsoft.com/windows/win32/api/ntsecpkg/nc-ntsecpkg-spapplycontroltokenfn
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct SpApplyControlTokenFn {
    value : IntPtr

    __value {
        set {
            if (value is SpApplyControlTokenFn) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer} ContextHandle A handle to the security context to be modified based on the <i>ControlToken</i> parameter.
     * @param {Pointer<SecBufferDesc>} ControlToken Pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/sspi/ns-sspi-secbufferdesc">SecBufferDesc</a> structure containing the token to apply to the context.
     * @returns {NTSTATUS} If the function succeeds, return STATUS_SUCCESS.
     * 
     * If the function fails, return an <b>NTSTATUS</b> code that indicates the reason it failed. The following  lists common reasons for failure and the error codes that the function should return.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SEC_E_INVALID_TOKEN</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The token is not valid.
     * 
     * </td>
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
    Call(ContextHandle, ControlToken) {
        result := DllCall(this.value, IntPtr, ContextHandle, SecBufferDesc.Ptr, ControlToken, NTSTATUS)
        NTSTATUS.ThrowIfError(result)
        return result
    }

    /**
     * A SpApplyControlTokenFn that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends SpApplyControlTokenFn {
        /**
         * Creates a SpApplyControlTokenFn pointer that invokes the given AHK function when called.
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
