#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\ACE_HEADER.ahk" { ACE_HEADER }
#Import ".\AUTHZ_CLIENT_CONTEXT_HANDLE.ahk" { AUTHZ_CLIENT_CONTEXT_HANDLE }

/**
 * @namespace Windows.Win32.Security.Authorization
 */
export default struct PFN_AUTHZ_DYNAMIC_ACCESS_CHECK {
    value : IntPtr

    __value {
        set {
            if (value is PFN_AUTHZ_DYNAMIC_ACCESS_CHECK) {
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
     * @param {Pointer<ACE_HEADER>} pAce 
     * @param {Pointer<Void>} pArgs 
     * @param {Pointer<BOOL>} pbAceApplicable 
     * @returns {BOOL} 
     */
    Call(hAuthzClientContext, pAce, pArgs, pbAceApplicable) {
        pArgsMarshal := pArgs is VarRef ? "ptr" : "ptr"
        pbAceApplicableMarshal := pbAceApplicable is VarRef ? "int*" : "ptr"

        result := DllCall(this.value, AUTHZ_CLIENT_CONTEXT_HANDLE, hAuthzClientContext, ACE_HEADER.Ptr, pAce, pArgsMarshal, pArgs, pbAceApplicableMarshal, pbAceApplicable, BOOL)
        return result
    }

    /**
     * A PFN_AUTHZ_DYNAMIC_ACCESS_CHECK that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFN_AUTHZ_DYNAMIC_ACCESS_CHECK {
        /**
         * Creates a PFN_AUTHZ_DYNAMIC_ACCESS_CHECK pointer that invokes the given AHK function when called.
         * @param {Func(AUTHZ_CLIENT_CONTEXT_HANDLE, ACE_HEADER, "ptr", BOOL) => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [AUTHZ_CLIENT_CONTEXT_HANDLE, ACE_HEADER.Ptr, "ptr", BOOL.Ptr, BOOL])
        }

        __Delete() => CallbackFree(this.value)
    }
}
