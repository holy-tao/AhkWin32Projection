#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\SecBufferDesc.ahk" { SecBufferDesc }
#Import "..\..\..\Foundation\NTSTATUS.ahk" { NTSTATUS }

/**
 * Encrypts a message exchanged between a client and server.
 * @remarks
 * Messages encrypted by the sender using the <b>SpSealMessage</b> function are decrypted using the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-spunsealmessagefn">SpUnsealMessage</a> function.
 * 
 * SSP/APs must implement the <b>SpSealMessage</b> function; however, the actual name given to the implementation is up to the developer.
 * 
 * A pointer to the <b>SpSealMessage</b> function is available in the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/ns-ntsecpkg-secpkg_user_function_table">SECPKG_USER_FUNCTION_TABLE</a> structure received from the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-spusermodeinitializefn">SpUserModeInitialize</a> function.
 * @see https://learn.microsoft.com/windows/win32/api/ntsecpkg/nc-ntsecpkg-spsealmessagefn
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct SpSealMessageFn {
    value : IntPtr

    __value {
        set {
            if (value is SpSealMessageFn) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer} ContextHandle Handle of the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">security context</a> used to sign the message.
     * @param {Integer} QualityOfProtection Specifies package-specific flags that indicate the quality of protection. An SSP/AP can use this parameter to enable the selection of cryptographic algorithms.
     * @param {Pointer<SecBufferDesc>} MessageBuffers Pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/sspi/ns-sspi-secbufferdesc">SecBufferDesc</a> structure that contains message buffers. Only one of these message buffers can be of type SECBUFFER_DATA, and it contains the message to be encrypted. The buffer cannot have the SECBUFFER_READONLY attribute because the encryption is done in-place.
     * @param {Integer} MessageSequenceNumber Sequence number to assign to the message. Sequence numbers are optional and are used as protection against loss and insertion of messages. A value of zero indicates that sequence numbers are not in use.
     * @returns {NTSTATUS} If the function succeeds, return STATUS_SUCCESS.
     * 
     * If the function fails, return an <b>NTSTATUS</b> code that indicates the reason it failed. The following table lists common reasons for failure and the error codes that the function should return.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>STATUS_INVALID_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The context could not be found or was not configured for message integrity.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>STATUS_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The signature buffer could not be found or was too small.
     * 
     * </td>
     * </tr>
     * </table>
     */
    Call(ContextHandle, QualityOfProtection, MessageBuffers, MessageSequenceNumber) {
        result := DllCall(this.value, IntPtr, ContextHandle, UInt32, QualityOfProtection, SecBufferDesc.Ptr, MessageBuffers, UInt32, MessageSequenceNumber, NTSTATUS)
        NTSTATUS.ThrowIfError(result.value)
        return result
    }

    /**
     * A SpSealMessageFn that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends SpSealMessageFn {
        /**
         * Creates a SpSealMessageFn pointer that invokes the given AHK function when called.
         * @param {Func(IntPtr, UInt32, SecBufferDesc, UInt32) => NTSTATUS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [IntPtr, UInt32, SecBufferDesc.Ptr, UInt32, NTSTATUS])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
