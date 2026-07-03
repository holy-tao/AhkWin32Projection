#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\NTSTATUS.ahk" { NTSTATUS }
#Import ".\SecBuffer.ahk" { SecBuffer }

/**
 * Creates a user-mode security context from a packed Local Security Authority (LSA)-mode context.
 * @remarks
 * The <b>SpInitUserModeContext</b> function is called after a security context has been created by the security package, if the <i>MappedContext</i> parameter of the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-spinitlsamodecontextfn">SpInitLsaModeContext</a> or 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-spacceptlsamodecontextfn">SpAcceptLsaModeContext</a> is set to <b>TRUE</b>. The package-specific context data should contain the information required to determine which function resulted in the call to <b>SpInitUserModeContext</b>.
 * 
 * SSP/APs must implement the <b>SpInitUserModeContext</b> function; however, the actual name given to the implementation is up to the developer.
 * 
 * A pointer to the <b>SpInitUserModeContext</b> function is available in the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/ns-ntsecpkg-secpkg_user_function_table">SECPKG_USER_FUNCTION_TABLE</a> structure received from the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-spusermodeinitializefn">SpUserModeInitialize</a> function.
 * @see https://learn.microsoft.com/windows/win32/api/ntsecpkg/nc-ntsecpkg-spinitusermodecontextfn
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct SpInitUserModeContextFn {
    value : IntPtr

    __value {
        set {
            if (value is SpInitUserModeContextFn) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer} ContextHandle A handle to the LSA-mode context returned from the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-spinitlsamodecontextfn">SpInitLsaModeContext</a> or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-spacceptlsamodecontextfn">SpAcceptLsaModeContext</a> function.
     * @param {Pointer<SecBuffer>} PackedContext Pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/sspi/ns-sspi-secbuffer">SecBuffer</a> structure that contains the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">serialized</a> context data. Use the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-freecontextbuffer">FreeContextBuffer</a> function to free memory allocated for this structure.
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
     * <dt><b>STATUS_INSUFFICIENT_RESOURCES</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient memory to create the context.
     * 
     * </td>
     * </tr>
     * </table>
     */
    Call(ContextHandle, PackedContext) {
        result := DllCall(this.value, IntPtr, ContextHandle, SecBuffer.Ptr, PackedContext, NTSTATUS)
        NTSTATUS.ThrowIfError(result)
        return result
    }

    /**
     * A SpInitUserModeContextFn that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends SpInitUserModeContextFn {
        /**
         * Creates a SpInitUserModeContextFn pointer that invokes the given AHK function when called.
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
