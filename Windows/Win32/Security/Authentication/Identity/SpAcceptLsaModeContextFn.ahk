#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\SecBufferDesc.ahk" { SecBufferDesc }
#Import "..\..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }
#Import ".\SecBuffer.ahk" { SecBuffer }
#Import "..\..\..\Foundation\NTSTATUS.ahk" { NTSTATUS }

/**
 * Server dispatch function used to create a security context shared by a server and client.
 * @remarks
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-spinitlsamodecontextfn">SpInitLsaModeContext</a> is the client-side function for creating a security context.
 * 
 * SSP/APs must implement the <b>SpAcceptLsaModeContext</b> function. The actual name given to the implementation is up to the developer.
 * 
 * A pointer to the <b>SpAcceptLsaModeContext</b> function is available in the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/ns-ntsecpkg-secpkg_function_table">SECPKG_FUNCTION_TABLE</a> structure received from the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-splsamodeinitializefn">SpLsaModeInitialize</a> function.
 * @see https://learn.microsoft.com/windows/win32/api/ntsecpkg/nc-ntsecpkg-spacceptlsamodecontextfn
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct SpAcceptLsaModeContextFn {
    value : IntPtr

    __value {
        set {
            if (value is SpAcceptLsaModeContextFn) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer} CredentialHandle Optional. Handle to the credentials to use for the context.
     * @param {Pointer} ContextHandle Optional. Handle to the current context.
     * @param {Pointer<SecBufferDesc>} InputBuffer Pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/sspi/ns-sspi-secbufferdesc">SecBufferDesc</a> structure containing information from the client.
     * @param {Integer} ContextRequirements Flags indicating the context requirements. The following table lists the valid values.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ASC_REQ_DELEGATE"></a><a id="asc_req_delegate"></a><dl>
     * <dt><b>ASC_REQ_DELEGATE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The server is allowed to impersonate the client.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ASC_REQ_MUTUAL_AUTH"></a><a id="asc_req_mutual_auth"></a><dl>
     * <dt><b>ASC_REQ_MUTUAL_AUTH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Both the client and the server are required to prove their identity.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ASC_REQ_REPLAY_DETECT"></a><a id="asc_req_replay_detect"></a><dl>
     * <dt><b>ASC_REQ_REPLAY_DETECT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">security context</a> will support the detection of replayed packets.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ASC_REQ_SEQUENCE_DETECT"></a><a id="asc_req_sequence_detect"></a><dl>
     * <dt><b>ASC_REQ_SEQUENCE_DETECT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The security context will support the detection of out-of-order messages.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ASC_REQ_USE_SESSION_KEY"></a><a id="asc_req_use_session_key"></a><dl>
     * <dt><b>ASC_REQ_USE_SESSION_KEY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A new <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">session key</a> must be negotiated.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ASC_REQ_PROMPT_FOR_CREDS"></a><a id="asc_req_prompt_for_creds"></a><dl>
     * <dt><b>ASC_REQ_PROMPT_FOR_CREDS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * If the client is an interactive user, the package must, if possible, prompt the user for the appropriate credentials.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ASC_REQ_USE_SUPPLIED_CREDS"></a><a id="asc_req_use_supplied_creds"></a><dl>
     * <dt><b>ASC_REQ_USE_SUPPLIED_CREDS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The input buffer contains package-specific credential information which should be used to authenticate the connection.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ASC_REQ_ALLOCATE_MEMORY"></a><a id="asc_req_allocate_memory"></a><dl>
     * <dt><b>ASC_REQ_ALLOCATE_MEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The package must allocate memory. The caller must eventually call the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-freecontextbuffer">FreeContextBuffer</a> function to free memory allocated by the security package.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ASC_REQ_USE_DCE_STYLE"></a><a id="asc_req_use_dce_style"></a><dl>
     * <dt><b>ASC_REQ_USE_DCE_STYLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The caller expects a three-leg mutual authentication transaction.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ASC_REQ_DATAGRAM"></a><a id="asc_req_datagram"></a><dl>
     * <dt><b>ASC_REQ_DATAGRAM</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A datagram-type communications channel should be used. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SecAuthN/datagram-contexts">Datagram Contexts</a>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ASC_REQ_CONNECTION"></a><a id="asc_req_connection"></a><dl>
     * <dt><b>ASC_REQ_CONNECTION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A connection-type communications channel should be used. For more information see 
     * <a href="https://docs.microsoft.com/windows/desktop/SecAuthN/connection-oriented-contexts">Connection-Oriented Contexts</a>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ASC_REQ_EXTENDED_ERROR"></a><a id="asc_req_extended_error"></a><dl>
     * <dt><b>ASC_REQ_EXTENDED_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * If the context fails, generate an error reply message to send back to the client.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ASC_REQ_STREAM"></a><a id="asc_req_stream"></a><dl>
     * <dt><b>ASC_REQ_STREAM</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A stream-type communications channel should be used. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SecAuthN/stream-contexts">Stream Contexts</a>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ASC_REQ_INTEGRITY"></a><a id="asc_req_integrity"></a><dl>
     * <dt><b>ASC_REQ_INTEGRITY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Buffer integrity can be verified; however, replayed and out-of-sequence messages will not be detected.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Integer} TargetDataRep Flag indicating the data representation, such as byte ordering, to use. Contains SECURITY_NATIVE_DREP or SECURITY_NETWORK_DREP.
     * @param {Pointer<Pointer>} NewContextHandle Pointer to an <b>LSA_SEC_HANDLE</b>. On the first call to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-acceptsecuritycontext">AcceptSecurityContext</a>, this pointer receives the new context handle. On subsequent calls, <i>NewContextHandle</i> can be the same as the handle specified in the <i>ContextHandle</i> parameter.
     * @param {Pointer<SecBufferDesc>} OutputBuffer Pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/sspi/ns-sspi-secbufferdesc">SecBufferDesc</a> structure that receives information to be sent to the client.
     * @param {Pointer<Integer>} ContextAttributes Pointer to flags specifying the context attributes that the server supports. For a list of valid values, see the <i>ContextRequirements</i> parameter.
     * @param {Pointer<Integer>} ExpirationTime Pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/SecAuthN/timestamp">TimeStamp</a> that receives the expiration time for the context.
     * @param {Pointer<BOOLEAN>} MappedContext Pointer to a Boolean value. Set <i>MappedContext</i> to <b>TRUE</b> if the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">security package</a> implements the user-mode SSP/AP functions.
     * @param {Pointer<SecBuffer>} ContextData Optional. Pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/sspi/ns-sspi-secbuffer">SecBuffer</a> structure that receives context-specific data to copy when creating the user-mode <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">security context</a>. Memory for <i>ContextData</i> must be allocated using the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-lsa_allocate_lsa_heap">AllocateLsaHeap</a> function. The <a href="https://docs.microsoft.com/windows/desktop/SecGloss/l-gly">Local Security Authority</a> (LSA) will free the memory.
     * @returns {NTSTATUS} If the <b>SpAcceptLsaModeContext</b> function succeeds and no more processing is required to establish the security context, return STATUS_SUCCESS. If additional processing is required, the function should return SEC_I_CONTINUE_NEEDED.
     * 
     * If the function fails to create the security context for any other reason, return an NTSTATUS code indicating the reason.
     */
    Call(CredentialHandle, ContextHandle, InputBuffer, ContextRequirements, TargetDataRep, NewContextHandle, OutputBuffer, ContextAttributes, ExpirationTime, MappedContext, ContextData) {
        NewContextHandleMarshal := NewContextHandle is VarRef ? "ptr*" : "ptr"
        ContextAttributesMarshal := ContextAttributes is VarRef ? "uint*" : "ptr"
        ExpirationTimeMarshal := ExpirationTime is VarRef ? "int64*" : "ptr"
        MappedContextMarshal := MappedContext is VarRef ? "char*" : "ptr"

        result := DllCall(this.value, IntPtr, CredentialHandle, IntPtr, ContextHandle, SecBufferDesc.Ptr, InputBuffer, UInt32, ContextRequirements, UInt32, TargetDataRep, NewContextHandleMarshal, NewContextHandle, SecBufferDesc.Ptr, OutputBuffer, ContextAttributesMarshal, ContextAttributes, ExpirationTimeMarshal, ExpirationTime, MappedContextMarshal, MappedContext, SecBuffer.Ptr, ContextData, NTSTATUS)
        NTSTATUS.ThrowIfError(result.value)
        return result
    }

    /**
     * A SpAcceptLsaModeContextFn that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends SpAcceptLsaModeContextFn {
        /**
         * Creates a SpAcceptLsaModeContextFn pointer that invokes the given AHK function when called.
         * @param {Func(IntPtr, IntPtr, SecBufferDesc, UInt32, UInt32, "ptr*", SecBufferDesc, "uint*", "int64*", BOOLEAN, SecBuffer) => NTSTATUS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 11)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 11 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [IntPtr, IntPtr, SecBufferDesc.Ptr, UInt32, UInt32, "ptr*", SecBufferDesc.Ptr, "uint*", "int64*", BOOLEAN.Ptr, SecBuffer.Ptr, NTSTATUS])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
