#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\NTSTATUS.ahk" { NTSTATUS }

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct PLSA_GET_USER_CREDENTIALS {
    value : IntPtr

    __value {
        set {
            if (value is PLSA_GET_USER_CREDENTIALS) {
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
     * @param {Pointer<Pointer<Void>>} PrimaryCreds 
     * @param {Pointer<Integer>} PrimaryCredsSize 
     * @param {Pointer<Pointer<Void>>} SupplementalCreds 
     * @param {Pointer<Integer>} SupplementalCredsSize 
     * @returns {NTSTATUS} 
     */
    Call(UserHandle, PrimaryCreds, PrimaryCredsSize, SupplementalCreds, SupplementalCredsSize) {
        UserHandleMarshal := UserHandle is VarRef ? "ptr" : "ptr"
        PrimaryCredsMarshal := PrimaryCreds is VarRef ? "ptr*" : "ptr"
        PrimaryCredsSizeMarshal := PrimaryCredsSize is VarRef ? "uint*" : "ptr"
        SupplementalCredsMarshal := SupplementalCreds is VarRef ? "ptr*" : "ptr"
        SupplementalCredsSizeMarshal := SupplementalCredsSize is VarRef ? "uint*" : "ptr"

        result := DllCall(this.value, UserHandleMarshal, UserHandle, PrimaryCredsMarshal, PrimaryCreds, PrimaryCredsSizeMarshal, PrimaryCredsSize, SupplementalCredsMarshal, SupplementalCreds, SupplementalCredsSizeMarshal, SupplementalCredsSize, NTSTATUS)
        NTSTATUS.ThrowIfError(result)
        return result
    }

    /**
     * A PLSA_GET_USER_CREDENTIALS that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PLSA_GET_USER_CREDENTIALS {
        /**
         * Creates a PLSA_GET_USER_CREDENTIALS pointer that invokes the given AHK function when called.
         * @param {Func("ptr", "ptr*", "uint*", "ptr*", "uint*") => NTSTATUS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 5)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 5 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", "ptr*", "uint*", "ptr*", "uint*", NTSTATUS])
        }

        __Delete() => CallbackFree(this.value)
    }
}
