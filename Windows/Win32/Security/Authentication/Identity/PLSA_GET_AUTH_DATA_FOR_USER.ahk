#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\NTSTATUS.ahk" { NTSTATUS }
#Import ".\LSA_UNICODE_STRING.ahk" { LSA_UNICODE_STRING }
#Import ".\SECPKG_NAME_TYPE.ahk" { SECPKG_NAME_TYPE }
#Import ".\SECURITY_STRING.ahk" { SECURITY_STRING }

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct PLSA_GET_AUTH_DATA_FOR_USER {
    value : IntPtr

    __value {
        set {
            if (value is PLSA_GET_AUTH_DATA_FOR_USER) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<SECURITY_STRING>} Name 
     * @param {SECPKG_NAME_TYPE} NameType 
     * @param {Pointer<SECURITY_STRING>} Prefix 
     * @param {Pointer<Pointer<Integer>>} UserAuthData 
     * @param {Pointer<Integer>} UserAuthDataSize 
     * @param {Pointer<LSA_UNICODE_STRING>} UserFlatName 
     * @returns {NTSTATUS} 
     */
    Call(Name, NameType, Prefix, UserAuthData, UserAuthDataSize, UserFlatName) {
        UserAuthDataMarshal := UserAuthData is VarRef ? "ptr*" : "ptr"
        UserAuthDataSizeMarshal := UserAuthDataSize is VarRef ? "uint*" : "ptr"

        result := DllCall(this.value, SECURITY_STRING.Ptr, Name, SECPKG_NAME_TYPE, NameType, SECURITY_STRING.Ptr, Prefix, UserAuthDataMarshal, UserAuthData, UserAuthDataSizeMarshal, UserAuthDataSize, LSA_UNICODE_STRING.Ptr, UserFlatName, NTSTATUS)
        NTSTATUS.ThrowIfError(result.value)
        return result
    }

    /**
     * A PLSA_GET_AUTH_DATA_FOR_USER that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PLSA_GET_AUTH_DATA_FOR_USER {
        /**
         * Creates a PLSA_GET_AUTH_DATA_FOR_USER pointer that invokes the given AHK function when called.
         * @param {Func(SECURITY_STRING, SECPKG_NAME_TYPE, SECURITY_STRING, "ptr*", "uint*", LSA_UNICODE_STRING) => NTSTATUS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 6)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 6 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [SECURITY_STRING.Ptr, SECPKG_NAME_TYPE, SECURITY_STRING.Ptr, "ptr*", "uint*", LSA_UNICODE_STRING.Ptr, NTSTATUS])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
