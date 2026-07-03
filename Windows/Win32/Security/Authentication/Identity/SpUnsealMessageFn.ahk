#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\NTSTATUS.ahk" { NTSTATUS }
#Import ".\SecBufferDesc.ahk" { SecBufferDesc }

/**
 * Decrypts a message that was previously encrypted with the SpSealMessage function.
 * @remarks
 * SSP/APs must implement the <b>SpUnsealMessage</b> function; however, the actual name given to the implementation is up to the developer.
 * 
 * A pointer to the <b>SpUnsealMessage</b> function is available in the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/ns-ntsecpkg-secpkg_user_function_table">SECPKG_USER_FUNCTION_TABLE</a> structure received from the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-spusermodeinitializefn">SpUserModeInitialize</a> function.
 * @see https://learn.microsoft.com/windows/win32/api/ntsecpkg/nc-ntsecpkg-spunsealmessagefn
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct SpUnsealMessageFn {
    value : IntPtr

    __value {
        set {
            if (value is SpUnsealMessageFn) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer} ContextHandle Handle of the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">security context</a> used to seal the message.
     * @param {Pointer<SecBufferDesc>} MessageBuffers Pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/sspi/ns-sspi-secbufferdesc">SecBufferDesc</a> structure that contains the message buffers and a signature buffer.
     * @param {Integer} MessageSequenceNumber Sequence number to assign to the message. Sequence numbers are optional and are used as protection against loss and insertion of messages. A value of zero indicates that sequence numbers are not in use.
     * @param {Pointer<Integer>} QualityOfProtection Not used.
     * @returns {NTSTATUS} If the function succeeds, return STATUS_SUCCESS.
     * 
     * If the function fails, return an <b>NTSTATUS</b> code that indicates the reason it failed.
     */
    Call(ContextHandle, MessageBuffers, MessageSequenceNumber, QualityOfProtection) {
        QualityOfProtectionMarshal := QualityOfProtection is VarRef ? "uint*" : "ptr"

        result := DllCall(this.value, IntPtr, ContextHandle, SecBufferDesc.Ptr, MessageBuffers, UInt32, MessageSequenceNumber, QualityOfProtectionMarshal, QualityOfProtection, NTSTATUS)
        NTSTATUS.ThrowIfError(result)
        return result
    }

    /**
     * A SpUnsealMessageFn that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends SpUnsealMessageFn {
        /**
         * Creates a SpUnsealMessageFn pointer that invokes the given AHK function when called.
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
