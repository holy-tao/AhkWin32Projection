#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\SECURITY_LOGON_TYPE.ahk" { SECURITY_LOGON_TYPE }
#Import ".\SECPKG_SURROGATE_LOGON.ahk" { SECPKG_SURROGATE_LOGON }
#Import "..\..\..\Foundation\NTSTATUS.ahk" { NTSTATUS }

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct PLSA_AP_PRE_LOGON_USER_SURROGATE {
    value : IntPtr

    __value {
        set {
            if (value is PLSA_AP_PRE_LOGON_USER_SURROGATE) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Pointer<Void>>} ClientRequest 
     * @param {SECURITY_LOGON_TYPE} LogonType 
     * @param {Integer} ProtocolSubmitBuffer 
     * @param {Pointer<Void>} ClientBufferBase 
     * @param {Integer} SubmitBufferSize 
     * @param {Pointer<SECPKG_SURROGATE_LOGON>} SurrogateLogon 
     * @param {Pointer<Integer>} SubStatus 
     * @returns {NTSTATUS} 
     */
    Call(ClientRequest, LogonType, ProtocolSubmitBuffer, ClientBufferBase, SubmitBufferSize, SurrogateLogon, SubStatus) {
        ClientRequestMarshal := ClientRequest is VarRef ? "ptr*" : "ptr"
        ClientBufferBaseMarshal := ClientBufferBase is VarRef ? "ptr" : "ptr"
        SubStatusMarshal := SubStatus is VarRef ? "int*" : "ptr"

        result := DllCall(this.value, ClientRequestMarshal, ClientRequest, SECURITY_LOGON_TYPE, LogonType, IntPtr, ProtocolSubmitBuffer, ClientBufferBaseMarshal, ClientBufferBase, UInt32, SubmitBufferSize, SECPKG_SURROGATE_LOGON.Ptr, SurrogateLogon, SubStatusMarshal, SubStatus, NTSTATUS)
        NTSTATUS.ThrowIfError(result.value)
        return result
    }

    /**
     * A PLSA_AP_PRE_LOGON_USER_SURROGATE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PLSA_AP_PRE_LOGON_USER_SURROGATE {
        /**
         * Creates a PLSA_AP_PRE_LOGON_USER_SURROGATE pointer that invokes the given AHK function when called.
         * @param {Func("ptr*", SECURITY_LOGON_TYPE, IntPtr, "ptr", UInt32, SECPKG_SURROGATE_LOGON, "int*") => NTSTATUS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 7)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 7 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr*", SECURITY_LOGON_TYPE, IntPtr, "ptr", UInt32, SECPKG_SURROGATE_LOGON.Ptr, "int*", NTSTATUS])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
