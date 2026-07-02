#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\..\..\Foundation\NTSTATUS.ahk" { NTSTATUS }

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct PLSA_REDIRECTED_LOGON_GET_LOGON_CREDS {
    value : IntPtr

    __value {
        set {
            if (value is PLSA_REDIRECTED_LOGON_GET_LOGON_CREDS) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {HANDLE} RedirectedLogonHandle 
     * @param {Pointer<Pointer<Integer>>} LogonBuffer 
     * @param {Pointer<Integer>} LogonBufferLength 
     * @returns {NTSTATUS} 
     */
    Call(RedirectedLogonHandle, LogonBuffer, LogonBufferLength) {
        LogonBufferMarshal := LogonBuffer is VarRef ? "ptr*" : "ptr"
        LogonBufferLengthMarshal := LogonBufferLength is VarRef ? "uint*" : "ptr"

        result := DllCall(this.value, HANDLE, RedirectedLogonHandle, LogonBufferMarshal, LogonBuffer, LogonBufferLengthMarshal, LogonBufferLength, NTSTATUS)
        NTSTATUS.ThrowIfError(result.value)
        return result
    }

    /**
     * A PLSA_REDIRECTED_LOGON_GET_LOGON_CREDS that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PLSA_REDIRECTED_LOGON_GET_LOGON_CREDS {
        /**
         * Creates a PLSA_REDIRECTED_LOGON_GET_LOGON_CREDS pointer that invokes the given AHK function when called.
         * @param {Func(HANDLE, "ptr*", "uint*") => NTSTATUS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HANDLE, "ptr*", "uint*", NTSTATUS])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
