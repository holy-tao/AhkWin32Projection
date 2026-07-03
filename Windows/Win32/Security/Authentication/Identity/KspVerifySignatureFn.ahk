#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\NTSTATUS.ahk" { NTSTATUS }
#Import ".\SecBufferDesc.ahk" { SecBufferDesc }

/**
 * Verifies that the message received is correct according to the signature.
 * @remarks
 * The signature verified by the <b>SpVerifySignature</b> function is created by the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-kspmakesignaturefn">SpMakeSignature</a> function, used by a message sender.
 * 
 * SSP/APs must implement the <b>SpVerifySignature</b> function; however, the actual name given to the implementation is up to the developer.
 * 
 * A pointer to the <b>SpVerifySignature</b> function is available in the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/ns-ntsecpkg-secpkg_user_function_table">SECPKG_USER_FUNCTION_TABLE</a> structure received from the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-spusermodeinitializefn">SpUserModeInitialize</a> function.
 * @see https://learn.microsoft.com/windows/win32/api/ntsecpkg/nc-ntsecpkg-kspverifysignaturefn
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct KspVerifySignatureFn {
    value : IntPtr

    __value {
        set {
            if (value is KspVerifySignatureFn) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer} ContextId 
     * @param {Pointer<SecBufferDesc>} Message Pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/sspi/ns-sspi-secbufferdesc">SecBufferDesc</a> structure containing the message to verify.
     * @param {Integer} MessageSeqNo Sequence number to assign to the message. Sequence numbers are optional and are used as protection against loss and insertion of messages. A value of zero indicates that sequence numbers are not in use.
     * @param {Pointer<Integer>} pfQOP Pointer to package-specific flags that indicate the quality of protection.
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
    Call(ContextId, Message, MessageSeqNo, pfQOP) {
        pfQOPMarshal := pfQOP is VarRef ? "uint*" : "ptr"

        result := DllCall(this.value, IntPtr, ContextId, SecBufferDesc.Ptr, Message, UInt32, MessageSeqNo, pfQOPMarshal, pfQOP, NTSTATUS)
        NTSTATUS.ThrowIfError(result)
        return result
    }

    /**
     * A KspVerifySignatureFn that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends KspVerifySignatureFn {
        /**
         * Creates a KspVerifySignatureFn pointer that invokes the given AHK function when called.
         * @param {Func(IntPtr, SecBufferDesc, UInt32, "uint*") => NTSTATUS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [IntPtr, SecBufferDesc.Ptr, UInt32, "uint*", NTSTATUS])
        }

        __Delete() => CallbackFree(this.value)
    }
}
