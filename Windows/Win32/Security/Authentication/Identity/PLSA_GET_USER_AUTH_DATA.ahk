#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\NTSTATUS.ahk" { NTSTATUS }

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct PLSA_GET_USER_AUTH_DATA {
    value : IntPtr

    __value {
        set {
            if (value is PLSA_GET_USER_AUTH_DATA) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Void>} UserHandle 
     * @param {Pointer<Pointer<Integer>>} UserAuthData 
     * @param {Pointer<Integer>} UserAuthDataSize 
     * @returns {NTSTATUS} 
     */
    Call(UserHandle, UserAuthData, UserAuthDataSize) {
        UserHandleMarshal := UserHandle is VarRef ? "ptr" : "ptr"
        UserAuthDataMarshal := UserAuthData is VarRef ? "ptr*" : "ptr"
        UserAuthDataSizeMarshal := UserAuthDataSize is VarRef ? "uint*" : "ptr"

        result := DllCall(this.value, UserHandleMarshal, UserHandle, UserAuthDataMarshal, UserAuthData, UserAuthDataSizeMarshal, UserAuthDataSize, NTSTATUS)
        NTSTATUS.ThrowIfError(result)
        return result
    }

    /**
     * A PLSA_GET_USER_AUTH_DATA that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PLSA_GET_USER_AUTH_DATA {
        /**
         * Creates a PLSA_GET_USER_AUTH_DATA pointer that invokes the given AHK function when called.
         * @param {Func("ptr", "ptr*", "uint*") => NTSTATUS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", "ptr*", "uint*", NTSTATUS])
        }

        __Delete() => CallbackFree(this.value)
    }
}
