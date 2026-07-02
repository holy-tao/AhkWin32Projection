#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import ".\LSA_UNICODE_STRING.ahk" { LSA_UNICODE_STRING }
#Import ".\PLSA_REDIRECTED_LOGON_CALLBACK.ahk" { PLSA_REDIRECTED_LOGON_CALLBACK }
#Import "..\..\..\Foundation\NTSTATUS.ahk" { NTSTATUS }
#Import ".\PLSA_REDIRECTED_LOGON_CLEANUP_CALLBACK.ahk" { PLSA_REDIRECTED_LOGON_CLEANUP_CALLBACK }

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct SpGetRemoteCredGuardSupplementalCredsFn {
    value : IntPtr

    __value {
        set {
            if (value is SpGetRemoteCredGuardSupplementalCredsFn) {
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
     * @param {Pointer<LSA_UNICODE_STRING>} TargetName 
     * @param {Pointer<HANDLE>} RedirectedLogonHandle 
     * @param {Pointer<Pointer<PLSA_REDIRECTED_LOGON_CALLBACK>>} Callback 
     * @param {Pointer<Pointer<PLSA_REDIRECTED_LOGON_CLEANUP_CALLBACK>>} CleanupCallback 
     * @param {Pointer<Integer>} SupplementalCredsSize 
     * @param {Pointer<Pointer<Void>>} SupplementalCreds 
     * @returns {NTSTATUS} 
     */
    Call(CredHandle, TargetName, RedirectedLogonHandle, Callback, CleanupCallback, SupplementalCredsSize, SupplementalCreds) {
        CallbackMarshal := Callback is VarRef ? "ptr*" : "ptr"
        CleanupCallbackMarshal := CleanupCallback is VarRef ? "ptr*" : "ptr"
        SupplementalCredsSizeMarshal := SupplementalCredsSize is VarRef ? "uint*" : "ptr"
        SupplementalCredsMarshal := SupplementalCreds is VarRef ? "ptr*" : "ptr"

        result := DllCall(this.value, IntPtr, CredHandle, LSA_UNICODE_STRING.Ptr, TargetName, HANDLE.Ptr, RedirectedLogonHandle, CallbackMarshal, Callback, CleanupCallbackMarshal, CleanupCallback, SupplementalCredsSizeMarshal, SupplementalCredsSize, SupplementalCredsMarshal, SupplementalCreds, NTSTATUS)
        NTSTATUS.ThrowIfError(result.value)
        return result
    }

    /**
     * A SpGetRemoteCredGuardSupplementalCredsFn that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends SpGetRemoteCredGuardSupplementalCredsFn {
        /**
         * Creates a SpGetRemoteCredGuardSupplementalCredsFn pointer that invokes the given AHK function when called.
         * @param {Func(IntPtr, LSA_UNICODE_STRING, HANDLE, "ptr*", "ptr*", "uint*", "ptr*") => NTSTATUS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 7)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 7 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [IntPtr, LSA_UNICODE_STRING.Ptr, HANDLE.Ptr, "ptr*", "ptr*", "uint*", "ptr*", NTSTATUS])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
