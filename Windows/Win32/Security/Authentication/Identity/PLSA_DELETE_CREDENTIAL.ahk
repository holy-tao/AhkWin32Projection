#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\LUID.ahk" { LUID }
#Import "..\..\..\Foundation\NTSTATUS.ahk" { NTSTATUS }
#Import ".\LSA_STRING.ahk" { LSA_STRING }

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct PLSA_DELETE_CREDENTIAL {
    value : IntPtr

    __value {
        set {
            if (value is PLSA_DELETE_CREDENTIAL) {
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
     * @param {Pointer<LSA_STRING>} PrimaryKeyValue 
     * @returns {NTSTATUS} 
     */
    Call(LogonId, AuthenticationPackage, PrimaryKeyValue) {
        result := DllCall(this.value, LUID.Ptr, LogonId, UInt32, AuthenticationPackage, LSA_STRING.Ptr, PrimaryKeyValue, NTSTATUS)
        NTSTATUS.ThrowIfError(result)
        return result
    }

    /**
     * A PLSA_DELETE_CREDENTIAL that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PLSA_DELETE_CREDENTIAL {
        /**
         * Creates a PLSA_DELETE_CREDENTIAL pointer that invokes the given AHK function when called.
         * @param {Func(LUID, UInt32, LSA_STRING) => NTSTATUS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [LUID.Ptr, UInt32, LSA_STRING.Ptr, NTSTATUS])
        }

        __Delete() => CallbackFree(this.value)
    }
}
