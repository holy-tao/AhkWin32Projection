#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\NTSTATUS.ahk" { NTSTATUS }

/**
 * Deletes a security context.
 * @remarks
 * SSP/APs must implement the <b>SpDeleteContext</b> function; however, the actual name given to the implementation is up to the developer.
 * 
 * A pointer to the <b>SpDeleteContext</b> function is available in the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/ns-ntsecpkg-secpkg_function_table">SECPKG_FUNCTION_TABLE</a> structure received from the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-splsamodeinitializefn">SpLsaModeInitialize</a> function.
 * @see https://learn.microsoft.com/windows/win32/api/ntsecpkg/nc-ntsecpkg-kspdeletecontextfn
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct KspDeleteContextFn {
    value : IntPtr

    __value {
        set {
            if (value is KspDeleteContextFn) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer} ContextId A handle to the security context to delete.
     * @param {Pointer<Pointer>} LsaContextId 
     * @returns {NTSTATUS} If the function succeeds, return STATUS_SUCCESS.
     * 
     * If the function fails, return an <b>NTSTATUS</b> code that indicates the reason it failed. The following table lists a common reason for failure and the error code that the function should return.
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
    Call(ContextId, LsaContextId) {
        LsaContextIdMarshal := LsaContextId is VarRef ? "ptr*" : "ptr"

        result := DllCall(this.value, IntPtr, ContextId, LsaContextIdMarshal, LsaContextId, NTSTATUS)
        NTSTATUS.ThrowIfError(result.value)
        return result
    }

    /**
     * A KspDeleteContextFn that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends KspDeleteContextFn {
        /**
         * Creates a KspDeleteContextFn pointer that invokes the given AHK function when called.
         * @param {Func(IntPtr, "ptr*") => NTSTATUS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [IntPtr, "ptr*", NTSTATUS])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
