#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\..\..\Foundation\NTSTATUS.ahk" { NTSTATUS }

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct PLSA_REDIRECTED_LOGON_CALLBACK {
    value : IntPtr

    __value {
        set {
            if (value is PLSA_REDIRECTED_LOGON_CALLBACK) {
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
     * @param {Pointer<Void>} _Buffer 
     * @param {Integer} BufferLength 
     * @param {Pointer<Pointer<Void>>} ReturnBuffer 
     * @param {Pointer<Integer>} ReturnBufferLength 
     * @returns {NTSTATUS} 
     */
    Call(RedirectedLogonHandle, _Buffer, BufferLength, ReturnBuffer, ReturnBufferLength) {
        _BufferMarshal := _Buffer is VarRef ? "ptr" : "ptr"
        ReturnBufferMarshal := ReturnBuffer is VarRef ? "ptr*" : "ptr"
        ReturnBufferLengthMarshal := ReturnBufferLength is VarRef ? "uint*" : "ptr"

        result := DllCall(this.value, HANDLE, RedirectedLogonHandle, _BufferMarshal, _Buffer, UInt32, BufferLength, ReturnBufferMarshal, ReturnBuffer, ReturnBufferLengthMarshal, ReturnBufferLength, NTSTATUS)
        NTSTATUS.ThrowIfError(result)
        return result
    }

    /**
     * A PLSA_REDIRECTED_LOGON_CALLBACK that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PLSA_REDIRECTED_LOGON_CALLBACK {
        /**
         * Creates a PLSA_REDIRECTED_LOGON_CALLBACK pointer that invokes the given AHK function when called.
         * @param {Func(HANDLE, "ptr", UInt32, "ptr*", "uint*") => NTSTATUS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 5)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 5 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HANDLE, "ptr", UInt32, "ptr*", "uint*", NTSTATUS])
        }

        __Delete() => CallbackFree(this.value)
    }
}
