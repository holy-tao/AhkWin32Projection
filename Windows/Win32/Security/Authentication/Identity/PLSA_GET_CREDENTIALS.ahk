#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\LUID.ahk" { LUID }
#Import "..\..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }
#Import "..\..\..\Foundation\NTSTATUS.ahk" { NTSTATUS }
#Import ".\LSA_STRING.ahk" { LSA_STRING }

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct PLSA_GET_CREDENTIALS {
    value : IntPtr

    __value {
        set {
            if (value is PLSA_GET_CREDENTIALS) {
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
     * @param {Integer} AuthenticationPackage 
     * @param {Pointer<Integer>} _QueryContext 
     * @param {BOOLEAN} RetrieveAllCredentials 
     * @param {Pointer<LSA_STRING>} PrimaryKeyValue 
     * @param {Pointer<Integer>} PrimaryKeyLength 
     * @param {Pointer<LSA_STRING>} Credentials 
     * @returns {NTSTATUS} 
     */
    Call(LogonId, AuthenticationPackage, _QueryContext, RetrieveAllCredentials, PrimaryKeyValue, PrimaryKeyLength, Credentials) {
        _QueryContextMarshal := _QueryContext is VarRef ? "uint*" : "ptr"
        PrimaryKeyLengthMarshal := PrimaryKeyLength is VarRef ? "uint*" : "ptr"

        result := DllCall(this.value, LUID.Ptr, LogonId, UInt32, AuthenticationPackage, _QueryContextMarshal, _QueryContext, BOOLEAN, RetrieveAllCredentials, LSA_STRING.Ptr, PrimaryKeyValue, PrimaryKeyLengthMarshal, PrimaryKeyLength, LSA_STRING.Ptr, Credentials, NTSTATUS)
        NTSTATUS.ThrowIfError(result.value)
        return result
    }

    /**
     * A PLSA_GET_CREDENTIALS that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PLSA_GET_CREDENTIALS {
        /**
         * Creates a PLSA_GET_CREDENTIALS pointer that invokes the given AHK function when called.
         * @param {Func(LUID, UInt32, "uint*", BOOLEAN, LSA_STRING, "uint*", LSA_STRING) => NTSTATUS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 7)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 7 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [LUID.Ptr, UInt32, "uint*", BOOLEAN, LSA_STRING.Ptr, "uint*", LSA_STRING.Ptr, NTSTATUS])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
