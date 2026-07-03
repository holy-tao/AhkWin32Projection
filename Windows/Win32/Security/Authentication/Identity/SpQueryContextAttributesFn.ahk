#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\NTSTATUS.ahk" { NTSTATUS }

/**
 * Retrieves the attributes of a security context.
 * @remarks
 * SSP/APs must implement the <b>SpQueryContextAttributes</b> function; however, the actual name given to the implementation is up to the developer.
 * 
 * A pointer to the LSA-mode implementation of the <b>SpQueryContextAttributes</b> function is available in the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/ns-ntsecpkg-secpkg_function_table">SECPKG_FUNCTION_TABLE</a> structure received from the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-splsamodeinitializefn">SpLsaModeInitialize</a> function.
 * 
 * A pointer to the user-mode implementation of the <b>SpQueryContextAttributes</b> function is available in the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/ns-ntsecpkg-secpkg_user_function_table">SECPKG_USER_FUNCTION_TABLE</a> structure received from the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-spusermodeinitializefn">SpUserModeInitialize</a> function.
 * @see https://learn.microsoft.com/windows/win32/api/ntsecpkg/nc-ntsecpkg-spquerycontextattributesfn
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct SpQueryContextAttributesFn {
    value : IntPtr

    __value {
        set {
            if (value is SpQueryContextAttributesFn) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer} ContextHandle A handle to the security context.
     * @param {Integer} ContextAttribute Context attribute to query. For a list of valid values, see the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-querycontextattributesa">QueryContextAttributes (General)</a> function.
     * @param {Pointer<Void>} _Buffer Pointer that receives the address of a buffer containing the requested attributes. Memory for the <i>Buffer</i> parameter should be allocated with the 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa374721(v=vs.85)">AllocateHeap</a> function from the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/ns-ntsecpkg-secpkg_dll_functions">SECPKG_DLL_FUNCTIONS</a> function table in user-mode. In <a href="https://docs.microsoft.com/windows/desktop/SecGloss/l-gly">Local Security Authority</a> (LSA) mode, use the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-lsa_allocate_lsa_heap">AllocateLsaHeap</a> function.
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
    Call(ContextHandle, ContextAttribute, _Buffer) {
        _BufferMarshal := _Buffer is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, IntPtr, ContextHandle, UInt32, ContextAttribute, _BufferMarshal, _Buffer, NTSTATUS)
        NTSTATUS.ThrowIfError(result.value)
        return result
    }

    /**
     * A SpQueryContextAttributesFn that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends SpQueryContextAttributesFn {
        /**
         * Creates a SpQueryContextAttributesFn pointer that invokes the given AHK function when called.
         * @param {Func(IntPtr, UInt32, "ptr") => NTSTATUS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [IntPtr, UInt32, "ptr", NTSTATUS])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
