#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\..\..\Foundation\NTSTATUS.ahk" { NTSTATUS }
#Import ".\SecBuffer.ahk" { SecBuffer }

/**
 * Exports a security context to another process.
 * @remarks
 * To import a previously exported security context use the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-spimportsecuritycontextfn">SpImportSecurityContext</a> function.
 * 
 * SSP/APs must implement the <b>SpExportSecurityContext</b> function; however, the actual name given to the implementation is up to the developer.
 * 
 * A pointer to the <b>SpExportSecurityContext</b> function is available in the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/ns-ntsecpkg-secpkg_user_function_table">SECPKG_USER_FUNCTION_TABLE</a> structure received from the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-spusermodeinitializefn">SpUserModeInitialize</a> function.
 * @see https://learn.microsoft.com/windows/win32/api/ntsecpkg/nc-ntsecpkg-spexportsecuritycontextfn
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct SpExportSecurityContextFn {
    value : IntPtr

    __value {
        set {
            if (value is SpExportSecurityContextFn) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer} phContext A handle to the security context to export.
     * @param {Integer} fFlags Optional. Specifies context duplication options. The following table lists the valid values which are defined in Sspi.h. 
     * 
     * 
     * 
     * 
     * 					
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SECPKG_CONTEXT_EXPORT_RESET_NEW"></a><a id="secpkg_context_export_reset_new"></a><dl>
     * <dt><b>SECPKG_CONTEXT_EXPORT_RESET_NEW</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * New context is reset to initial state.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SECPKG_CONTEXT_EXPORT_DELETE_OLD"></a><a id="secpkg_context_export_delete_old"></a><dl>
     * <dt><b>SECPKG_CONTEXT_EXPORT_DELETE_OLD</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Old context is deleted during export.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Pointer<SecBuffer>} pPackedContext Pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/sspi/ns-sspi-secbuffer">SecBuffer</a> structure containing the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">serialized</a> context. Resources should be allocated using the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-lsa_allocate_client_buffer">AllocateClientBuffer</a> function, and freed by the caller using the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-freecontextbuffer">FreeContextBuffer</a> function.
     * @param {Pointer<HANDLE>} pToken Optional. Pointer to a handle that receives the context's token.
     * @returns {NTSTATUS} If the function succeeds, return STATUS_SUCCESS.
     * 
     * If the function fails, return an <b>NTSTATUS</b> code that indicates the reason it failed.
     */
    Call(phContext, fFlags, pPackedContext, pToken) {
        result := DllCall(this.value, IntPtr, phContext, UInt32, fFlags, SecBuffer.Ptr, pPackedContext, HANDLE.Ptr, pToken, NTSTATUS)
        NTSTATUS.ThrowIfError(result)
        return result
    }

    /**
     * A SpExportSecurityContextFn that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends SpExportSecurityContextFn {
        /**
         * Creates a SpExportSecurityContextFn pointer that invokes the given AHK function when called.
         * @param {Func(IntPtr, UInt32, SecBuffer, HANDLE) => NTSTATUS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [IntPtr, UInt32, SecBuffer.Ptr, HANDLE.Ptr, NTSTATUS])
        }

        __Delete() => CallbackFree(this.value)
    }
}
