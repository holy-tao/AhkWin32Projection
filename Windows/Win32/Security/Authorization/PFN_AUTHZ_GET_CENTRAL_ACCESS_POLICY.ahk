#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\PSID.ahk" { PSID }
#Import ".\AUTHZ_CLIENT_CONTEXT_HANDLE.ahk" { AUTHZ_CLIENT_CONTEXT_HANDLE }

/**
 * @namespace Windows.Win32.Security.Authorization
 */
export default struct PFN_AUTHZ_GET_CENTRAL_ACCESS_POLICY {
    value : IntPtr

    __value {
        set {
            if (value is PFN_AUTHZ_GET_CENTRAL_ACCESS_POLICY) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {AUTHZ_CLIENT_CONTEXT_HANDLE} hAuthzClientContext 
     * @param {PSID} capid 
     * @param {Pointer<Void>} pArgs 
     * @param {Pointer<BOOL>} pCentralAccessPolicyApplicable 
     * @param {Pointer<Pointer<Void>>} ppCentralAccessPolicy 
     * @returns {BOOL} 
     */
    Call(hAuthzClientContext, capid, pArgs, pCentralAccessPolicyApplicable, ppCentralAccessPolicy) {
        pArgsMarshal := pArgs is VarRef ? "ptr" : "ptr"
        pCentralAccessPolicyApplicableMarshal := pCentralAccessPolicyApplicable is VarRef ? "int*" : "ptr"
        ppCentralAccessPolicyMarshal := ppCentralAccessPolicy is VarRef ? "ptr*" : "ptr"

        result := DllCall(this.value, AUTHZ_CLIENT_CONTEXT_HANDLE, hAuthzClientContext, PSID, capid, pArgsMarshal, pArgs, pCentralAccessPolicyApplicableMarshal, pCentralAccessPolicyApplicable, ppCentralAccessPolicyMarshal, ppCentralAccessPolicy, BOOL)
        return result
    }

    /**
     * A PFN_AUTHZ_GET_CENTRAL_ACCESS_POLICY that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFN_AUTHZ_GET_CENTRAL_ACCESS_POLICY {
        /**
         * Creates a PFN_AUTHZ_GET_CENTRAL_ACCESS_POLICY pointer that invokes the given AHK function when called.
         * @param {Func(AUTHZ_CLIENT_CONTEXT_HANDLE, PSID, "ptr", BOOL, "ptr*") => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 5)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 5 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [AUTHZ_CLIENT_CONTEXT_HANDLE, PSID, "ptr", BOOL.Ptr, "ptr*", BOOL])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
