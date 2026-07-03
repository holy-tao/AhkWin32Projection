#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct PSET_RESOURCE_WPR_POLICY_ROUTINE {
    value : IntPtr

    __value {
        set {
            if (value is PSET_RESOURCE_WPR_POLICY_ROUTINE) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer} ResourceHandle 
     * @param {Integer} WprPolicyFlags 
     * @returns {Integer} 
     */
    Call(ResourceHandle, WprPolicyFlags) {
        result := DllCall(this.value, IntPtr, ResourceHandle, UInt32, WprPolicyFlags, UInt32)
        return result
    }

    /**
     * A PSET_RESOURCE_WPR_POLICY_ROUTINE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PSET_RESOURCE_WPR_POLICY_ROUTINE {
        /**
         * Creates a PSET_RESOURCE_WPR_POLICY_ROUTINE pointer that invokes the given AHK function when called.
         * @param {Func(IntPtr, UInt32) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [IntPtr, UInt32, UInt32])
        }

        __Delete() => CallbackFree(this.value)
    }
}
