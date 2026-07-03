#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\NTSTATUS.ahk" { NTSTATUS }
#Import ".\LSA_UNICODE_STRING.ahk" { LSA_UNICODE_STRING }

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct PLSA_CALL_PACKAGE {
    value : IntPtr

    __value {
        set {
            if (value is PLSA_CALL_PACKAGE) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<LSA_UNICODE_STRING>} AuthenticationPackage 
     * @param {Integer} ProtocolSubmitBuffer 
     * @param {Integer} SubmitBufferLength 
     * @param {Pointer<Pointer<Void>>} ProtocolReturnBuffer 
     * @param {Pointer<Integer>} ReturnBufferLength 
     * @param {Pointer<Integer>} ProtocolStatus 
     * @returns {NTSTATUS} 
     */
    Call(AuthenticationPackage, ProtocolSubmitBuffer, SubmitBufferLength, ProtocolReturnBuffer, ReturnBufferLength, ProtocolStatus) {
        ProtocolReturnBufferMarshal := ProtocolReturnBuffer is VarRef ? "ptr*" : "ptr"
        ReturnBufferLengthMarshal := ReturnBufferLength is VarRef ? "uint*" : "ptr"
        ProtocolStatusMarshal := ProtocolStatus is VarRef ? "int*" : "ptr"

        result := DllCall(this.value, LSA_UNICODE_STRING.Ptr, AuthenticationPackage, IntPtr, ProtocolSubmitBuffer, UInt32, SubmitBufferLength, ProtocolReturnBufferMarshal, ProtocolReturnBuffer, ReturnBufferLengthMarshal, ReturnBufferLength, ProtocolStatusMarshal, ProtocolStatus, NTSTATUS)
        NTSTATUS.ThrowIfError(result)
        return result
    }

    /**
     * A PLSA_CALL_PACKAGE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PLSA_CALL_PACKAGE {
        /**
         * Creates a PLSA_CALL_PACKAGE pointer that invokes the given AHK function when called.
         * @param {Func(LSA_UNICODE_STRING, IntPtr, UInt32, "ptr*", "uint*", "int*") => NTSTATUS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 6)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 6 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [LSA_UNICODE_STRING.Ptr, IntPtr, UInt32, "ptr*", "uint*", "int*", NTSTATUS])
        }

        __Delete() => CallbackFree(this.value)
    }
}
