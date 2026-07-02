#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\HGROUPSET.ahk" { HGROUPSET }
#Import ".\HGROUP.ahk" { HGROUP }

/**
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct PCLUSAPI_ADD_CLUSTER_GROUP_TO_GROUP_GROUPSET_DEPENDENCY {
    value : IntPtr

    __value {
        set {
            if (value is PCLUSAPI_ADD_CLUSTER_GROUP_TO_GROUP_GROUPSET_DEPENDENCY) {
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
     * @param {HGROUPSET} hProviderGroupSet 
     * @returns {Integer} 
     */
    Call(hDependentGroup, hProviderGroupSet) {
        result := DllCall(this.value, HGROUP, hDependentGroup, HGROUPSET, hProviderGroupSet, UInt32)
        return result
    }

    /**
     * A PCLUSAPI_ADD_CLUSTER_GROUP_TO_GROUP_GROUPSET_DEPENDENCY that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PCLUSAPI_ADD_CLUSTER_GROUP_TO_GROUP_GROUPSET_DEPENDENCY {
        /**
         * Creates a PCLUSAPI_ADD_CLUSTER_GROUP_TO_GROUP_GROUPSET_DEPENDENCY pointer that invokes the given AHK function when called.
         * @param {Func(HGROUP, HGROUPSET) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HGROUP, HGROUPSET, UInt32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
