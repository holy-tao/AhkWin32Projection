#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\LUID.ahk" { LUID }
#Import "..\..\..\Foundation\NTSTATUS.ahk" { NTSTATUS }

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct PLSA_CREATE_LOGON_SESSION {
    value : IntPtr

    __value {
        set {
            if (value is PLSA_CREATE_LOGON_SESSION) {
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
     * A PLSA_CREATE_LOGON_SESSION that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PLSA_CREATE_LOGON_SESSION {
        /**
         * Creates a PLSA_CREATE_LOGON_SESSION pointer that invokes the given AHK function when called.
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
