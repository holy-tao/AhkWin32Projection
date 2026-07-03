#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\HGROUP.ahk" { HGROUP }

/**
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct PCLUSAPI_ADD_CLUSTER_GROUP_DEPENDENCY_EX {
    value : IntPtr

    __value {
        set {
            if (value is PCLUSAPI_ADD_CLUSTER_GROUP_DEPENDENCY_EX) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {HGROUP} hDependentGroup 
     * @param {HGROUP} hProviderGroup 
     * @param {PWSTR} lpszReason 
     * @returns {Integer} 
     */
    Call(hDependentGroup, hProviderGroup, lpszReason) {
        lpszReason := lpszReason is String ? StrPtr(lpszReason) : lpszReason

        result := DllCall(this.value, HGROUP, hDependentGroup, HGROUP, hProviderGroup, "ptr", lpszReason, UInt32)
        return result
    }

    /**
     * A PCLUSAPI_ADD_CLUSTER_GROUP_DEPENDENCY_EX that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PCLUSAPI_ADD_CLUSTER_GROUP_DEPENDENCY_EX {
        /**
         * Creates a PCLUSAPI_ADD_CLUSTER_GROUP_DEPENDENCY_EX pointer that invokes the given AHK function when called.
         * @param {Func(HGROUP, HGROUP, PWSTR) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HGROUP, HGROUP, PWSTR, UInt32])
        }

        __Delete() => CallbackFree(this.value)
    }
}
