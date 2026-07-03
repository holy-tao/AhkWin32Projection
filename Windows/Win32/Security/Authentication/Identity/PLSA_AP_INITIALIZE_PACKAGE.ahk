#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\NTSTATUS.ahk" { NTSTATUS }
#Import ".\LSA_DISPATCH_TABLE.ahk" { LSA_DISPATCH_TABLE }
#Import ".\LSA_STRING.ahk" { LSA_STRING }

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct PLSA_AP_INITIALIZE_PACKAGE {
    value : IntPtr

    __value {
        set {
            if (value is PLSA_AP_INITIALIZE_PACKAGE) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Integer} AuthenticationPackageId 
     * @param {Pointer<LSA_DISPATCH_TABLE>} LsaDispatchTable 
     * @param {Pointer<LSA_STRING>} Database 
     * @param {Pointer<LSA_STRING>} Confidentiality 
     * @param {Pointer<Pointer<LSA_STRING>>} AuthenticationPackageName 
     * @returns {NTSTATUS} 
     */
    Call(AuthenticationPackageId, LsaDispatchTable, Database, Confidentiality, AuthenticationPackageName) {
        AuthenticationPackageNameMarshal := AuthenticationPackageName is VarRef ? "ptr*" : "ptr"

        result := DllCall(this.value, UInt32, AuthenticationPackageId, LSA_DISPATCH_TABLE.Ptr, LsaDispatchTable, LSA_STRING.Ptr, Database, LSA_STRING.Ptr, Confidentiality, AuthenticationPackageNameMarshal, AuthenticationPackageName, NTSTATUS)
        NTSTATUS.ThrowIfError(result.value)
        return result
    }

    /**
     * A PLSA_AP_INITIALIZE_PACKAGE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PLSA_AP_INITIALIZE_PACKAGE {
        /**
         * Creates a PLSA_AP_INITIALIZE_PACKAGE pointer that invokes the given AHK function when called.
         * @param {Func(UInt32, LSA_DISPATCH_TABLE, LSA_STRING, LSA_STRING, "ptr*") => NTSTATUS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 5)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 5 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [UInt32, LSA_DISPATCH_TABLE.Ptr, LSA_STRING.Ptr, LSA_STRING.Ptr, "ptr*", NTSTATUS])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
