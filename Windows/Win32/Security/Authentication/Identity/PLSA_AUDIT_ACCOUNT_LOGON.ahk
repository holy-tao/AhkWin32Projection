#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }
#Import "..\..\..\Foundation\NTSTATUS.ahk" { NTSTATUS }
#Import ".\LSA_UNICODE_STRING.ahk" { LSA_UNICODE_STRING }

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct PLSA_AUDIT_ACCOUNT_LOGON {
    value : IntPtr

    __value {
        set {
            if (value is PLSA_AUDIT_ACCOUNT_LOGON) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Integer} AuditId 
     * @param {BOOLEAN} Success 
     * @param {Pointer<LSA_UNICODE_STRING>} Source 
     * @param {Pointer<LSA_UNICODE_STRING>} ClientName 
     * @param {Pointer<LSA_UNICODE_STRING>} MappedName 
     * @param {NTSTATUS} _Status 
     * @returns {NTSTATUS} 
     */
    Call(AuditId, Success, Source, ClientName, MappedName, _Status) {
        result := DllCall(this.value, UInt32, AuditId, BOOLEAN, Success, LSA_UNICODE_STRING.Ptr, Source, LSA_UNICODE_STRING.Ptr, ClientName, LSA_UNICODE_STRING.Ptr, MappedName, NTSTATUS, _Status, NTSTATUS)
        NTSTATUS.ThrowIfError(result)
        return result
    }

    /**
     * A PLSA_AUDIT_ACCOUNT_LOGON that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PLSA_AUDIT_ACCOUNT_LOGON {
        /**
         * Creates a PLSA_AUDIT_ACCOUNT_LOGON pointer that invokes the given AHK function when called.
         * @param {Func(UInt32, BOOLEAN, LSA_UNICODE_STRING, LSA_UNICODE_STRING, LSA_UNICODE_STRING, NTSTATUS) => NTSTATUS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 6)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 6 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [UInt32, BOOLEAN, LSA_UNICODE_STRING.Ptr, LSA_UNICODE_STRING.Ptr, LSA_UNICODE_STRING.Ptr, NTSTATUS, NTSTATUS])
        }

        __Delete() => CallbackFree(this.value)
    }
}
