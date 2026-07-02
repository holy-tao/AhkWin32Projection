#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\SID_AND_ATTRIBUTES.ahk" { SID_AND_ATTRIBUTES }
#Import ".\AUTHZ_CLIENT_CONTEXT_HANDLE.ahk" { AUTHZ_CLIENT_CONTEXT_HANDLE }

/**
 * @namespace Windows.Win32.Security.Authorization
 */
export default struct PFN_AUTHZ_COMPUTE_DYNAMIC_GROUPS {
    value : IntPtr

    __value {
        set {
            if (value is PFN_AUTHZ_COMPUTE_DYNAMIC_GROUPS) {
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
     * @param {Pointer<Void>} Args 
     * @param {Pointer<Pointer<SID_AND_ATTRIBUTES>>} pSidAttrArray 
     * @param {Pointer<Integer>} pSidCount 
     * @param {Pointer<Pointer<SID_AND_ATTRIBUTES>>} pRestrictedSidAttrArray 
     * @param {Pointer<Integer>} pRestrictedSidCount 
     * @returns {BOOL} 
     */
    Call(hAuthzClientContext, Args, pSidAttrArray, pSidCount, pRestrictedSidAttrArray, pRestrictedSidCount) {
        ArgsMarshal := Args is VarRef ? "ptr" : "ptr"
        pSidAttrArrayMarshal := pSidAttrArray is VarRef ? "ptr*" : "ptr"
        pSidCountMarshal := pSidCount is VarRef ? "uint*" : "ptr"
        pRestrictedSidAttrArrayMarshal := pRestrictedSidAttrArray is VarRef ? "ptr*" : "ptr"
        pRestrictedSidCountMarshal := pRestrictedSidCount is VarRef ? "uint*" : "ptr"

        result := DllCall(this.value, AUTHZ_CLIENT_CONTEXT_HANDLE, hAuthzClientContext, ArgsMarshal, Args, pSidAttrArrayMarshal, pSidAttrArray, pSidCountMarshal, pSidCount, pRestrictedSidAttrArrayMarshal, pRestrictedSidAttrArray, pRestrictedSidCountMarshal, pRestrictedSidCount, BOOL)
        return result
    }

    /**
     * A PFN_AUTHZ_COMPUTE_DYNAMIC_GROUPS that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFN_AUTHZ_COMPUTE_DYNAMIC_GROUPS {
        /**
         * Creates a PFN_AUTHZ_COMPUTE_DYNAMIC_GROUPS pointer that invokes the given AHK function when called.
         * @param {Func(AUTHZ_CLIENT_CONTEXT_HANDLE, "ptr", "ptr*", "uint*", "ptr*", "uint*") => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 6)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 6 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [AUTHZ_CLIENT_CONTEXT_HANDLE, "ptr", "ptr*", "uint*", "ptr*", "uint*", BOOL])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
