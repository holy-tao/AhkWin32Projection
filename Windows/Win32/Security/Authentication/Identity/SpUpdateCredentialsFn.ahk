#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\NTSTATUS.ahk" { NTSTATUS }

/**
 * Updates the credentials associated with the specified context. (SpUpdateCredentialsFn)
 * @remarks
 * A pointer to the <b>SpUpdateCredentialsFn</b> function is available in the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/ns-ntsecpkg-secpkg_function_table">SECPKG_FUNCTION_TABLE</a> structure received from the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-splsamodeinitializefn">SpLsaModeInitialize</a> function.
 * @see https://learn.microsoft.com/windows/win32/api/ntsecpkg/nc-ntsecpkg-spupdatecredentialsfn
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct SpUpdateCredentialsFn {
    value : IntPtr

    __value {
        set {
            if (value is SpUpdateCredentialsFn) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer} ContextHandle A handle to the context to update.
     * @param {Pointer<Guid>} CredType 
     * @param {Integer} FlatCredUIContextLength The size, in characters, of the buffer specified by  the <i>FlatCredUIContext</i> parameter.
     * @param {Integer} FlatCredUIContext A string that specifies the updated credentials.
     * @returns {NTSTATUS} If the function succeeds, return <b>STATUS_SUCCESS</b>, or an informational status code.
     * 
     * If the function fails, return an <b>NTSTATUS</b> error code that indicates the reason it failed. For more information, see Remarks.
     */
    Call(ContextHandle, CredType, FlatCredUIContextLength, FlatCredUIContext) {
        result := DllCall(this.value, IntPtr, ContextHandle, Guid.Ptr, CredType, UInt32, FlatCredUIContextLength, IntPtr, FlatCredUIContext, NTSTATUS)
        NTSTATUS.ThrowIfError(result.value)
        return result
    }

    /**
     * A SpUpdateCredentialsFn that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends SpUpdateCredentialsFn {
        /**
         * Creates a SpUpdateCredentialsFn pointer that invokes the given AHK function when called.
         * @param {Func(IntPtr, Guid, UInt32, IntPtr) => NTSTATUS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [IntPtr, Guid.Ptr, UInt32, IntPtr, NTSTATUS])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
