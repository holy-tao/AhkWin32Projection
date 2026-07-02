#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\..\..\Foundation\LUID.ahk" { LUID }
#Import "..\..\..\Foundation\NTSTATUS.ahk" { NTSTATUS }

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct PLSA_OPEN_TOKEN_BY_LOGON_ID {
    value : IntPtr

    __value {
        set {
            if (value is PLSA_OPEN_TOKEN_BY_LOGON_ID) {
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
     * @param {Pointer<HANDLE>} RetTokenHandle 
     * @returns {NTSTATUS} 
     */
    Call(LogonId, RetTokenHandle) {
        result := DllCall(this.value, LUID.Ptr, LogonId, HANDLE.Ptr, RetTokenHandle, NTSTATUS)
        NTSTATUS.ThrowIfError(result.value)
        return result
    }

    /**
     * A PLSA_OPEN_TOKEN_BY_LOGON_ID that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PLSA_OPEN_TOKEN_BY_LOGON_ID {
        /**
         * Creates a PLSA_OPEN_TOKEN_BY_LOGON_ID pointer that invokes the given AHK function when called.
         * @param {Func(LUID, HANDLE) => NTSTATUS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [LUID.Ptr, HANDLE.Ptr, NTSTATUS])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
