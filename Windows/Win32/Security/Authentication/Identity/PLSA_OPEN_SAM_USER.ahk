#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }
#Import "..\..\..\Foundation\NTSTATUS.ahk" { NTSTATUS }
#Import ".\SECPKG_NAME_TYPE.ahk" { SECPKG_NAME_TYPE }
#Import ".\SECURITY_STRING.ahk" { SECURITY_STRING }

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct PLSA_OPEN_SAM_USER {
    value : IntPtr

    __value {
        set {
            if (value is PLSA_OPEN_SAM_USER) {
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
     * @param {BOOLEAN} AllowGuest 
     * @param {Integer} Reserved 
     * @param {Pointer<Pointer<Void>>} UserHandle 
     * @returns {NTSTATUS} 
     */
    Call(Name, NameType, Prefix, AllowGuest, Reserved, UserHandle) {
        UserHandleMarshal := UserHandle is VarRef ? "ptr*" : "ptr"

        result := DllCall(this.value, SECURITY_STRING.Ptr, Name, SECPKG_NAME_TYPE, NameType, SECURITY_STRING.Ptr, Prefix, BOOLEAN, AllowGuest, UInt32, Reserved, UserHandleMarshal, UserHandle, NTSTATUS)
        NTSTATUS.ThrowIfError(result)
        return result
    }

    /**
     * A PLSA_OPEN_SAM_USER that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PLSA_OPEN_SAM_USER {
        /**
         * Creates a PLSA_OPEN_SAM_USER pointer that invokes the given AHK function when called.
         * @param {Func(SECURITY_STRING, SECPKG_NAME_TYPE, SECURITY_STRING, BOOLEAN, UInt32, "ptr*") => NTSTATUS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 6)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 6 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [SECURITY_STRING.Ptr, SECPKG_NAME_TYPE, SECURITY_STRING.Ptr, BOOLEAN, UInt32, "ptr*", NTSTATUS])
        }

        __Delete() => CallbackFree(this.value)
    }
}
