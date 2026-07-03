#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\NTSTATUS.ahk" { NTSTATUS }

/**
 * Retrieves context information from a credential provider. (SpGetCredUIContextFn)
 * @remarks
 * A pointer to the <b>SpGetCredUIContextFn</b> function is available in the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/ns-ntsecpkg-secpkg_function_table">SECPKG_FUNCTION_TABLE</a> structure received from the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-splsamodeinitializefn">SpLsaModeInitialize</a> function.
 * @see https://learn.microsoft.com/windows/win32/api/ntsecpkg/nc-ntsecpkg-spgetcreduicontextfn
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct SpGetCredUIContextFn {
    value : IntPtr

    __value {
        set {
            if (value is SpGetCredUIContextFn) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer} ContextHandle A handle to the context for which to get information.
     * @param {Pointer<Guid>} CredType 
     * @param {Pointer<Integer>} FlatCredUIContextLength The size, in characters, of the buffer received by the <i>FlatCredUIContext</i> parameter.
     * @param {Pointer<Pointer<Integer>>} FlatCredUIContext A pointer to an array of characters that specifies information about the context specified by the <i>ContextHandle</i> parameter.
     * @returns {NTSTATUS} If the function succeeds, return <b>STATUS_SUCCESS</b> or an informational status code.
     * 
     * If the function fails, return an <b>NTSTATUS</b> error code that indicates the reason it failed. For more information, see Remarks.
     */
    Call(ContextHandle, CredType, FlatCredUIContextLength, FlatCredUIContext) {
        FlatCredUIContextLengthMarshal := FlatCredUIContextLength is VarRef ? "uint*" : "ptr"
        FlatCredUIContextMarshal := FlatCredUIContext is VarRef ? "ptr*" : "ptr"

        result := DllCall(this.value, IntPtr, ContextHandle, Guid.Ptr, CredType, FlatCredUIContextLengthMarshal, FlatCredUIContextLength, FlatCredUIContextMarshal, FlatCredUIContext, NTSTATUS)
        NTSTATUS.ThrowIfError(result)
        return result
    }

    /**
     * A SpGetCredUIContextFn that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends SpGetCredUIContextFn {
        /**
         * Creates a SpGetCredUIContextFn pointer that invokes the given AHK function when called.
         * @param {Func(IntPtr, Guid, "uint*", "ptr*") => NTSTATUS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [IntPtr, Guid.Ptr, "uint*", "ptr*", NTSTATUS])
        }

        __Delete() => CallbackFree(this.value)
    }
}
