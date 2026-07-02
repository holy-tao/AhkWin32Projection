#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\LSA_UNICODE_STRING.ahk" { LSA_UNICODE_STRING }
#Import "..\..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct PSAM_CREDENTIAL_UPDATE_REGISTER_ROUTINE {
    value : IntPtr

    __value {
        set {
            if (value is PSAM_CREDENTIAL_UPDATE_REGISTER_ROUTINE) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<LSA_UNICODE_STRING>} CredentialName 
     * @returns {BOOLEAN} 
     */
    Call(CredentialName) {
        result := DllCall(this.value, LSA_UNICODE_STRING.Ptr, CredentialName, BOOLEAN)
        return result
    }

    /**
     * A PSAM_CREDENTIAL_UPDATE_REGISTER_ROUTINE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PSAM_CREDENTIAL_UPDATE_REGISTER_ROUTINE {
        /**
         * Creates a PSAM_CREDENTIAL_UPDATE_REGISTER_ROUTINE pointer that invokes the given AHK function when called.
         * @param {Func(LSA_UNICODE_STRING) => BOOLEAN} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [LSA_UNICODE_STRING.Ptr, BOOLEAN])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
