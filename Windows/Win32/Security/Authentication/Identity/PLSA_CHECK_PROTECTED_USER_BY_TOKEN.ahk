#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }
#Import "..\..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\..\..\Foundation\NTSTATUS.ahk" { NTSTATUS }

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct PLSA_CHECK_PROTECTED_USER_BY_TOKEN {
    value : IntPtr

    __value {
        set {
            if (value is PLSA_CHECK_PROTECTED_USER_BY_TOKEN) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {HANDLE} UserToken 
     * @param {Pointer<BOOLEAN>} ProtectedUser 
     * @returns {NTSTATUS} 
     */
    Call(UserToken, ProtectedUser) {
        ProtectedUserMarshal := ProtectedUser is VarRef ? "char*" : "ptr"

        result := DllCall(this.value, HANDLE, UserToken, ProtectedUserMarshal, ProtectedUser, NTSTATUS)
        NTSTATUS.ThrowIfError(result)
        return result
    }

    /**
     * A PLSA_CHECK_PROTECTED_USER_BY_TOKEN that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PLSA_CHECK_PROTECTED_USER_BY_TOKEN {
        /**
         * Creates a PLSA_CHECK_PROTECTED_USER_BY_TOKEN pointer that invokes the given AHK function when called.
         * @param {Func(HANDLE, BOOLEAN) => NTSTATUS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HANDLE, BOOLEAN.Ptr, NTSTATUS])
        }

        __Delete() => CallbackFree(this.value)
    }
}
