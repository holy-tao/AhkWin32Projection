#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PESILO.ahk" { PESILO }
#Import "..\..\..\Win32\Foundation\LUID.ahk" { LUID }
#Import "..\..\..\Win32\Foundation\NTSTATUS.ahk" { NTSTATUS }

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 */
export default struct SE_LOGON_SESSION_TERMINATED_ROUTINE_EX {
    value : IntPtr

    __value {
        set {
            if (value is SE_LOGON_SESSION_TERMINATED_ROUTINE_EX) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<LUID>} LogonId 
     * @param {PESILO} pServerSilo 
     * @param {Pointer<Void>} _Context 
     * @returns {NTSTATUS} 
     */
    Call(LogonId, pServerSilo, _Context) {
        _ContextMarshal := _Context is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, LUID.Ptr, LogonId, PESILO, pServerSilo, _ContextMarshal, _Context, NTSTATUS)
        NTSTATUS.ThrowIfError(result)
        return result
    }

    /**
     * A SE_LOGON_SESSION_TERMINATED_ROUTINE_EX that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends SE_LOGON_SESSION_TERMINATED_ROUTINE_EX {
        /**
         * Creates a SE_LOGON_SESSION_TERMINATED_ROUTINE_EX pointer that invokes the given AHK function when called.
         * @param {Func(LUID, PESILO, "ptr") => NTSTATUS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [LUID.Ptr, PESILO, "ptr", NTSTATUS])
        }

        __Delete() => CallbackFree(this.value)
    }
}
