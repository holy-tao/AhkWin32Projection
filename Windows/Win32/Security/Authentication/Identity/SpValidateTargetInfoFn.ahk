#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\NTSTATUS.ahk" { NTSTATUS }
#Import ".\SECPKG_TARGETINFO.ahk" { SECPKG_TARGETINFO }

/**
 * Validates that the specified SECPKG_TARGETINFO structure represents a valid target.
 * @remarks
 * SSP/APs must implement the <b>SpValidateTargetInfo</b> function; however, the actual name given to the implementation is up to the developer.
 * 
 * A pointer to the <b>SpValidateTargetInfo</b> function is available in the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/ns-ntsecpkg-secpkg_function_table">SECPKG_FUNCTION_TABLE</a> structure received from the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-splsamodeinitializefn">SpLsaModeInitialize</a> function.
 * @see https://learn.microsoft.com/windows/win32/api/ntsecpkg/nc-ntsecpkg-spvalidatetargetinfofn
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct SpValidateTargetInfoFn {
    value : IntPtr

    __value {
        set {
            if (value is SpValidateTargetInfoFn) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Pointer<Void>>} ClientRequest A pointer to an opaque 
     * <a href="https://docs.microsoft.com/windows/desktop/SecAuthN/plsa-client-request">LSA_CLIENT_REQUEST</a> data structure that contains information about the LSA client's authentication request. A custom authentication package should pass in the value received during the client's call to the function, such as 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-lsa_ap_call_package">LsaApCallPackage</a> or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-lsa_ap_logon_user">LsaApLogonUser</a>, that returns the output parameter.
     * @param {Integer} ProtocolSubmitBuffer A pointer to the input buffer sent by the client.
     * @param {Pointer<Void>} ClientBufferBase The base address of the input buffer, in the client's address space.
     * @param {Integer} SubmitBufferLength The size, in bytes, of the <i>ProtocolSubmitBuffer</i> buffer.
     * @param {Pointer<SECPKG_TARGETINFO>} TargetInfo A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/ns-ntsecpkg-secpkg_targetinfo">SECPKG_TARGETINFO</a> structure that specifies the target to validate.
     * @returns {NTSTATUS} If the function succeeds and the specified target is a valid target, return STATUS_SUCCESS.
     * 
     * If the function fails, return an <b>NTSTATUS</b> code that indicates the reason it failed.
     */
    Call(ClientRequest, ProtocolSubmitBuffer, ClientBufferBase, SubmitBufferLength, TargetInfo) {
        ClientRequestMarshal := ClientRequest is VarRef ? "ptr*" : "ptr"
        ClientBufferBaseMarshal := ClientBufferBase is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, ClientRequestMarshal, ClientRequest, IntPtr, ProtocolSubmitBuffer, ClientBufferBaseMarshal, ClientBufferBase, UInt32, SubmitBufferLength, SECPKG_TARGETINFO.Ptr, TargetInfo, NTSTATUS)
        NTSTATUS.ThrowIfError(result)
        return result
    }

    /**
     * A SpValidateTargetInfoFn that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends SpValidateTargetInfoFn {
        /**
         * Creates a SpValidateTargetInfoFn pointer that invokes the given AHK function when called.
         * @param {Func("ptr*", IntPtr, "ptr", UInt32, SECPKG_TARGETINFO) => NTSTATUS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 5)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 5 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr*", IntPtr, "ptr", UInt32, SECPKG_TARGETINFO.Ptr, NTSTATUS])
        }

        __Delete() => CallbackFree(this.value)
    }
}
