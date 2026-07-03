#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\..\..\Foundation\NTSTATUS.ahk" { NTSTATUS }
#Import ".\LSA_UNICODE_STRING.ahk" { LSA_UNICODE_STRING }

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct SpGetRemoteCredGuardLogonBufferFn {
    value : IntPtr

    __value {
        set {
            if (value is SpGetRemoteCredGuardLogonBufferFn) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer} CredHandle 
     * @param {Pointer} ContextHandle 
     * @param {Pointer<LSA_UNICODE_STRING>} TargetName 
     * @param {Pointer<HANDLE>} RedirectedLogonHandle 
     * @param {Pointer<Pointer<PLSA_REDIRECTED_LOGON_CALLBACK>>} Callback 
     * @param {Pointer<Pointer<PLSA_REDIRECTED_LOGON_CLEANUP_CALLBACK>>} CleanupCallback 
     * @param {Pointer<Integer>} LogonBufferSize 
     * @param {Pointer<Pointer<Void>>} LogonBuffer 
     * @returns {NTSTATUS} 
     */
    Call(CredHandle, ContextHandle, TargetName, RedirectedLogonHandle, Callback, CleanupCallback, LogonBufferSize, LogonBuffer) {
        CallbackMarshal := Callback is VarRef ? "ptr*" : "ptr"
        CleanupCallbackMarshal := CleanupCallback is VarRef ? "ptr*" : "ptr"
        LogonBufferSizeMarshal := LogonBufferSize is VarRef ? "uint*" : "ptr"
        LogonBufferMarshal := LogonBuffer is VarRef ? "ptr*" : "ptr"

        result := DllCall(this.value, IntPtr, CredHandle, IntPtr, ContextHandle, LSA_UNICODE_STRING.Ptr, TargetName, HANDLE.Ptr, RedirectedLogonHandle, CallbackMarshal, Callback, CleanupCallbackMarshal, CleanupCallback, LogonBufferSizeMarshal, LogonBufferSize, LogonBufferMarshal, LogonBuffer, NTSTATUS)
        NTSTATUS.ThrowIfError(result)
        return result
    }

    /**
     * A SpGetRemoteCredGuardLogonBufferFn that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends SpGetRemoteCredGuardLogonBufferFn {
        /**
         * Creates a SpGetRemoteCredGuardLogonBufferFn pointer that invokes the given AHK function when called.
         * @param {Func(IntPtr, IntPtr, LSA_UNICODE_STRING, HANDLE, "ptr*", "ptr*", "uint*", "ptr*") => NTSTATUS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 8)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 8 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [IntPtr, IntPtr, LSA_UNICODE_STRING.Ptr, HANDLE.Ptr, "ptr*", "ptr*", "uint*", "ptr*", NTSTATUS])
        }

        __Delete() => CallbackFree(this.value)
    }
}
