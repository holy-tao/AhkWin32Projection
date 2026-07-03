#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\SID_AND_ATTRIBUTES.ahk" { SID_AND_ATTRIBUTES }

/**
 * @namespace Windows.Win32.Security.Authorization
 */
export default struct PFN_AUTHZ_FREE_DYNAMIC_GROUPS {
    value : IntPtr

    __value {
        set {
            if (value is PFN_AUTHZ_FREE_DYNAMIC_GROUPS) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<SID_AND_ATTRIBUTES>} pSidAttrArray 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(pSidAttrArray) {
        DllCall(this.value, SID_AND_ATTRIBUTES.Ptr, pSidAttrArray)
    }

    /**
     * A PFN_AUTHZ_FREE_DYNAMIC_GROUPS that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFN_AUTHZ_FREE_DYNAMIC_GROUPS {
        /**
         * Creates a PFN_AUTHZ_FREE_DYNAMIC_GROUPS pointer that invokes the given AHK function when called.
         * @param {Func(SID_AND_ATTRIBUTES) => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [SID_AND_ATTRIBUTES.Ptr, IntPtr])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
