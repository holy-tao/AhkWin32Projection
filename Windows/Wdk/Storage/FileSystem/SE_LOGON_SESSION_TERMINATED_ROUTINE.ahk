#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\Foundation\LUID.ahk" { LUID }
#Import "..\..\..\Win32\Foundation\NTSTATUS.ahk" { NTSTATUS }

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 */
export default struct SE_LOGON_SESSION_TERMINATED_ROUTINE {
    value : IntPtr

    __value {
        set {
            if (value is SE_LOGON_SESSION_TERMINATED_ROUTINE) {
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
     * @returns {NTSTATUS} 
     */
    Call(LogonId) {
        result := DllCall(this.value, LUID.Ptr, LogonId, NTSTATUS)
        NTSTATUS.ThrowIfError(result)
        return result
    }

    /**
     * A SE_LOGON_SESSION_TERMINATED_ROUTINE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends SE_LOGON_SESSION_TERMINATED_ROUTINE {
        /**
         * Creates a SE_LOGON_SESSION_TERMINATED_ROUTINE pointer that invokes the given AHK function when called.
         * @param {Func(LUID) => NTSTATUS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [LUID.Ptr, NTSTATUS])
        }

        __Delete() => CallbackFree(this.value)
    }
}
