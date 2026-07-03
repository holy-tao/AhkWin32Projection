#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\RADIUS_ATTRIBUTE.ahk" { RADIUS_ATTRIBUTE }

/**
 * The RadiusExtensionFreeAttributes function is an application-defined function and is called by NPS to free the memory occupied by attributes returned by RadiusExtensionProcessEx.
 * @remarks
 * If you implement 
 * <a href="https://docs.microsoft.com/windows/desktop/api/authif/nc-authif-pradius_extension_process_ex">RadiusExtensionProcessEx</a>, you must also implement 
 * <b>RadiusExtensionFreeAttributes</b>.
 * @see https://learn.microsoft.com/windows/win32/api/authif/nc-authif-pradius_extension_free_attributes
 * @namespace Windows.Win32.NetworkManagement.NetworkPolicyServer
 */
export default struct PRADIUS_EXTENSION_FREE_ATTRIBUTES {
    value : IntPtr

    __value {
        set {
            if (value is PRADIUS_EXTENSION_FREE_ATTRIBUTES) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<RADIUS_ATTRIBUTE>} pAttrs Pointer to an array of attributes. The 
     * <b>RadiusExtensionFreeAttributes</b> function should deallocate the memory occupied by these attributes.
     * 
     * These attributes were returned in the <i>pOutAttrs</i> parameter in a previous call to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/authif/nc-authif-pradius_extension_process_ex">RadiusExtensionProcessEx</a> function.
     * @returns {String} Nothing - always returns an empty string
     */
    Call(pAttrs) {
        DllCall(this.value, RADIUS_ATTRIBUTE.Ptr, pAttrs)
    }

    /**
     * A PRADIUS_EXTENSION_FREE_ATTRIBUTES that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PRADIUS_EXTENSION_FREE_ATTRIBUTES {
        /**
         * Creates a PRADIUS_EXTENSION_FREE_ATTRIBUTES pointer that invokes the given AHK function when called.
         * @param {Func(RADIUS_ATTRIBUTE) => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [RADIUS_ATTRIBUTE.Ptr, IntPtr])
        }

        __Delete() => CallbackFree(this.value)
    }
}
